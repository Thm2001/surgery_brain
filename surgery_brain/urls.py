from django.urls import path
from . import views

urlpatterns = [

    path('first_schedule', views.get_first_schedule),
    path('sec_schedule', views.get_sec_schedule),

]
