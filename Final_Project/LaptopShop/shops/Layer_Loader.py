import os
from django.contrib.gis.utils import LayerMapping
from .models import Province

province_mapping = {
    'province': 'PROVINCE',
    'name': 'name',
    'region': 'Region',
    'geom': 'MULTIPOLYGON',
}

province_shp = os.path.abspath('D:\\Data\\Province\\Province.shp')

def run(verbose=True):
    lm = LayerMapping(
        Province,
        province_shp,
        province_mapping,
        transform=False,
        encoding='utf8'
    )
    lm.save(strict=True, verbose=verbose)