# Create your models here.
from django.db import models

class Tile(models.Model):
    zoom = models.IntegerField()
    tile_x = models.IntegerField()
    tile_y = models.IntegerField()
    tile_image = models.ImageField(upload_to='tiles/')  # For storing the tile image

    class Meta:
        unique_together = ('zoom', 'tile_x', 'tile_y')  # Prevent storing duplicate tiles

    def __str__(self):
        return f"Tile {self.zoom} ({self.tile_x}, {self.tile_y})"
