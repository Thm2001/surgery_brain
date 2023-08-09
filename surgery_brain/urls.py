from django.contrib import admin
from django.urls import path, include
from . import views
from django.views import static
from django.conf import settings
from django.conf.urls import url

urlpatterns = [

    path('first_schedule', views.get_first_schedule),
    path('sec_schedule', views.get_sec_schedule),

]
