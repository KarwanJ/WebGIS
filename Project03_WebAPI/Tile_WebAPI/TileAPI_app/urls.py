from django.urls import path

from Tile_WebAPI import settings
from . import views
from django.conf.urls.static import static

app_name = 'TileAPI_app'
urlpatterns = [
    path('', views.TileView.as_view(), name='TileView'),
    path('get_tile/', views.TileView.as_view(), name='get_tile'),  # Path to ajax request
]