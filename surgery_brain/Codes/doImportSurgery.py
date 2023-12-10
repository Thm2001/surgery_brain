import pandas as pd
import sqlite3
import datetime
import numpy as np
import time
from sqlalchemy import create_engine

from c2matica_py_server.settings import MYSQL_HOST, MYSQL_USERNAME, MYSQL_PASSWORD, MYSQL_DATABASE
from common.sql_util import *
import os
import pymysql
import logging

pd.set_option("display.max_columns", None)

# e.g. 20211203

TABLE_HEADER = [
    '拟手术日期',
    '申请号',
    '住院流水号',
    '住院号',
    '患者姓名',
    '手术类别',
    '主刀医生',
    '医生科室',
    '申请科室',
    '手术名称',
    '手术编码',
    '预估手术时长',
    '台序',
    '麻醉方式',
    '是否有手术日',
    '是否为特殊手术',
    '是否已安排',
    '二轮排程权重',
    '安排手术间编号',
    '安排手术部',
    '安排手术间',
    '是否日间手术',  # surgery
    '机器人',  # robot
    '介入手术',  # interventional_operation
    '透视',  # perspective
    '钬激光'  # holmium_laser
]


def doGetSurgery(fileName):
    df = pd.read_csv(fileName + '.csv', dtype=str)
    print('表头：')
    print(df.columns)
    print('\n表格：')
    print(df)
    return df


def doPreprocessSurgery(df):
    try:
        newdf = pd.DataFrame(columns=TABLE_HEADER)
        newdf[['拟手术日期', '申请号', '住院流水号', '住院号', '患者姓名',
               '手术类别', '主刀医生', '申请科室', '手术名称', '手术编码',
               '预估手术时长', '台序', '麻醉方式']] = \
            df[['拟手术日期', '申请号', '住院流水号', '住院号', '姓名',
                '手术类别', '手术者', '申请科室', '手术名称', '手术编码3.0',
                '预估手术时长', '台序', '麻醉方式']].copy()
    except KeyError:
        print('无患者姓名')
        newdf = pd.DataFrame(columns=TABLE_HEADER)
        newdf[['拟手术日期', '申请号', '住院流水号', '住院号',
               '手术类别', '主刀医生', '申请科室', '手术名称', '手术编码',
               '预估手术时长', '台序', '麻醉方式']] = \
            df[['拟手术日期', '申请号', '住院流水号', '住院号',
                '手术类别', '手术者', '申请科室', '手术名称', '手术编码3.0',
                '预估手术时长', '台序', '麻醉方式']].copy()

    newdf[["是否日间手术", "机器人", "介入手术", "透视", "钬激光"]] = df[
        ["是否日间手术", "机器人", "介入手术", "透视", "钬激光"]].replace(
        {"是": "是", "否": "否"}, inplace=False)
    newdf.fillna('', inplace=True)
    newdf.reset_index(drop=True, inplace=True)
    for row in range(len(newdf)):
        _str = newdf.loc[row, '拟手术日期']
        _str = _str.split(' ')[0]
        _str = datetime.datetime.strptime(_str, '%Y/%m/%d')
        _str = datetime.datetime.strftime(_str, '%Y-%m-%d')
        newdf.loc[row, '拟手术日期'] = _str

        _str = newdf.loc[row, '预估手术时长']
        _str = _str.split('-')[0]
        newdf.loc[row, '预估手术时长'] = _str

    newdf.drop_duplicates(subset=['申请号'], keep='first', inplace=True, ignore_index=True)
    # 删除申请号重复的行

    print('经过预处理的表格：111111111111')
    print(newdf)
    return newdf


