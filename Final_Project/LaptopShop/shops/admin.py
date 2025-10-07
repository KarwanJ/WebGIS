
# Register your models here.
from django.contrib import admin
from .models import POI, Province
from leaflet.admin import LeafletGeoAdmin

class POIsAdmin(LeafletGeoAdmin):
    list_display = ('name', 'location')

admin.site.register(POI, POIsAdmin)

class ProvincesAdmin(LeafletGeoAdmin):
    list_display = ('province', 'region')

admin.site.register(Province, ProvincesAdmin)