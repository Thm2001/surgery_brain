# -*- coding: utf-8 -*-
from django.http import HttpResponse
from django.shortcuts import render
import numpy as np
import json
import pygal
from pygal.style import *
from common.snow_util import *
from common.sql_util import *
from . import schedule
from .Codes.doImportSurgery import do_import_surgery
from .Codes.doRefreshSurgery import do_refresh_surgery
from .Codes.doImportBaseInfo import do_import_baseinfo
import os
import datetime



def get_first_schedule(request):
    if request.method == 'POST':
        result = []
        query_condition = json.loads(request.body)
        # 2022-03-29
        case_date = query_condition['date']

        do_import_surgery(date=case_date)
        do_refresh_surgery(fresh_date=case_date)

        my_schedule = schedule.Schedule(shedule_date=case_date)
        my_schedule.pre_first_schedule()
        result.append(my_schedule.do_first_schedule())

        # my_schedule.pre_sec_schedule()
        # result.append(my_schedule.do_sec_schedule())

        return HttpResponse(json.dumps(result))
    return HttpResponse("请求错误")


def get_sec_schedule(request):
    if request.method == 'POST':
        result = []
        query_condition = json.loads(request.body)
        # 2022-03-29
        case_date = query_condition['date']

        do_import_surgery(date=case_date)
        # do_refresh_surgery(fresh_date=case_date.replace('-', ''))

        my_schedule = schedule.Schedule(shedule_date=case_date)
        my_schedule.pre_sec_schedule()
        result.append(my_schedule.do_sec_schedule())

        return HttpResponse(json.dumps(result))
    return HttpResponse("请求错误")