def doCheckSpecialSurgery(df):
#     sql = """select
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
# """
    sql = """select ssi.mapping_surgical_coding as '映射手术编码' 
from special_surgical_restraint ssr
         left join special_surgical_info ssi on ssr.special_id = ssi.id
    """
    temp_data = query_all_dict(sql)
    dfConstr = pd.DataFrame(temp_data)
    listSurgeryCode = dfConstr['映射手术编码'].values.tolist()
    for i in range(len(df)):
        if df.loc[i, '手术编码'] in listSurgeryCode:
            df.loc[i, '是否为特殊手术'] = '是'
    print('经过预处理的表格：22222222222222')
    print(df)
    return df


def doCheckDept(df):
    sql = """
    select 
       di.doctor as '医生',
       di.department as '科室',
       di.subordinate_medical_unit as '所属医疗组'
from doctor_info di
"""
    temp_data = query_all_dict(sql)
    dfDoctor = pd.DataFrame(temp_data)
    for i in range(len(df)):
        doctor = df.loc[i, '主刀医生']
        if dfDoctor[dfDoctor['医生'] == doctor].empty:
            print('医生：' + doctor + ' 不在医生信息表里！')
            continue
        df.loc[i, '医生科室'] = dfDoctor[dfDoctor['医生'] == doctor].iloc[0].at['科室']
        # if df.loc[i, '医生科室'] == '胸外科':
        #     df.loc[i, '主刀医生'] = df.loc[i, '台序'][0]
    df = df[~(df['申请科室'] == '眼科') & ~(df['申请科室'] == 'EICU') & ~(df['申请科室'] == 'CICU') &
            ~(df['申请科室'] == '胆胰内科') & ~(df['申请科室'] == '烧伤整形外科') & ~(df['申请科室'] == 'RICU') &
            ~(df['申请科室'] == '肛肠科') & ~(df['申请科室'] == '介入放射科') & ~(df['申请科室'] == '临床心理科') &
            ~(df['申请科室'] == '神经内科503')]

    # del some dept and doc's application
    # available_doc_list = pd.read_sql_query("select * from 医生信息表", engine)["医生"].to_list()
    available_doc_list = [item["医生"] for item in temp_data if "医生" in item]
    # available_dept_list = pd.read_sql_query("select * from 手术间约束表", engine)["科室"].to_list()
    available_dept_list = [item["科室"] for item in temp_data if "科室" in item]

    myfilter = df["主刀医生"].isin(available_doc_list) & df["医生科室"].isin(available_dept_list) & df["申请科室"].isin(
        available_dept_list)
    print("this surgery has been dropped!")
    print(df[~myfilter])

    df = df[myfilter]

    # 删除眼科的手术申请
    df.reset_index(drop=True, inplace=True)
    print('经过预处理的表格：33333333333333333')
    print(df)
    return df


def doGenerateAdditionalData(df):
    # # 添加“抢单失败次数”字段
    # # 分别以0.6,0.2,0.1,0.05,0.05的概率填0,1,2,3,4
    # df['抢单失败次数'] = np.random.choice(a=[0, 1, 2, 3, 4], size=len(df),
    #                                       p=[0.4, 0.2, 0.2, 0.1, 0.1]).astype(str)

    # 添加”提交申请时间字段“
    date = datetime.datetime.strptime(df.loc[0, '拟手术日期'], '%Y-%m-%d')
    startTimeStamp = datetime.datetime(date.year, date.month, date.day, 12, 0, 0).timestamp()
    endTimeStamp = datetime.datetime(date.year, date.month, date.day, 18, 0, 0).timestamp()
    df['提交申请时间'] = [''] * len(df)
    for i in range(len(df)):
        tempTime = np.random.randint(startTimeStamp, endTimeStamp)
        tempTime = time.localtime(tempTime)
        print(tempTime)
        tempTime = time.strftime("%Y-%m-%d %H:%M:%S", tempTime)
        df.loc[i, '提交申请时间'] = tempTime

    # 类似地，添加其余字段
    # 取消相关数据字段的随机生成
    # df['是否日间手术'] = np.random.choice(a=['是', '否'], size=len(df), p=[0.2, 0.8])
    # df['机器人'] = np.random.choice(a=['是', '否'], size=len(df), p=[0.05, 0.95])
    # df['介入手术'] = np.random.choice(a=['是', '否'], size=len(df), p=[0.05, 0.95])
    # df['透视'] = np.random.choice(a=['是', '否'], size=len(df), p=[0.05, 0.95])
    # df['钬激光'] = np.random.choice(a=['是', '否'], size=len(df), p=[0.05, 0.95])
    for i in range(1, 30 + 1):
        tempStr = '选择手术间' + str(i)
        df[tempStr] = np.random.choice(a=['是', '否'], size=len(df), p=[1, 0])

    print('经过预处理的表格：44444444444444444')
    print(df)
    return df


