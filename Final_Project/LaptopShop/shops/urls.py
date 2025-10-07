from django.contrib import admin
from django.urls import path
from shops.views import HomePageView, getData, Home, getPOIData, get_province_choropleth_data, \
    export_selected_pois, create_poi, search_pois, get_province_stats, create_province

urlpatterns = [
    path('getData/', getData, name='getData'),
    path('getPOIData/', getPOIData, name='getPOIData'),
    path('viewer/', HomePageView.as_view(), name='viewer'),
    path('getDistance/<int:X>/<int:Y>/', Home.as_view(), name='getDistance'),
    path('getChoroplethData/', get_province_choropleth_data, name='getChoroplethData'),
    path('export-pois/', export_selected_pois, name='export_pois'),
    path('api/poi/create/', create_poi, name='create_poi'),
    path('api/pois/search/', search_pois, name='search_pois'),
    path('api/province/create/', create_province, name='create_province'),
    path('api/province-stats/<int:province_id>/', get_province_stats, name='get_province_stats'),

]
