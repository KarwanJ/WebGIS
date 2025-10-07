from __future__ import unicode_literals

from django.db import models

# Create your models here.
from django.contrib.gis.db import models
from django.db.models import Manager as GeoManager



class POI(models.Model):
    name = models.CharField(max_length=255)
    location = models.PointField(srid=4326)
    description = models.TextField(blank=True, null=True)
    opening_hours = models.CharField(max_length=200, blank=True, null=True)
    shop_type = models.CharField(max_length=200, blank=True, null=True)
    phone = models.CharField(max_length=200, blank=True, null=True)
    website = models.URLField(blank=True, null=True)
    objects = GeoManager()
    def __unicode__(self):
        return self.name
    class Meta:
        verbose_name_plural = "POIs"

class Province(models.Model):
    province = models.CharField(max_length=60)
    name = models.CharField(max_length=50)
    region = models.BigIntegerField()
    geom=models.MultiPolygonField(srid=4326)
    def __unicode__(self):
        return self.name

    # class POI(models.Model):
    #     name = models.CharField(max_length=20)
    #     location = models.PointField(max_length=20)
    #     objects = GeoManager()
    #
    #     def __unicode__(self):
    #         return self.name
    #     class Meta:
    #         verbose_name_plural = "POIs"
