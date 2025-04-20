from django.urls import path
from .views import index, get_tile, tehran_tiles

urlpatterns = [
    path('', index, name='index'),
    path('get_tile/<int:z>/<int:x>/<int:y>/', get_tile, name='get_tile'),
    path('tehran_tiles/<int:zoom>/', tehran_tiles, name='tehran_tiles'),
]
