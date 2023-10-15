# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np
import datetime
import pulp
import sqlite3
from sqlalchemy import create_engine
from common.sql_util import *
import pymysql
import os
import logging
class Schedule():
    def __init__(self, shedule_date="20220319"):
        self.WEIGHT_SPECIAL_SURGERY = 10

        self.date = datetime.datetime.strptime(shedule_date, "%Y-%m-%d")
        self.strf_date = self.date.strftime("%Y-%m-%d")
        # assert self.date.weekday() in [0, 1, 2, 3, 4]
        path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        # self.engineBaseInfo = create_engine('sqlite:////root/project/surgery-brain/surgery_brain/Data/DataBase/BaseInfo.db')
        self.engineBlock = create_engine('sqlite:///'+path+'/surgery_brain/Data/DataBase/Block.db')
        # self.engineSurgery = create_engine('sqlite:////root/project/surgery-brain/surgery_brain/Data/DataBase/Surgery.db')

        # self.connBaseInfo = sqlite3.connect('/root/project/surgery-brain/surgery_brain/Data/DataBase/BaseInfo.db')
        self.connBlock = sqlite3.connect(path+'/surgery_brain/Data/DataBase/Block.db')
        # self.connSurgery = sqlite3.connect('/root/project/surgery-brain/surgery_brain/Data/DataBase/Surgery.db')


        self.__drop_blocks()
        self.__fetch_block_table_names()

    def pre_first_schedule(self):
        # step1:确认当天手术日分配,假设护士长不做调整
        if '当天手术日表终版' not in self.__fetch_block_table_names():
            strWeekday = ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日'][self.date.weekday()]
            strHalfYear = '1-6月' if self.date.month <= 6 else '7-12月'


            # 如果是周六周日 需要获取映射,无映射抛异常
            if "星期六" == strWeekday or strWeekday == "星期日":
                sql = """
                            select 
                                   *
                            from mapping_date od
                            where od.date = '{}'
                            """.format(self.strf_date)
                temp_data = query_all_dict(sql)
                mapping_date = pd.DataFrame(temp_data)
                # print(mapping_date)
                strWeekday = mapping_date["week"][0]



            sql = """
            select 
                   od.operating_room_number as '手术间编号',
                   od.half_year as '半年',
                   od.week as '星期',
                   mti.head_medical_unit  as '所属医疗组',
                   od.affiliated_department as '所属科室',
                   mti2.head_medical_unit as '第二医疗组',
                   od.remarks as '备注'
            from (SELECT
                    t.operating_room_number,
                    t.`week`,
                    t.half_year,
                    t.affiliated_department,
                    t.remarks,
                    t.second_medical_team,
                    substring_index( substring_index( t.subordinate_medical_unit, ',', h.help_topic_id + 1 ), ',',- 1 ) AS subordinate_medical_unit
                FROM operating_day t JOIN mysql.help_topic AS h ON h.help_topic_id < ( char_length( t.subordinate_medical_unit ) - char_length( REPLACE ( t.subordinate_medical_unit, ',', '' ) ) + 1 )
                ) od
            left join medical_team_info mti on mti.name_medical_unit = od.subordinate_medical_unit 
            left join medical_team_info mti2 on mti2.name_medical_unit = od.second_medical_team 
            where od.week = '{}'
              and od.half_year = '{}'
            """.format(strWeekday, strHalfYear)
            # print('pre_first_schedule:sql------------------')
            # print(sql)
            temp_data = query_all_dict(sql)
            # print('pre_first_schedule:data------------------')
            # print(temp_data)
            self._dfBlock = pd.DataFrame(temp_data)

            self.dfBlock = pd.DataFrame(columns=['手术间编号', '医生', '科室', '次排医生'])
            self.dfBlock[['手术间编号', '医生', '科室', '次排医生']] = self._dfBlock[
                ['手术间编号', '所属医疗组', '所属科室', '第二医疗组']].copy()
            self.dfBlock.reset_index(drop=True, inplace=True)

            # TODO:为何只对胸外科的医生进行编码
            LetterList = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
            for i in range(len(self.dfBlock)):
                # 修改胸外科的主刀医生为ABCDEFG……
                if self.dfBlock.loc[i, '科室'] == '胸外科':
                    self.dfBlock.loc[i, '医生'] = LetterList[0]
                    LetterList.pop(0)

            # 向数据库写入名为“当天手术日表初版”的表格
            self.dfBlock.to_sql('当天手术日表初版', self.connBlock, if_exists='replace', index=False)

            """假设护士完成了"""
            self.dfBlock = pd.read_sql_query("select * from 当天手术日表初版", self.engineBlock)
            # 向数据库写入名为“当天手术日表终版”的表格
            self.dfBlock.to_sql('当天手术日表终版', self.connBlock, if_exists='replace', index=False)

        # 让tableView显示“当天手术日表初版”表格
        # step2:确认手术间分配
        # TODO:
        pass

    def do_first_schedule(self):
        """
        # 流程：
        1. 得到有手术日的医生的列表
        2. 对于列表中的每一个医生，检查ta的所有手术
        3. 如果该手术是特殊手术，就按照特殊手术约束来排
        4. 如果该手术是普通手术，就按照手术日来排
        5. 考虑到有两个手术间的医生，要迭代计算手术间总用时
        6. （5）类似doSetInBlockForSurgery函数
        """

        if '当天手术日表终版' not in self.__fetch_block_table_names():
            raise ValueError("请先确认当天手术日分配")
            # QMessageBox.warning(self, '警告', '请先确认当天手术日分配！',QMessageBox.Yes)

        # 如果数据库里没有名为“当天手术日表终版”的表格，说明护士长还没有点击确认当天手术日分配
        self.dfBlock = pd.read_sql_query("select * from 当天手术日表终版", self.engineBlock)
        new_rows = []
        for index, row in self.dfBlock.iterrows():
            department = row['科室']
            if row['医生'] is not None:
                new_row = {'手术间编号': row['手术间编号'], '科室': department, '医生': row['医生'], '是否优先': 1}
                new_rows.append(new_row)
            if row['次排医生'] is not None:
                new_row = {'手术间编号': row['手术间编号'], '科室': department, '医生': row['次排医生'], '是否优先': 0}
                new_rows.append(new_row)
        self.dfBlock = pd.DataFrame(new_rows)

        listDoctorHavingBlock = self.dfBlock['医生'].values.tolist()
        for doctor in self.dfBlock['医生'].unique():
            # 对每个有手术日的医生，执行一次循环
            sql = """
                        select application_number as '申请号',
                               estimated_duration_operation as '预估手术时长',
                               whether_special_operation as '是否为特殊手术',
                               surgical_coding as '手术编码'
                        from surgicalapplicationinfo_python
                        where surgeon = '{}'
                          and pseudo_operation_data like '{}%'
                        """.format(doctor, self.strf_date)
            # print('do_first_schedule:sql ----------------')
            # print(sql)
            temp_data = query_all_dict(sql)
            # print('do_first_schedule:data ----------------')
            # print(temp_data)
            listEntry_tmp = []
            for item_data in temp_data:
                listEntry_tmp.append(tuple(item_data.values()))
            listEntry = listEntry_tmp
            # listEntry = self.connSurgery.execute("select 申请号, 预估手术时长, 是否为特殊手术, 手术编码 "
            #                                      "from 手术申请信息 "
            #                                      "where 主刀医生 = '%s' and 拟手术日期 = '%s'"
            #                                      % (doctor, self.strf_date)).fetchall()
            if listEntry == []:
                continue
            # 如果这名医生没有提交手术申请，则跳到下一个循环

            listRoomID = self.dfBlock[(self.dfBlock['医生'] == doctor)]['手术间编号'].values.tolist()
            # listRoomID是一个列表，它存储了当前医生所拥有的所有手术间的编号（类型：字符串）
            print('listRoomID--------------------')
            # print(listRoomID)
            TotalnumBlock = listDoctorHavingBlock.count(doctor)
            numBlock = listDoctorHavingBlock.count(doctor)
            # TotalnumBlock和numBlock是两个整数类型变量
            # 在当前，它们都表示当前医生所拥有的手术间数量
            # 它们的区别是：
            # TotalnumBlock类似常量，后面不会变化
            # numBlock类似辅助变量，后面可能会减小到1
            listID = [listEntry[i][0] for i in range(len(listEntry))]
            listDuration = [listEntry[i][1] for i in range(len(listEntry))]
            sumSurgeryTime = 0
            sumRoomTime = 0
            for i in range(len(listEntry)):
                if listEntry[i][2] == '是':
                    # 如果是特殊手术，那么就按照特殊手术约束排到对应的手术间
                    # sql = """select
                    #        ssr.mapping_surgical_coding as '映射手术编码',
                    #        ssr.mapping_name as '映射名称',
                    #        ssr.operation_type as '手术类型',
                    #        ssr.operating_room1  as '1',
                    #        ssr.operating_room2 as '2',
                    #        ssr.operating_room3 as '3',
                    #        ssr.operating_room4 as '4',
                    #        ssr.operating_room5 as '5',
                    #        ssr.operating_room6 as '6',
                    #        ssr.operating_room7 as '7',
                    #        ssr.operating_room8 as '8',
                    #        ssr.operating_room9 as '9',
                    #        ssr.operating_room10 as '10',
                    #        ssr.operating_room11 as '11',
                    #        ssr.operating_room12 as '12',
                    #        ssr.operating_room13 as '13',
                    #        ssr.operating_room14 as '14',
                    #        ssr.operating_room15 as '15',
                    #        ssr.operating_room16 as '16',
                    #        ssr.operating_room17 as '17',
                    #        ssr.operating_room18 as '18',
                    #        ssr.operating_room19 as '19',
                    #        ssr.operating_room20 as '20',
                    #        ssr.operating_room21 as '21',
                    #        ssr.operating_room22 as '22',
                    #        ssr.operating_room23 as '23',
                    #        ssr.operating_room24 as '24',
                    #        ssr.operating_room25 as '25',
                    #        ssr.operating_room26 as '26',
                    #        ssr.operating_room27 as '27',
                    #        ssr.operating_room28 as '28',
                    #        ssr.operating_room29 as '29',
                    #        ssr.operating_room30  as '30'
                    # from special_surgical_restraint ssr
                    # where ssr.mapping_surgical_coding = '{}'
                    # """.format((listEntry[i][3]))
                    # temp_data = query_all_dict(sql)
                    # listTempConstr_tmp = []
                    # for item_data in temp_data:
                    #     listTempConstr_tmp.append(tuple(item_data.values()))
                    # listTempConstr = listTempConstr_tmp
                    # for j in range(len(listTempConstr[0])):
                    #     if str(listTempConstr[0][j]) == '1':
                    #         # 找到了第一个可行的手术间，就把这个手术排到该手术间里
                    #         # 逻辑问题：如果没找到 该如何处理
                    #         roomid = str(int(listTempConstr[0][j]) - 2)
                    #         break
                    sql = """select ori.id
                        from special_surgical_restraint ssr
                                 left join special_surgical_info ssi on ssr.special_id = ssi.id
                        left join operating_room_info ori on ssr.operating_room_id = ori.id
                        where ssi.mapping_surgical_coding =  '{}'
                        and ssr.whether_can_operation = 1
                        order by ori.id asc
                        """.format((listEntry[i][3]))
                    temp_data = query_all_dict(sql)
                    roomid = temp_data[0]['id']
                    # self.connSurgery.execute("update 手术申请信息 set 安排手术间编号 = '%s' "
                    #                          "where 申请号 = '%s' and 拟手术日期 = '%s'"
                    #                          % (roomid, listID[i], self.strf_date))
                    # self.connSurgery.commit()
                    sql = """
                        update surgicalapplicationinfo_python
                    set arrange_operating_room_number = '{}'
                    where application_number = '{}' and pseudo_operation_data like '{}%'
                                    """.format(roomid, listID[i], self.strf_date)
                    conn = pymysql.connect(host=os.environ.get('MYSQL_HOST', '192.170.201.161'),
                                           user=os.environ.get('MYSQL_USERNAME', 'root'),
                                           password=os.environ.get('MYSQL_PASSWORD', 'C2matica!'),
                                           database=os.environ.get('MYSQL_DATABASE', 'abc'), charset="utf8")
                    cursor = conn.cursor()
                    cursor.execute(sql)
                    conn.commit()
                    cursor.close()
                    conn.close()
                    continue
                if sumRoomTime == 0:
                    sumRoomTime -= 0.5
                sumRoomTime += 0.5 + float(listDuration[i])
                sumSurgeryTime += float(listDuration[i])

                if sumRoomTime > 10 and sumSurgeryTime > 10:
                    if numBlock > 1:
                        sumRoomTime = float(listDuration[i])
                        sumSurgeryTime = float(listDuration[i])
                        numBlock -= 1
                        # 如果该医生有两个及以上的手术间，那么在装满一个手术间之后，
                        # 可以在新的手术间里继续放手术
                    else:
                        break
                        # 如果某个有手术日的医生的所有手术间放满之后，最后一个手术间的
                        # 手术总时长超过10小时，并且最后一台手术在18:00之后，
                        # 则算为超时手术，不参与一轮排程
                # self.connSurgery.execute("update 手术申请信息 set 安排手术间编号 = '%s' where "
                #                          "申请号 = '%s' and 拟手术日期 = '%s'" %
                #                          (listRoomID[TotalnumBlock - numBlock], listID[i], self.strf_date))
                # self.connSurgery.commit()
                sql = """
                                        update surgicalapplicationinfo_python
                                    set arrange_operating_room_number = '{}'
                                    where application_number = '{}' and pseudo_operation_data like '{}%'
                                                    """.format(listRoomID[TotalnumBlock - numBlock], listID[i], self.strf_date)
                conn = pymysql.connect(host=os.environ.get('MYSQL_HOST', '192.170.201.161'),
                                       user=os.environ.get('MYSQL_USERNAME', 'root'),
                                       password=os.environ.get('MYSQL_PASSWORD', 'C2matica!'),
                                       database=os.environ.get('MYSQL_DATABASE', 'abc'), charset="utf8")
                cursor = conn.cursor()
                cursor.execute(sql)
                conn.commit()
                cursor.close()
                conn.close()

            # 暂时写一段补充代码：
            # 如果医生王道荣有两个手术间
            # 那么就让他的最后一台手术一定放在最后一个手术间里
            # 以此保证，只要他有两个手术，就一定在两个手术间里都有手术
            if TotalnumBlock > 1:
                # self.connSurgery.execute("update 手术申请信息 set 安排手术间编号 = '%s' where "
                #                          "申请号 = '%s' and 拟手术日期 = '%s'" %
                #                          (listRoomID[-1], listID[-1], self.strf_date))
                # self.connSurgery.commit()
                sql = """
                                                        update surgicalapplicationinfo_python
                                                    set arrange_operating_room_number = '{}'
                                                    where application_number = '{}' and pseudo_operation_data like '{}%'
                                                                    """.format(listRoomID[-1], listID[-1], self.strf_date)
                conn = pymysql.connect(host=os.environ.get('MYSQL_HOST', '192.170.201.161'),
                                       user=os.environ.get('MYSQL_USERNAME', 'root'),
                                       password=os.environ.get('MYSQL_PASSWORD', 'C2matica!'),
                                       database=os.environ.get('MYSQL_DATABASE', 'abc'), charset="utf8")
                cursor = conn.cursor()
                cursor.execute(sql)
                conn.commit()
                cursor.close()
                conn.close()

        # TODO: 一轮分配完成后，护士长手动确认一下，之后程序自动补全
        self.do_confirm_room()

        # save_file = self.output_path + self.strf_date + "-1st-.csv"
        # pd.read_sql_query("select * from 手术申请信息", self.engineSurgery).to_csv(save_file)
        # return pd.read_sql_query("select * from 手术申请信息", self.engineSurgery).to_json()
        sql = """
                    select 
                   pseudo_operation_data as '拟手术日期',
                   application_number as '申请号',
                   hospital_serial_number as '住院流水号',
                   admission_number as '住院号',
                   patient_name as '患者姓名',
                   operation_type as '手术类别',
                   surgeon as '主刀医生',
                   doctor_department as '医生科室',
                   apply_department as '申请科室',
                   operation_name as '手术名称',
                   surgical_coding as '手术编码',
                   estimated_duration_operation as '预估手术时长',
                   table_sequence as '台序',
                   mode_anesthesia as '麻醉方式',
                   whether_operating as '是否有手术日',
                   whether_special_operation as '是否为特殊手术',
                   has_arranged as '是否已安排',
                   second_round_scheduling_weight as '二轮排程权重',
                   arrange_operating_room_number as '安排手术间编号',
                   arrange_operating_number as '安排手术部',
                   arrange_operating_room as '安排手术间',
                   number_failed_order_grabs as '抢单失败次数',
                   submission_time as '提交申请时间',
                   surgery as '是否日间手术',
                   robot as '机器人',
                   interventional_operation as '介入手术',
                   perspective as '透视',
                   holmium_laser as '钬激光',
                   select_operating_room1 as '选择手术间1',
                   select_operating_room2 as '选择手术间2',
                   select_operating_room3 as '选择手术间3',
                   select_operating_room4 as '选择手术间4',
                   select_operating_room5 as '选择手术间5',
                   select_operating_room6 as '选择手术间6',
                   select_operating_room7 as '选择手术间7',
                   select_operating_room8 as '选择手术间8',
                   select_operating_room9 as '选择手术间9',
                   select_operating_room10 as '选择手术间10',
                   select_operating_room11 as '选择手术间11',
                   select_operating_room12 as '选择手术间12',
                   select_operating_room13 as '选择手术间13',
                   select_operating_room14 as '选择手术间14',
                   select_operating_room15 as '选择手术间15',
                   select_operating_room16 as '选择手术间16',
                   select_operating_room17 as '选择手术间17',
                   select_operating_room18 as '选择手术间18',
                   select_operating_room19 as '选择手术间19',
                   select_operating_room20 as '选择手术间20',
                   select_operating_room21 as '选择手术间21',
                   select_operating_room22 as '选择手术间22',
                   select_operating_room23 as '选择手术间23',
                   select_operating_room24 as '选择手术间24',
                   select_operating_room25 as '选择手术间25',
                   select_operating_room26 as '选择手术间26',
                   select_operating_room27 as '选择手术间27',
                   select_operating_room28 as '选择手术间28',
                   select_operating_room29 as '选择手术间29',
                   select_operating_room30 as '选择手术间30'
            from surgicalapplicationinfo_python
                    """
        temp_data = query_all_dict(sql)
        # pd.DataFrame(temp_data, dtype=str).to_csv(save_file)
        return temp_data

    def pre_sec_schedule(self):
        pass

    def do_sec_schedule(self):
        """
         变量/参数：
         set_i：向量：医生的集合
         set_j：向量：手术（申请号）的集合
         set_k：向量：手术间的集合
         set_m：向量：科室的集合
         weight_j：向量：手术的权重
         time_j：向量：手术的时长
         var_jk：变量：手术j是否排在手术间k
         var_ik：变量：手术间k是否排了医生i的手术
         var_ik_2：变量：医生i在二轮是否在手术间k排了手术
         var_mk：变量：手术间k是否排了科室m的手术
         constr_jk：矩阵：第j个手术能否在第k个手术间做=1/0
         is_ik：矩阵：第i个医生是否在第k个手术间排了手术=1/0
         is_mk：矩阵：第k个手术间里是否排了第m个科室的手术=1/0
         para_ij：矩阵：第j个手术是否是i医生的=1/0
         para_mj：矩阵：第j个手术是否是m科室的=1/0
         startTime_k：向量：第k个手术间里（一轮）已经排好的手术的总时长（包括最后一次接台）
         finalTime_k：向量：第k个手术间里最后排好的手术的总时长（包括最后一次接台）
         var_i：变量：医生i在二轮排上的手术是否可以分到2个及以上的手术间里=1/0
        """
        # 导入必要信息
        # df1stSurgery = pd.read_sql_query(
        #     'select * from 手术申请信息 '
        #     "where 拟手术日期 = '%s' and 是否已安排 = '是'" % (self.strf_date), self.engineSurgery)
        sql = """
                            select 
                           pseudo_operation_data as '拟手术日期',
                           application_number as '申请号',
                           hospital_serial_number as '住院流水号',
                           admission_number as '住院号',
                           patient_name as '患者姓名',
                           operation_type as '手术类别',
                           surgeon as '主刀医生',
                           doctor_department as '医生科室',
                           apply_department as '申请科室',
                           operation_name as '手术名称',
                           surgical_coding as '手术编码',
                           estimated_duration_operation as '预估手术时长',
                           table_sequence as '台序',
                           mode_anesthesia as '麻醉方式',
                           whether_operating as '是否有手术日',
                           whether_special_operation as '是否为特殊手术',
                           has_arranged as '是否已安排',
                           second_round_scheduling_weight as '二轮排程权重',
                           arrange_operating_room_number as '安排手术间编号',
                           arrange_operating_number as '安排手术部',
                           arrange_operating_room as '安排手术间',
                           number_failed_order_grabs as '抢单失败次数',
                           submission_time as '提交申请时间',
                           surgery as '是否日间手术',
                           robot as '机器人',
                           interventional_operation as '介入手术',
                           perspective as '透视',
                           holmium_laser as '钬激光',
                           select_operating_room1 as '选择手术间1',
                           select_operating_room2 as '选择手术间2',
                           select_operating_room3 as '选择手术间3',
                           select_operating_room4 as '选择手术间4',
                           select_operating_room5 as '选择手术间5',
                           select_operating_room6 as '选择手术间6',
                           select_operating_room7 as '选择手术间7',
                           select_operating_room8 as '选择手术间8',
                           select_operating_room9 as '选择手术间9',
                           select_operating_room10 as '选择手术间10',
                           select_operating_room11 as '选择手术间11',
                           select_operating_room12 as '选择手术间12',
                           select_operating_room13 as '选择手术间13',
                           select_operating_room14 as '选择手术间14',
                           select_operating_room15 as '选择手术间15',
                           select_operating_room16 as '选择手术间16',
                           select_operating_room17 as '选择手术间17',
                           select_operating_room18 as '选择手术间18',
                           select_operating_room19 as '选择手术间19',
                           select_operating_room20 as '选择手术间20',
                           select_operating_room21 as '选择手术间21',
                           select_operating_room22 as '选择手术间22',
                           select_operating_room23 as '选择手术间23',
                           select_operating_room24 as '选择手术间24',
                           select_operating_room25 as '选择手术间25',
                           select_operating_room26 as '选择手术间26',
                           select_operating_room27 as '选择手术间27',
                           select_operating_room28 as '选择手术间28',
                           select_operating_room29 as '选择手术间29',
                           select_operating_room30 as '选择手术间30'
                    from surgicalapplicationinfo_python
                    where pseudo_operation_data like '{}%' and has_arranged = '是'
                            """.format(self.strf_date)
        temp_data = query_all_dict(sql)
        df1stSurgery = pd.DataFrame(temp_data, dtype=str)
        sql = """
                                    select 
                                   pseudo_operation_data as '拟手术日期',
                                   application_number as '申请号',
                                   hospital_serial_number as '住院流水号',
                                   admission_number as '住院号',
                                   patient_name as '患者姓名',
                                   operation_type as '手术类别',
                                   surgeon as '主刀医生',
                                   doctor_department as '医生科室',
                                   apply_department as '申请科室',
                                   operation_name as '手术名称',
                                   surgical_coding as '手术编码',
                                   estimated_duration_operation as '预估手术时长',
                                   table_sequence as '台序',
                                   mode_anesthesia as '麻醉方式',
                                   whether_operating as '是否有手术日',
                                   whether_special_operation as '是否为特殊手术',
                                   has_arranged as '是否已安排',
                                   second_round_scheduling_weight as '二轮排程权重',
                                   arrange_operating_room_number as '安排手术间编号',
                                   arrange_operating_number as '安排手术部',
                                   arrange_operating_room as '安排手术间',
                                   number_failed_order_grabs as '抢单失败次数',
                                   submission_time as '提交申请时间',
                                   surgery as '是否日间手术',
                                   robot as '机器人',
                                   interventional_operation as '介入手术',
                                   perspective as '透视',
                                   holmium_laser as '钬激光',
                                   select_operating_room1 as '选择手术间1',
                                   select_operating_room2 as '选择手术间2',
                                   select_operating_room3 as '选择手术间3',
                                   select_operating_room4 as '选择手术间4',
                                   select_operating_room5 as '选择手术间5',
                                   select_operating_room6 as '选择手术间6',
                                   select_operating_room7 as '选择手术间7',
                                   select_operating_room8 as '选择手术间8',
                                   select_operating_room9 as '选择手术间9',
                                   select_operating_room10 as '选择手术间10',
                                   select_operating_room11 as '选择手术间11',
                                   select_operating_room12 as '选择手术间12',
                                   select_operating_room13 as '选择手术间13',
                                   select_operating_room14 as '选择手术间14',
                                   select_operating_room15 as '选择手术间15',
                                   select_operating_room16 as '选择手术间16',
                                   select_operating_room17 as '选择手术间17',
                                   select_operating_room18 as '选择手术间18',
                                   select_operating_room19 as '选择手术间19',
                                   select_operating_room20 as '选择手术间20',
                                   select_operating_room21 as '选择手术间21',
                                   select_operating_room22 as '选择手术间22',
                                   select_operating_room23 as '选择手术间23',
                                   select_operating_room24 as '选择手术间24',
                                   select_operating_room25 as '选择手术间25',
                                   select_operating_room26 as '选择手术间26',
                                   select_operating_room27 as '选择手术间27',
                                   select_operating_room28 as '选择手术间28',
                                   select_operating_room29 as '选择手术间29',
                                   select_operating_room30 as '选择手术间30'
                            from surgicalapplicationinfo_python
                            where pseudo_operation_data like '{}%' and has_arranged != '是'
                                    """.format(self.strf_date)
        temp_data = query_all_dict(sql)
        df2ndSurgery = pd.DataFrame(temp_data, dtype=str)
        # df2ndSurgery = pd.read_sql_query(
        #     'select * from 手术申请信息 '
        #     "where 拟手术日期 = '%s' and 是否已安排 != '是'" % (self.strf_date), self.engineSurgery)
        # dfAllSurgery = pd.read_sql_query(
        #     'select * from 手术申请信息 '
        #     "where 拟手术日期 = '%s'" % (self.strf_date), self.engineSurgery)
        sql = """
                                            select 
                                           pseudo_operation_data as '拟手术日期',
                                           application_number as '申请号',
                                           hospital_serial_number as '住院流水号',
                                           admission_number as '住院号',
                                           patient_name as '患者姓名',
                                           operation_type as '手术类别',
                                           surgeon as '主刀医生',
                                           doctor_department as '医生科室',
                                           apply_department as '申请科室',
                                           operation_name as '手术名称',
                                           surgical_coding as '手术编码',
                                           estimated_duration_operation as '预估手术时长',
                                           table_sequence as '台序',
                                           mode_anesthesia as '麻醉方式',
                                           whether_operating as '是否有手术日',
                                           whether_special_operation as '是否为特殊手术',
                                           has_arranged as '是否已安排',
                                           second_round_scheduling_weight as '二轮排程权重',
                                           arrange_operating_room_number as '安排手术间编号',
                                           arrange_operating_number as '安排手术部',
                                           arrange_operating_room as '安排手术间',
                                           number_failed_order_grabs as '抢单失败次数',
                                           submission_time as '提交申请时间',
                                           surgery as '是否日间手术',
                                           robot as '机器人',
                                           interventional_operation as '介入手术',
                                           perspective as '透视',
                                           holmium_laser as '钬激光',
                                           select_operating_room1 as '选择手术间1',
                                           select_operating_room2 as '选择手术间2',
                                           select_operating_room3 as '选择手术间3',
                                           select_operating_room4 as '选择手术间4',
                                           select_operating_room5 as '选择手术间5',
                                           select_operating_room6 as '选择手术间6',
                                           select_operating_room7 as '选择手术间7',
                                           select_operating_room8 as '选择手术间8',
                                           select_operating_room9 as '选择手术间9',
                                           select_operating_room10 as '选择手术间10',
                                           select_operating_room11 as '选择手术间11',
                                           select_operating_room12 as '选择手术间12',
                                           select_operating_room13 as '选择手术间13',
                                           select_operating_room14 as '选择手术间14',
                                           select_operating_room15 as '选择手术间15',
                                           select_operating_room16 as '选择手术间16',
                                           select_operating_room17 as '选择手术间17',
                                           select_operating_room18 as '选择手术间18',
                                           select_operating_room19 as '选择手术间19',
                                           select_operating_room20 as '选择手术间20',
                                           select_operating_room21 as '选择手术间21',
                                           select_operating_room22 as '选择手术间22',
                                           select_operating_room23 as '选择手术间23',
                                           select_operating_room24 as '选择手术间24',
                                           select_operating_room25 as '选择手术间25',
                                           select_operating_room26 as '选择手术间26',
                                           select_operating_room27 as '选择手术间27',
                                           select_operating_room28 as '选择手术间28',
                                           select_operating_room29 as '选择手术间29',
                                           select_operating_room30 as '选择手术间30'
                                    from surgicalapplicationinfo_python
                                    where pseudo_operation_data like '{}%' 
                                            """.format(self.strf_date)
        temp_data = query_all_dict(sql)
        dfAllSurgery = pd.DataFrame(temp_data, dtype=str)

        # 根据二轮手术信息构建set_i、set_j、set_k
        set_i = df2ndSurgery['主刀医生'].unique().tolist()
        set_j = df2ndSurgery['申请号'].values.tolist()
        sql = """
        select id from operating_room_info
            group by id
            order by id
                """
        temp_data = query_all_dict(sql)
        set_k = []
        for item in temp_data:
            set_k.append(str(item['id']))
        set_k = list(set_k)

        # dfConstrInfo = pd.read_sql_query(
        #     'select * from 手术间约束表', self.engineBaseInfo)
        sql = """
                    select
                           ao.family_name  as '科室',
                           ic.whether_can_operation as 'whether_can_operation',
                            ori.id as 'id'
                    from interoperative_constraint ic
                    left join administrative_office ao on ic.department = ao.id
                    left join operating_room_info ori on ic.operating_room_id = ori.id
                    order by ori.id
                    """
        temp_data = query_all_dict(sql)
        family_names = []
        for family_name_item in temp_data:
            family_names.append(family_name_item['科室'])
        # dfConstrInfo = pd.DataFrame(temp_data, dtype=str)
        dict = {"科室": list(set(family_names))}
        for kitem in set_k:
            dict[kitem] = []
            for index in dict['科室']:
                sql = """
                    select
                           ao.family_name  as '科室',
                           ic.whether_can_operation as 'whether_can_operation',
                            ori.id as 'id'
                    from interoperative_constraint ic
                    left join administrative_office ao on ic.department = ao.id
                    left join operating_room_info ori on ic.operating_room_id = ori.id
                    where ori.id = {} and ao.family_name = '{}'
                    order by ori.id
                    """.format(kitem, index)
                temp_data = query_all_dict(sql)
                if temp_data:
                    dict[kitem].append(temp_data[0]['whether_can_operation'])
                else:
                    dict[kitem].append(0)
        dfConstrInfo = pd.DataFrame(dict)



        # dfSpecialConstrInfo = pd.read_sql_query(
        #     'select * from 特殊手术约束表', self.engineBaseInfo)
        sql = """select ssi.mapping_surgical_coding as '映射手术编码',
                   ssi.mapping_name as '映射名称',
                   ssi.operation_type as '手术类型',
                   ssi.id
            from special_surgical_info ssi 
            order by ssi.id
        """
        temp_data = query_all_dict(sql)
        # dfSpecialConstrInfo = pd.DataFrame(temp_data)
        mapping_surgical_codings = []
        for mapping_surgical_coding in temp_data:
            mapping_surgical_codings.append(mapping_surgical_coding['映射手术编码'])
        mapping_names = []
        for mapping_name in temp_data:
            mapping_names.append(mapping_name['映射名称'])
        operation_types = []
        for operation_type in temp_data:
            operation_types.append(operation_type['手术类型'])

        # dfConstrInfo = pd.DataFrame(temp_data, dtype=str)
        dict = {"映射手术编码": mapping_surgical_codings, "映射名称": mapping_names, "手术类型": operation_types}
        for kitem in set_k:
            dict[kitem] = []
            for index in dict['映射手术编码']:
                if not index:
                    dict[kitem].append(1)
                else:
                    sql = """
                                select ssr.whether_can_operation
                                    from special_surgical_restraint ssr
                                             left join special_surgical_info ssi on ssr.special_id = ssi.id
                                             left join operating_room_info ori on ssr.operating_room_id = ori.id
                                    where ori.id = {}
                                      and (ssi.operation_type != '机器人'
                                        and ssi.operation_type != '介入手术'
                                        and ssi.operation_type != '透视'
                                        and ssi.operation_type != '钬激光')
                                      and ssi.mapping_surgical_coding = '{}'
                                    order by ssi.id
                                """.format(kitem, index)
                    temp_data = query_all_dict(sql)
                    if temp_data:
                        dict[kitem].append(temp_data[0]['whether_can_operation'])
                    else:
                        dict[kitem].append(0)
        dfSpecialConstrInfo = pd.DataFrame(dict)

        # 根据一轮和二轮手术信息构建set_m
        set_m = dfAllSurgery['医生科室'].unique().tolist()

        # 初始化startTime_k、is_ik、is_mk、constr_jk、weight_j、time_j、para_ij、para_mj
        startTime_k = np.zeros(len(set_k))
        is_ik = np.zeros((len(set_i), len(set_k)))
        is_mk = np.zeros((len(set_m), len(set_k)))
        constr_jk = np.zeros((len(set_j), len(set_k)))
        weight_j = np.ones(len(set_j))
        time_j = np.zeros(len(set_j))
        para_ij = np.zeros((len(set_i), len(set_j)))
        para_mj = np.zeros((len(set_m), len(set_j)))

        # 根据一轮排程结果计算startTime_k、is_ik、is_mk
        for i in range(len(df1stSurgery)):
            roomID = df1stSurgery.loc[i, '安排手术间编号']
            time = df1stSurgery.loc[i, '预估手术时长']
            doctor = df1stSurgery.loc[i, '主刀医生']
            dept = df1stSurgery.loc[i, '医生科室']

            startTime_k[set_k.index(str(roomID))] += float(time) + 0.5  # 接台时间也考虑在内！
            if doctor in set_i:
                is_ik[set_i.index(doctor), set_k.index(str(roomID))] = 1
            is_mk[set_m.index(dept), set_k.index(str(roomID))] = 1

        # 根据二轮手术信息和两个约束信息表计算constr_jk
        for j in range(len(df2ndSurgery)):
            surgeryID = df2ndSurgery.loc[j, '申请号']
            if df2ndSurgery.loc[j, '是否为特殊手术'] == '是':
                # 如果是特殊手术，则检索特殊手术约束表
                surgeryCode = df2ndSurgery.loc[j, '手术编码']
                constr_jk[j, :] = \
                    list(dfSpecialConstrInfo[dfSpecialConstrInfo['映射手术编码'] == surgeryCode].iloc[0, 3:])
                weight_j[j] = self.WEIGHT_SPECIAL_SURGERY
                # 特殊手术的权重大一点
            else:
                # 如果是普通手术，则检索手术间约束表
                dept = df2ndSurgery.loc[j, '医生科室']
                print(dept)
                print(df2ndSurgery.loc[j, '主刀医生'])
                constr_jk[j, :] = \
                    list(dfConstrInfo[dfConstrInfo['科室'] == dept].iloc[0, 1:])

            # 根据二轮手术信息计算time_j
            time_j[j] = float(df2ndSurgery.loc[j, '预估手术时长'])
            # 根据二轮手术信息计算weight_j
            # 暂时先不写了………………………………………………………………………………………………………………………………………………
            for i in range(len(set_i)):
                # 根据二轮手术信息计算para_ij
                if df2ndSurgery.loc[j, '主刀医生'] == set_i[i]:
                    para_ij[i][j] = 1
            for m in range(len(set_m)):
                # 根据二轮手术信息计算para_mj
                if df2ndSurgery.loc[j, '医生科室'] == set_m[m]:
                    para_mj[m][j] = 1

        '''
        【4月27日】修改：
        1.增加了修改constr_jk的代码
        修改内容：对约束进一步处理：考虑机器人、介入、透视、钬激光4个字段；考虑医生选择的手术间

        2.增加了修改weight_j的代码
        修改内容：
        普通手术初始值为1
        特殊手术初始值为10

        考虑5个因素：抢单失败次数、住院时间（住院号）、是否日间手术、提交申请时间、是否有手术日

        若抢单失败次数>=3，权重设为100
        若抢单失败次数为1或2，权重加0.15或0.3

        对于择期手术，按住院号从大到小排序；对于日间手术，按住院号从小到大排序
        排序之后，前5名权重设为100，
        前25%权重加0.2，25%-50%权重加0.15，50%-75%权重加0.1，后25%权重加0.05

        提交申请时间在12:00-13:30，权重加0.2，
        提交申请时间在13:30-15:00，权重加0.15，
        提交申请时间在15:00-16:30，权重加0.05，

        日间手术权重加0.3

        非手术日权重加0.2

        （上述数值出处：2月28日的模型构建及说明（更新）.docx）
        '''

        # 修改constr_jk
        specNameList = ['机器人', '介入手术', '透视', '钬激光']
        for j in range(len(df2ndSurgery)):
            for name in specNameList:
                if df2ndSurgery.loc[j, name] == '是':
                    tempArr = np.array(
                        dfSpecialConstrInfo[dfSpecialConstrInfo['手术类型'] == name].iloc[0, 3:]).astype(int)
                    constr_jk[j, :] *= tempArr
            # for room in range(30):
            #     if df2ndSurgery.loc[j, '选择手术间' + str(room + 1)] == '否':
            #         constr_jk[j, room] = 0

        # 修改weight_j

        dfLOS = df2ndSurgery[['申请号', '住院号', '是否日间手术']].copy()
        dfLOS['住院号'] = dfLOS['住院号'].astype(int)
        dfLOS_ZeQi = dfLOS[dfLOS['是否日间手术'] == '否'].copy()
        dfLOS_RiJian = dfLOS[dfLOS['是否日间手术'] == '是'].copy()
        dfLOS_ZeQi.sort_values(by='住院号',
                               inplace=True, ignore_index=True,
                               ascending=False)
        dfLOS_RiJian.sort_values(by='住院号',
                                 inplace=True, ignore_index=True,
                                 ascending=True)
        list_ZeQi = dfLOS_ZeQi['申请号'].tolist()
        list_RiJian = dfLOS_RiJian['申请号'].tolist()

        date = self.date
        timeStampList = []
        timeStampList.append(datetime.datetime(
            date.year, date.month, date.day, 12, 0, 0).timestamp())
        timeStampList.append(datetime.datetime(
            date.year, date.month, date.day, 13, 30, 0).timestamp())
        timeStampList.append(datetime.datetime(
            date.year, date.month, date.day, 15, 0, 0).timestamp())
        timeStampList.append(datetime.datetime(
            date.year, date.month, date.day, 16, 30, 0).timestamp())

        for j in range(len(df2ndSurgery)):
            # 因素：抢单失败次数
            weight_j[j] += int(df2ndSurgery.loc[j, '抢单失败次数']) * 0.15
            if int(df2ndSurgery.loc[j, '抢单失败次数']) >= 3:
                weight_j[j] = 10

            # 因素：是否日间手术
            if df2ndSurgery.loc[j, '是否日间手术'] == '是':
                weight_j[j] += 0.3

            # 因素：是否有手术日
            if df2ndSurgery.loc[j, '是否有手术日'] == '否':
                weight_j[j] += 0.2

            # 因素：提交申请时间
            tempTime = df2ndSurgery.loc[j, '提交申请时间']
            tempTime = datetime.datetime.strptime(tempTime, '%Y-%m-%d %H:%M:%S')
            tempTime = tempTime.timestamp()
            if tempTime < timeStampList[0]:
                weight_j[j] += 0
            elif tempTime < timeStampList[1]:
                weight_j[j] += 0.2
            elif tempTime < timeStampList[2]:
                weight_j[j] += 0.15
            elif tempTime < timeStampList[3]:
                weight_j[j] += 0.05

            # 因素：住院时间（住院号）
            tempNo = set_j[j]
            if df2ndSurgery.loc[j, '是否日间手术'] == '是':
                if tempNo in list_RiJian[:int(len(list_RiJian) / 4)]:
                    weight_j[j] += 0.2
                elif tempNo in list_RiJian[:int(len(list_RiJian) / 2)]:
                    weight_j[j] += 0.15
                elif tempNo in list_RiJian[:int(len(list_RiJian) * 3 / 4)]:
                    weight_j[j] += 0.1
                else:
                    weight_j[j] += 0.05
            if df2ndSurgery.loc[j, '是否日间手术'] == '否':
                if tempNo in list_ZeQi[:int(len(list_ZeQi) / 4)]:
                    weight_j[j] += 0.2
                elif tempNo in list_ZeQi[:int(len(list_ZeQi) / 2)]:
                    weight_j[j] += 0.15
                elif tempNo in list_ZeQi[:int(len(list_ZeQi) * 3 / 4)]:
                    weight_j[j] += 0.1
                else:
                    weight_j[j] += 0.05

            weight_j[j] = round(weight_j[j], 2)
            # 将权重值写入数据库
            # self.connSurgery.execute("update 手术申请信息 set 二轮排程权重 = '%s' where "
            #                          "拟手术日期 = '%s' and 申请号 = '%s'"
            #                          % ((weight_j[j]), self.strf_date,
            #                             set_j[j]))
            # self.connSurgery.commit()
            sql = """
                    update surgicalapplicationinfo_python
                set second_round_scheduling_weight = '{}'
                where pseudo_operation_data like '{}%' and application_number = '{}'  
                                """.format((weight_j[j]), self.strf_date,
                                        set_j[j])
            conn = pymysql.connect(host=os.environ.get('MYSQL_HOST', '192.170.201.161'),
                                   user=os.environ.get('MYSQL_USERNAME', 'root'),
                                   password=os.environ.get('MYSQL_PASSWORD', 'C2matica!'),
                                   database=os.environ.get('MYSQL_DATABASE', 'abc'), charset="utf8")
            cursor = conn.cursor()
            cursor.execute(sql)
            conn.commit()
            cursor.close()
            conn.close()

        # 下面开始调用pulp，构建模型
        model = pulp.LpProblem("Stage1", pulp.LpMaximize)
        var_jk = [[None] * len(set_k) for i in range(len(set_j))]
        var_ik = [[None] * len(set_k) for i in range(len(set_i))]
        var_ik_2 = [[None] * len(set_k) for i in range(len(set_i))]
        var_mk = [[None] * len(set_k) for i in range(len(set_m))]
        var_i = [None] * len(set_i)
        for k in range(len(set_k)):
            for j in range(len(set_j)):
                # 添加【变量】：var_jk
                var_jk[j][k] = pulp.LpVariable(
                    cat=pulp.LpBinary, name='VariableOf' + 'Surgery' + str(j) + 'Room' + str(k))
            for i in range(len(set_i)):
                # 添加【变量】：var_ik
                var_ik[i][k] = pulp.LpVariable(
                    cat=pulp.LpBinary, name='DummyVariableOf' + 'Doctor' + str(i) + 'Room' + str(k))
                # 添加【变量】：var_ik_2
                var_ik_2[i][k] = pulp.LpVariable(
                    cat=pulp.LpBinary, name='DummyVariable222Of' + 'Doctor' + str(i) + 'Room' + str(k))

            for m in range(len(set_m)):
                # 添加【变量】：var_mk
                var_mk[m][k] = pulp.LpVariable(
                    cat=pulp.LpBinary, name='DummyVariableOf' + 'Dept' + str(m) + 'Room' + str(k))

        for j in range(len(set_j)):
            for k in range(len(set_k)):
                # 添加【约束】：手术间条件约束
                model += var_jk[j][k] <= constr_jk[j, k], \
                         'ConditionOf' + 'Surgery' + str(j) + 'Room' + str(k)
        for j in range(len(set_j)):
            # 添加【约束】：手术至多安排在一个手术间里
            model += pulp.lpSum([var_jk[j][k] for k in range(len(set_k))]) <= 1, \
                     'AtMostOneRoomFor' + 'Surgery' + str(j)
        for k in range(len(set_k)):
            # 添加【约束】：每个手术间的用时不超过10（如果已经超了，就不超过当前值）
            model += startTime_k[k] + \
                     pulp.lpSum([var_jk[j][k] * (time_j[j] + 0.5) for j in range(len(set_j))]) <= \
                     max(10, startTime_k[k]), 'TotalTimeOf' + 'Room' + str(k)
            for i in range(len(set_i)):
                # 添加【约束】：定义var_ik（表示：手术间k是否排了医生i的手术）
                model += pulp.lpSum([var_jk[j][k] * para_ij[i][j] for j in range(len(set_j))]) \
                         <= 100 * var_ik[i][k] - is_ik[i][k], \
                         'DefineVarOf' + 'Doctor' + str(i) + 'Room' + str(k)
                # 添加【约束】：定义var_ik_2（表示：医生i在二轮是否在手术间k排了手术）
                model += pulp.lpSum([var_jk[j][k] * para_ij[i][j] for j in range(len(set_j))]) \
                         <= 100 * var_ik_2[i][k], \
                         'DefineVar222Of' + 'Doctor' + str(i) + 'Room' + str(k)

            for m in range(len(set_m)):
                # 添加【约束】：定义var_mk（表示：手术间k是否排了科室m的手术）
                model += pulp.lpSum([var_jk[j][k] * para_mj[m][j] for j in range(len(set_j))]) \
                         <= 100 * var_mk[m][k] - is_mk[m][k], \
                         'DefineVarOf' + 'Dept' + str(m) + 'Room' + str(k)
        for k in range(len(set_k)):
            # 添加【约束】：一个手术间里的手术不能来自超过【3】个科室（如果已经超了，就不超过当前值）
            model += pulp.lpSum([var_mk[m][k] for m in range(len(set_m))]) \
                     <= max(3, np.sum(is_mk[:, k])), 'ConstrOfDeptFor' + 'Room' + str(k)
        for i in range(len(set_i)):
            # 添加【约束】：一个医生的手术不能分到超过【2】个手术间（如果已经超了，就不超过当前值）
            model += pulp.lpSum([var_ik[i][k] for k in range(len(set_k))]) \
                     <= max(2, np.sum(is_ik[i, :])), 'ConstrOfRoomFor' + 'Doctor' + str(i)

        for i in range(len(set_i)):
            # 添加【变量】：var_i
            var_i[i] = pulp.LpVariable(
                cat=pulp.LpBinary, name='VariableFor' + 'Doctor' + str(i))
            # 添加【约束】：医生i的排上的手术的总时长如果不超过4小时，
            # 那么医生i的手术就至多只能排到1个手术间里
            # 那么var_i[i] == 0，否则var_i[i] == 1
            model += 4.01 - pulp.lpSum([para_ij[i][j] * var_jk[j][k] * time_j[j] \
                                        for j in range(len(set_j)) \
                                        for k in range(len(set_k))]) <= \
                     100 * (1 - var_i[i]), 'Constr111DefineVar_iForDoctor' + str(i)
            # 添加【约束】：医生i的排上的手术的数量如果不超过3个，
            # 那么医生i的手术就至多只能排到1个手术间里
            # 那么var_i[i] == 0，否则var_i[i] == 1
            model += 3.01 - pulp.lpSum([para_ij[i][j] * var_jk[j][k] \
                                        for j in range(len(set_j)) \
                                        for k in range(len(set_k))]) <= \
                     100 * (1 - var_i[i]), 'Constr222DefineVar_iForDoctor' + str(i)
            # 添加【约束】：
            # 如果var_i[i]为0，那么医生i在二轮排上的手术不能排在2个及以上的手术间里
            model += pulp.lpSum([var_ik_2[i][k] \
                                 for k in range(len(set_k))]) <= 1 + 100 * var_i[i], \
                     'ConstrForDoctor' + str(i)

        '''
        $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
        ************下面是实验区
        $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
        '''

        # '''
        # 实验1: 目标为最大化手术总时长（注意model的定义是pulp.LpMaximize）
        model += pulp.lpSum([var_jk[j][k] * time_j[j] * weight_j[j] for k in range(len(set_k)) \
                             for j in range(len(set_j))]), 'Obj'
        # '''

        '''
        #实验2: 目标为最大化手术数量加权和（注意model的定义是pulp.LpMaximize）
        model += pulp.lpSum([var_jk[j][k] * weight_j[j] for k in range(len(set_k)) \
                             for j in range(len(set_j))]), 'Obj'
        '''

        '''
        #实验3: 目标为最小化手术间用时的最大差异（注意model的定义是pulp.LpMinimize）

        model += pulp.lpSum([var_jk[j][k] * weight_j[j] for k in range(len(set_k)) \
                             for j in range(len(set_j))]) >= 65, 'Constraint'
                            # 注：本次实验最优值是69，69*0.95=65
        # 定义【变量】var_Time_Max
        var_Time_Max = pulp.LpVariable(cat=pulp.LpContinuous,name='MaxTime')
        # 定义【变量】var_Time_Min
        var_Time_Min = pulp.LpVariable(cat=pulp.LpContinuous, name='MinTime')
        # 定义【约束】
        for k in range(len(set_k)):
            model += startTime_k[k] + \
                    pulp.lpSum([var_jk[j][k] * (time_j[j] + 0.5) for j in range(len(set_j))]) <= \
                    var_Time_Max, 'DefineMaxOfRoom'+str(k)
            model += startTime_k[k] + \
                     pulp.lpSum([var_jk[j][k] * (time_j[j] + 0.5) for j in range(len(set_j))]) >= \
                     var_Time_Min, 'DefineMinOfRoom'+str(k)
        # 定义【目标】
        model += var_Time_Max - var_Time_Min, 'Obj'
        '''

        '''
        $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
        ************上面是实验区
        $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
        '''

        solver = pulp.PULP_CBC_CMD(timeLimit=100)  # 算法运行时间不超过100秒
        model.solve(solver)

        for v in model.variables():
            if int(v.varValue) == 1 and v.name[:17] == 'VariableOfSurgery':
                tempName = v.name[17:]
                tempName = tempName.split('Room')
                # self.connSurgery.execute("update 手术申请信息 set 安排手术间编号 = '%s' where "
                #                          "拟手术日期 = '%s' and 申请号 = '%s'"
                #                          % ((set_k[int(tempName[1])]), self.strf_date,
                #                             set_j[int(tempName[0])]))
                # self.connSurgery.commit()
                sql = """
                                    update surgicalapplicationinfo_python
                                set arrange_operating_room_number = '{}'
                                where pseudo_operation_data like '{}%' and application_number = '{}'  
                                                """.format((set_k[int(tempName[1])]), self.strf_date,
                                            set_j[int(tempName[0])])
                conn = pymysql.connect(host=os.environ.get('MYSQL_HOST', '192.170.201.161'),
                                       user=os.environ.get('MYSQL_USERNAME', 'root'),
                                       password=os.environ.get('MYSQL_PASSWORD', 'C2matica!'),
                                       database=os.environ.get('MYSQL_DATABASE', 'abc'), charset="utf8")
                cursor = conn.cursor()
                cursor.execute(sql)
                conn.commit()
                cursor.close()
                conn.close()

        # TODO: 二轮分配完成后，护士长手动确认一下，之后程序自动补全
        self.do_confirm_room()

        # save_file = self.output_path + self.strf_date + "-2st-.csv"
        # pd.read_sql_query("select * from 手术申请信息", self.engineSurgery).to_csv(save_file)
        # return pd.read_sql_query("select * from 手术申请信息", self.engineSurgery).to_json()
        sql = """
                            select 
                           pseudo_operation_data as '拟手术日期',
                           application_number as '申请号',
                           hospital_serial_number as '住院流水号',
                           admission_number as '住院号',
                           patient_name as '患者姓名',
                           operation_type as '手术类别',
                           surgeon as '主刀医生',
                           doctor_department as '医生科室',
                           apply_department as '申请科室',
                           operation_name as '手术名称',
                           surgical_coding as '手术编码',
                           estimated_duration_operation as '预估手术时长',
                           table_sequence as '台序',
                           mode_anesthesia as '麻醉方式',
                           whether_operating as '是否有手术日',
                           whether_special_operation as '是否为特殊手术',
                           has_arranged as '是否已安排',
                           second_round_scheduling_weight as '二轮排程权重',
                           arrange_operating_room_number as '安排手术间编号',
                           arrange_operating_number as '安排手术部',
                           arrange_operating_room as '安排手术间',
                           number_failed_order_grabs as '抢单失败次数',
                           submission_time as '提交申请时间',
                           surgery as '是否日间手术',
                           robot as '机器人',
                           interventional_operation as '介入手术',
                           perspective as '透视',
                           holmium_laser as '钬激光',
                           select_operating_room1 as '选择手术间1',
                           select_operating_room2 as '选择手术间2',
                           select_operating_room3 as '选择手术间3',
                           select_operating_room4 as '选择手术间4',
                           select_operating_room5 as '选择手术间5',
                           select_operating_room6 as '选择手术间6',
                           select_operating_room7 as '选择手术间7',
                           select_operating_room8 as '选择手术间8',
                           select_operating_room9 as '选择手术间9',
                           select_operating_room10 as '选择手术间10',
                           select_operating_room11 as '选择手术间11',
                           select_operating_room12 as '选择手术间12',
                           select_operating_room13 as '选择手术间13',
                           select_operating_room14 as '选择手术间14',
                           select_operating_room15 as '选择手术间15',
                           select_operating_room16 as '选择手术间16',
                           select_operating_room17 as '选择手术间17',
                           select_operating_room18 as '选择手术间18',
                           select_operating_room19 as '选择手术间19',
                           select_operating_room20 as '选择手术间20',
                           select_operating_room21 as '选择手术间21',
                           select_operating_room22 as '选择手术间22',
                           select_operating_room23 as '选择手术间23',
                           select_operating_room24 as '选择手术间24',
                           select_operating_room25 as '选择手术间25',
                           select_operating_room26 as '选择手术间26',
                           select_operating_room27 as '选择手术间27',
                           select_operating_room28 as '选择手术间28',
                           select_operating_room29 as '选择手术间29',
                           select_operating_room30 as '选择手术间30'
                    from surgicalapplicationinfo_python
                            """
        temp_data = query_all_dict(sql)
        # pd.DataFrame(temp_data, dtype=str).to_csv(save_file)
        return temp_data

    def __drop_blocks(self):
        self.connBlock.execute('drop table if exists 当天手术日表初版')
        self.connBlock.execute('drop table if exists 当天手术日表终版')
        self.connBlock.commit()

    def __fetch_block_table_names(self):
        SQL = "select name from sqlite_master where type='table' order by name"
        cur = self.connBlock.cursor()
        return [_[0] for _ in cur.execute(SQL).fetchall()]

    def do_confirm_room(self):
        sql = """
            select id as '手术间编号', operating_department as '所属手术部', real_name as '真实名称' 
from operating_room_info
        """
        temp_data = query_all_dict(sql)
        listRoomInfo_tmp = []
        for item_data in temp_data:
            listRoomInfo_tmp.append(tuple(item_data.values()))
        listRoomInfo = listRoomInfo_tmp
        # listRoomInfo = self.connBaseInfo.execute("select 手术间编号, 所属手术部, 真实名称 from 手术间表 ").fetchall()
        logger = logging.getLogger("django.db.backends")
        for id, dept, room in listRoomInfo:
            # SQL = "update 手术申请信息 set 是否已安排 = '是', 安排手术部 = '%s', 安排手术间 = '%s' " \
            #       "where 安排手术间编号 = '%s' and 拟手术日期 = '%s'" % (dept, room, id, self.strf_date)
            # self.connSurgery.execute(SQL)
            # self.connSurgery.commit()
            # logger.info(dept)
            # logger.info(id)
            # logger.info(self.strf_date)
            sql = """
                update surgicalapplicationinfo_python
            set has_arranged = '是', arrange_operating_number = '{}', arrange_operating_room = '{}' 
            where arrange_operating_room_number = '{}' and pseudo_operation_data like '{}%' 
                            """.format(dept, room, id, self.strf_date)
            conn = pymysql.connect(host=os.environ.get('MYSQL_HOST', '192.170.201.161'),
                                   user=os.environ.get('MYSQL_USERNAME', 'root'),
                                   password=os.environ.get('MYSQL_PASSWORD', 'C2matica!'),
                                   database=os.environ.get('MYSQL_DATABASE', 'abc'), charset="utf8")
            cursor = conn.cursor()
            cursor.execute(sql)
            conn.commit()
            cursor.close()
            conn.close()