def doImportSurgery(df,date):


    sql = """
    select pseudo_operation_data,
       application_number,
       hospital_serial_number,
       admission_number,
       patient_name,
       operation_type,
       surgeon,
       doctor_department,
       apply_department,
       operation_name,
       surgical_coding,
       estimated_duration_operation,
       table_sequence,
       mode_anesthesia,
       whether_operating,
       whether_special_operation,
       has_arranged,
       second_round_scheduling_weight,
       arrange_operating_room_number,
       arrange_operating_number,
       arrange_operating_room,
      -- number_failed_order_grabs,
       submission_time,
       surgery,
       robot,
       interventional_operation,
       perspective,
       holmium_laser,
       select_operating_room1,
       select_operating_room2,
       select_operating_room3,
       select_operating_room4,
       select_operating_room5,
       select_operating_room6,
       select_operating_room7,
       select_operating_room8,
       select_operating_room9,
       select_operating_room10,
       select_operating_room11,
       select_operating_room12,
       select_operating_room13,
       select_operating_room14,
       select_operating_room15,
       select_operating_room16,
       select_operating_room17,
       select_operating_room18,
       select_operating_room19,
       select_operating_room20,
       select_operating_room21,
       select_operating_room22,
       select_operating_room23,
       select_operating_room24,
       select_operating_room25,
       select_operating_room26,
       select_operating_room27,
       select_operating_room28,
       select_operating_room29,
       select_operating_room30
from surgicalapplicationinfo
where pseudo_operation_data like '{}%'
    """.format(date)
    data = pd.DataFrame(query_all_dict(sql), dtype=str)

    conn = create_engine('mysql://' +
                         MYSQL_USERNAME +
                         ':' +
                         MYSQL_PASSWORD +
                         '@' +
                         MYSQL_HOST +':'+os.environ.get('MYSQL_PORT', '3306')+'/' +
                         MYSQL_DATABASE +
                         '?charset=utf8')

    # print(df.columns)
    df.columns = [
        'pseudo_operation_data',
        'application_number',
        'hospital_serial_number',
        'admission_number',
        'patient_name',
        'operation_type',
        'surgeon',
        'doctor_department',
        'apply_department',
        'operation_name',
        'surgical_coding',
        'estimated_duration_operation',
        'table_sequence',
        'mode_anesthesia',
        'whether_operating',
        'whether_special_operation',
        'has_arranged',
        'second_round_scheduling_weight',
        'arrange_operating_room_number',
        'arrange_operating_number',
        'arrange_operating_room',
        #'number_failed_order_grabs',
        'surgery',
        'robot',
        'interventional_operation',
        'perspective',
        'holmium_laser',
        'submission_time',
        'select_operating_room1',
        'select_operating_room2',
        'select_operating_room3',
        'select_operating_room4',
        'select_operating_room5',
        'select_operating_room6',
        'select_operating_room7',
        'select_operating_room8',
        'select_operating_room9',
        'select_operating_room10',
        'select_operating_room11',
        'select_operating_room12',
        'select_operating_room13',
        'select_operating_room14',
        'select_operating_room15',
        'select_operating_room16',
        'select_operating_room17',
        'select_operating_room18',
        'select_operating_room19',
        'select_operating_room20',
        'select_operating_room21',
        'select_operating_room22',
        'select_operating_room23',
        'select_operating_room24',
        'select_operating_room25',
        'select_operating_room26',
        'select_operating_room27',
        'select_operating_room28',
        'select_operating_room29',
        'select_operating_room30'
    ]
    if data.size != 0:
        data.to_sql('surgicalapplicationinfo_python', conn, if_exists='replace', index=False)
    df.to_sql('surgicalapplicationinfo_python', conn, if_exists='replace', index=False)
    # print(df.columns)
    # conn = sqlite3.connect(db_file)
    # df.to_sql('手术申请信息', conn, if_exists='replace', index=False)


