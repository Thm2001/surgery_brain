# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np
import datetime
import pulp
import sqlite3
from sqlalchemy import create_engine

from c2matica_py_server.settings import MYSQL_HOST, MYSQL_USERNAME, MYSQL_PASSWORD, MYSQL_DATABASE
from common.sql_util import *
import pymysql
import os
from common.logger import Logger
import io
import re


class Schedule():
    def __init__(self, schedule_date, input_saving=True):

        self.input_saving = input_saving

        self.logger = Logger(__name__).get_logger()
        self.logger.info("Schedule initializing...")

        self.date = datetime.datetime.strptime(schedule_date, "%Y-%m-%d")
        self.strf_date = self.date.strftime("%Y-%m-%d")
        self.weekday = self.__get_weekday()

        self.__dept_seq_to_room_id = self.__get_dept_seq_to_room_id()
        self.doctor_workload = {}
        self.rooms = {}
        self.rooms_info_dict = self.__get_room_info()

        self.logger.info("Schedule initialized")

    def __get_weekday(self):
        chinese2num = {'星期一': 1, '星期二': 2, '星期三': 3, '星期四': 4, '星期五': 5, '星期六': 6, '星期日': 7}

        if self.date.weekday() in [0, 1, 2, 3, 4]:
            self.logger.info("当前日期是工作日")
            return self.date.weekday() + 1
        else:
            self.logger.info("当前日期是周末，需要获取映射")
            sql = """
                        select 
                               *
                        from mapping_date od
                        where od.date = '{}'
                    """.format(self.strf_date)
            temp_data = query_all_dict(sql)
            mapping_date = pd.DataFrame(temp_data)
            strWeekday = mapping_date["week"][0]
            return chinese2num[strWeekday]

    def __get_dept_seq_to_room_id(self):
        csv = """weekday,dept,seq_alphabet,room_id,weight
        1,产科,A,2619,1000
        3,产科,A,2594,1000
        4,产科,A,2594,1000
        5,产科,A,2619,1000
        1,创伤中心2,A,2595,1000
        2,创伤中心2,A,2595,1000
        3,创伤中心2,A,2595,1000
        4,创伤中心2,A,2595,1000
        1,胆胰外科,A,2613,1000
        1,胆胰外科,B,2602,1000
        1,肝脾外科,C,2602,1000
        2,胆胰外科,A,2617,1000
        3,胆胰外科,A,2613,1000
        4,胆胰外科,A,2613,1000
        5,胆胰外科,A,2613,1000
        1,耳鼻咽喉头颈外科,A,2605,1000
        2,耳鼻咽喉头颈外科,A,2605,1000
        2,耳鼻咽喉头颈外科,B,2602,1000
        3,耳鼻咽喉头颈外科,A,2605,1000
        4,耳鼻咽喉头颈外科,A,2605,1000
        4,耳鼻咽喉头颈外科,B,2602,1000
        5,耳鼻咽喉头颈外科,A,2605,1000
        5,耳鼻咽喉头颈外科,B,2602,1000
        1,妇科,A,2607,1000
        1,妇科,B,2600,1000
        2,妇科,A,2607,1000
        2,妇科,B,2600,1000
        3,妇科,A,2607,1000
        3,妇科,B,2600,1000
        4,妇科,A,2607,1000
        4,妇科,B,2600,1000
        5,妇科,A,2607,1000
        5,妇科,B,2600,1000
        1,肝脾外科,A,2598,1000
        1,肝脾外科,B,2602,1000
        1,胆胰外科,C,2602,1000
        2,肝脾外科,A,2598,1000
        3,肝脾外科,A,2598,1000
        4,肝脾外科,A,2598,1000
        5,肝脾外科,A,2598,1000
        5,肝脾外科,B,2616,1000
        1,骨科创伤,A,2603,1000
        2,骨科创伤,A,2603,1000
        2,骨科创伤,B,2591,1000
        2,神经外科,C,2591,1000
        3,骨科创伤,A,2603,1000
        3,骨科创伤,B,2619,1000
        4,骨科创伤,A,2603,1000
        5,骨科创伤,A,2595,1000
        5,骨科创伤,B,2603,1000
        1,骨科关节,A,2612,1000
        2,骨科关节,A,2612,1000
        2,骨科关节,B,2611,1000
        3,骨科关节,A,2612,1000
        4,骨科关节,A,2612,1000
        5,骨科关节,A,2612,1000
        1,骨科脊柱,A,2610,1000
        1,骨科脊柱,B,2611,1000
        2,骨科脊柱,A,2610,1000
        2,骨科脊柱,B,2613,1000
        3,骨科脊柱,A,2610,1000
        3,骨科脊柱,B,2611,1000
        4,骨科脊柱,A,2610,1000
        4,骨科脊柱,B,2611,1000
        5,骨科脊柱,A,2610,1000
        5,骨科脊柱,B,2611,1000
        1,骨科手足,A,2589,1000
        1,骨科手足,B,2591,1000
        2,骨科手足,A,2589,1000
        3,骨科手足,A,2589,1000
        4,骨科手足,A,2589,1000
        5,骨科手足,A,2589,1000
        2,口腔科,A,2592,1000
        4,口腔科,A,2617,1000
        1,泌尿外科,A,2608,1000
        1,泌尿外科,B,2596,1000
        1,泌尿外科,C,2616,1000
        2,泌尿外科,A,2608,1000
        2,泌尿外科,B,2596,1000
        3,泌尿外科,A,2608,1000
        3,泌尿外科,B,2596,1000
        4,泌尿外科,A,2608,1000
        4,泌尿外科,B,2596,1000
        4,泌尿外科,C,2588,1000
        4,泌尿外科,D,2616,1000
        5,泌尿外科,A,2608,1000
        5,泌尿外科,B,2596,1000
        5,泌尿外科,C,2588,1000
        2,男科,A,2623,0
        1,普外甲乳外科,A,2586,1000
        1,普外甲乳外科,B,2588,1000
        2,普外甲乳外科,A,2586,1000
        2,普外甲乳外科,B,2588,1000
        3,普外甲乳外科,A,2586,1000
        3,普外甲乳外科,B,2588,1000
        3,普外甲乳外科,C,2623,0
        4,普外甲乳外科,A,2586,1000
        4,普外甲乳外科,B,2592,1000
        4,普外甲乳外科,C,2623,0
        5,普外甲乳外科,A,2586,1000
        5,普外甲乳外科,B,2594,1000
        1,普外疝儿外科,A,2617,1000
        1,普外疝儿外科,B,2594,1000
        3,普外疝儿外科,A,2617,1000
        5,普外疝儿外科,A,2617,1000
        2,普外血管外科,A,2587,1000
        3,普外血管外科,A,2593,1000
        4,普外血管外科,A,2587,1000
        5,普外血管外科,A,2593,1000
        1,神经外科,A,2587,1000
        1,神经外科,B,2593,1000
        2,神经外科,A,2591,1000
        2,骨科创伤,C,2591,1000
        2,神经外科,B,2593,1000
        3,神经外科,A,2587,0
        3,神经外科,B,2591,1000
        4,神经外科,A,2591,1000
        4,神经外科,B,2593,1000
        5,神经外科,A,2591,1000
        1,肾脏内科,A,2592,1000
        3,肾脏内科,A,2592,1000
        5,肾脏内科,A,2592,1000
        1,胃肠中心,A,2609,1000
        1,胃肠中心,B,2620,1000
        2,胃肠中心,A,2609,1000
        2,胃肠中心,B,2620,1000
        2,胃肠中心,C,2594,1000
        3,胃肠中心,A,2609,1000
        3,胃肠中心,B,2620,1000
        3,胃肠中心,C,2602,1000
        3,胃肠中心,D,2616,1000
        4,胃肠中心,A,2609,1000
        4,胃肠中心,B,2620,1000
        4,胃肠中心,C,2619,1000
        5,胃肠中心,A,2609,1000
        5,胃肠中心,B,2620,1000
        3,心内科206,B,2587,2000
        5,心脏大血管病中心,A,2587,1000
        1,胸外科,A,2590,1000
        1,胸外科,B,2614,1000
        2,胸外科,A,2590,1000
        2,胸外科,B,2614,1000
        2,胸外科,C,2619,1000
        2,胸外科,D,2616,1000
        3,胸外科,A,2590,1000
        3,胸外科,B,2614,1000
        4,胸外科,A,2590,1000
        4,胸外科,B,2614,1000
        5,胸外科,A,2590,1000
        5,胸外科,B,2614,1000
        1,运动医学科,A,2604,1000
        1,运动医学科,B,2623,1000
        2,运动医学科,A,2604,1000
        2,运动医学科,B,2623,2000
        3,运动医学科,A,2604,1000
        3,运动医学科,B,2623,2000
        4,运动医学科,A,2604,1000
        4,运动医学科,B,2623,2000
        5,运动医学科,A,2604,1000
        5,运动医学科,B,2623,1000
        5,运动医学科,B,2623,1000
        """

        df = pd.read_csv(io.StringIO(csv), dtype={"weekday": int, "room_id": int, "weight": int})
        df = df.loc[df["weekday"] == self.weekday]
        # drop the weekday column
        df = df.drop(columns=["weekday"])

        self.logger.info("当前星期{},当前星期的手术室分配为:\n{}".format(self.weekday, df))
        return df

    def __get_room_id_and_weight(self, dept, seq_alphabet):
        """
        Based on the department and the sequence alphabet, and self.weekday, return the room id.
        :param dept:
        :param seq_alphabet:
        :return:
        """
        # using re to drop the digits of dept
        fuzzy_dept = re.sub(r"\d+", "", dept)

        # select the where self.__dept_seq_to_room_id["dept"] contains fuzzy_dept
        seq_df = self.__dept_seq_to_room_id.loc[self.__dept_seq_to_room_id["dept"].str.contains(fuzzy_dept)]

        if seq_df.__len__() == 0:
            self.logger.info("当前科室{}当日没有对应的手术室".format(dept))
            return None, None

        seq_df = seq_df.loc[seq_df["seq_alphabet"] == seq_alphabet]
        if seq_df.__len__() == 0:
            self.logger.info("当前科室{}{}当日没有对应的手术室".format(dept, seq_alphabet))
            return None, None
        else:
            room_id = seq_df["room_id"].values[0]
            weight = seq_df["weight"].values[0]
            self.logger.info("当前科室{}{}当日对应的手术室为{}".format(dept, seq_alphabet, room_id))
            return room_id, weight

    def __check_doctor_overwork(self, doctor, max_workload=13.0):
        """
        Get the doctor workload of the current day.
        :return:
        """

        if doctor not in self.doctor_workload:
            self.doctor_workload[doctor] = 0.0
        return self.doctor_workload[doctor] > max_workload

    def __get_room_workload(self, room_id, interval=0.5):
        """
        Get the room workload of the current day.
        :return:
        """
        total_duration = 0.0
        for application in self.rooms[room_id]:
            total_duration += application['duration'] + interval
        return total_duration

    def __check_room_overwork(self, room_id, max_workload=13.0, interval=0.5):
        """
        Get the room workload of the current day, noted the last application must end before 8:00 + 13:00 = 21:00
        :return:
        """
        return self.__get_room_workload(room_id, interval) - interval > max_workload

    def __get_unarranged_applications(self):
        """
        Get the applications that have not been arranged.
        :return:
        """
        sql = """
            select 
                  application_number as 'id',
                  surgeon as 'doctor',
                  apply_department as 'dept',
                  estimated_duration_operation as 'duration',
                  table_sequence as 'seq'
            from 
                surgicalapplicationinfo_python
            where
                pseudo_operation_data like '{}%' AND !arrange_operating_room_number
                               """.format(self.strf_date)

        waiting_list = []
        for row in query_all_dict(sql):
            application = {'id': row['id'],
                           'doctor': row['doctor'],
                           'dept': row['dept'],
                           'duration': round(row['duration']), # 向上取整
                           # 'duration': float(row['duration']),
                           # 分解手术序列，A1->A,1
                           'seq_alphabet': row['seq'][0],
                           'seq_number': int(row['seq'][1:])
                           }
            waiting_list.append(application)
        return waiting_list

    def run(self):
        self.logger.info("Schedule running...")

        self.logger.info("获取waiting list...")
        waiting_list = self.__get_unarranged_applications()
        self.logger.info("waiting list获取成功")
        self.logger.info("waiting list长度为{}".format(len(waiting_list)))

        for application in waiting_list:
            self.logger.info("#" * 40)
            self.logger.info("#" * 40)
            self.logger.info("#" * 40)

            self.logger.info("当前申请{}".format(application))

            if self.__check_doctor_overwork(application['doctor']):
                self.logger.info("医生{}已经超过工作量".format(application['doctor']))
                self.logger.info("跳过当前申请")
                continue

            room_id, init_weight = self.__get_room_id_and_weight(application['dept'], application['seq_alphabet'])
            if not room_id:
                self.logger.info("当前申请没有对应的手术室")
                self.logger.info("跳过当前申请")
                continue

            weight = init_weight + 100 * (ord(application['seq_alphabet']) - ord('A')) + application['seq_number']
            operating_department = self.rooms_info_dict[room_id]["operating_department"]
            real_name = self.rooms_info_dict[room_id]["real_name"]

            self.logger.info("当前申请对应的手术室为{}({},{})".format(room_id, operating_department, real_name))
            self.logger.info("当前申请的权重为{}".format(weight))
            application["weight"] = weight

            self.logger.info("加入到手术室中")
            if room_id not in self.rooms:
                self.rooms[room_id] = []
            self.rooms[room_id].append(application)

            self.logger.info("更新医生工作量")
            self.doctor_workload[application['doctor']] += application['duration']
            self.logger.info("当前医生{}的工作量为{}".format(application['doctor'],
                                                             self.doctor_workload[application['doctor']]))

            self.logger.info("基于权重排序")
            self.rooms[room_id].sort(key=lambda x: x['weight'])

            self.logger.info("当前手术室的申请列表长度为{}".format(len(self.rooms[room_id])))
            self.logger.info("当前手术室的占用时长为{}".format(self.__get_room_workload(room_id)))

            while self.__check_room_overwork(room_id):
                self.logger.info("手术室{}已经超过工作量".format(room_id))
                self.logger.info("删除最后一个申请")
                dropped_application = self.rooms[room_id].pop()
                self.logger.info("删除的申请为{}".format(dropped_application))
                self.logger.info("更新医生工作量")
                self.doctor_workload[dropped_application['doctor']] -= dropped_application['duration']
                self.logger.info("当前医生{}的工作量为{}".format(dropped_application['doctor'],
                                                                 self.doctor_workload[dropped_application['doctor']]))

        self.logger.info("回写数据库")
        for room_id, applications in self.rooms.items():
            operating_department = self.rooms_info_dict[room_id]["operating_department"]  # 手术部
            real_name = self.rooms_info_dict[room_id]["real_name"]  # 真实名称
            for application in applications:
                sql = """
                update 
                    surgicalapplicationinfo_python
                set 
                    has_arranged = '是',
                    arrange_operating_number = '{}',
                    arrange_operating_room = '{}',
                    arrange_operating_room_number = '{}',
                    second_round_scheduling_weight = '{}'
                where 
                    application_number = '{}' and pseudo_operation_data like '{}%'
                                """.format(operating_department,
                                           real_name,
                                           room_id,
                                           application["weight"],
                                           application["id"],
                                           self.strf_date)

                conn = pymysql.connect(host=MYSQL_HOST,
                                       user=MYSQL_USERNAME,
                                       password=MYSQL_PASSWORD,
                                       database=MYSQL_DATABASE, charset="utf8")
                cursor = conn.cursor()
                cursor.execute(sql)
                conn.commit()
                cursor.close()
                conn.close()
        self.logger.info("数据库回写成功")
        self.logger.info("Schedule runned")

    def __get_room_info(self):
        """
        Get the room info from the database.
        and return a dict with room_id as key and room info as value.
        room info is a dict with op_dept and r_name as key.
        :return:
        """
        result = {}
        sql = """
            select 
                  id,
                  operating_department,
                  real_name
            from 
                operating_room_info
        """
        for row in query_all_dict(sql):
            result[row["id"]] = {"operating_department": row["operating_department"],
                                 "real_name": row["real_name"]}
        return result
