
from django.urls import path
from . import views

urlpatterns = [
    path('/bbox_Calculator', views.bbox_Calculator, name='bbox_Calculator'),
    path('/tilecoords_Calculator', views.tilecoords_Calculator, name='tilecoords_Calculator'),
    path('', views.home, name='index'),
]