def do_import_surgery(date):
    # surgeryTable = pd.read_csv(file_path, dtype=str)
    sql = """
            SELECT
                sip.ELECTR_REQUISITION_NO AS '申请号',
                sip.INHOSP_NO AS '住院流水号',
                sip.INHOSP_INDEX_NO AS '住院号',
                sip.SURGERY_PAT_RESOURCE_NAME AS '类别',
                sip.PAT_NAME AS '姓名',
                sip.PHYSI_SEX_NAME AS '性别',
                sip.CURR_BED_NAME AS '床号',
                di.department AS '申请科室',
                sip.OPERATION_CATEGORY AS '手术类别',
                sip.POSITION AS '部位',
                sip.POSITION_NAME AS '部位名称',
                sip.PRE_SURGERY_DIAG_NAME AS '诊断',
                sip.OPERATION_PREFIX AS '手术前缀',
                sip.SURGERY_OPER_NAME AS '手术名称',
                sip.PRE_SURGERY_DIAG_CODE AS '手术编码3.0',
                sip.OPERATION_SUFFIX AS '手术后缀',
                di.doctor AS '手术者',
                sip.ANES_METHOD_NAME AS '麻醉方式',
                sip.SURGERY_TABLE_NO AS '台序',
                REPLACE ( REPLACE ( sip.SURGERY_DATE, 'T', ' ' ), '-', '/' ) AS '拟手术日期',
                sip.SURGERY_DEPT_NAME AS '手术室',
                sip.SURGERY_LEVEL_NAME AS '手术级别',
                sip.SURGERY_WOUND_CATEG_CODE AS '切口类型',
                sip.SURGERY_DURATION AS '预估手术时长',
                sip.surgery AS '是否日间手术',
                sip.robot AS '机器人',
                sip.interventional_operation AS '介入手术',
                sip.perspective AS '透视',
                sip.holmium_laser AS '钬激光' 
            FROM
                surgicalapplication_info_port sip 
                inner join doctor_info di on di.doctor = sip.SURGERY_DR_NAME AND di.department = sip.APPLY_DEPT_NAME
            WHERE
                sip.SURGERY_DATE LIKE '{}%' 
                AND ( sip.scheduling_state = FALSE OR sip.scheduling_state IS NULL ) 
            ORDER BY
                sip.ELECTR_REQUISITION_NO
            """.format(date)
    print(sql)
    temp_data = query_all_dict(sql)
    surgeryTable = pd.DataFrame(temp_data, dtype=str)
    print('表头：')
    print(surgeryTable.columns)
    print('\n表格：')
    print(surgeryTable)

    surgeryTable = surgeryTable[surgeryTable["手术室"].isin(["第一手术部", "第二手术部", "日间手术室"])]
    surgeryTable = doPreprocessSurgery(surgeryTable)
    surgeryTable = doCheckSpecialSurgery(surgeryTable)
    surgeryTable = doCheckDept(surgeryTable)
    surgeryTable = doGenerateAdditionalData(surgeryTable)
    doImportSurgery(surgeryTable,date)


# if __name__ == '__main__':
#     INPUT_PATH = "../Input/"
#     FILE_NAME = '20220329'
#     do_import_surgery(file_path=INPUT_PATH + FILE_NAME + ".csv",
#                       surgery_db_file='../Data/DataBase/Surgery.db',
#                       baseinfo_db_file='../Data/DataBase/BaseInfo.db')
