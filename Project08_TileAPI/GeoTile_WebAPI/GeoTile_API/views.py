import math
import requests
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

# GeoServer WMS config
GEOSERVER_WMS_URL = "http://localhost:8080/geoserver/WEBGIS_Project7/wms"
LAYER_NAME = "WEBGIS_Project7:TehranLaptopShops"

# Convert tile X/Y/Z to BBOX in EPSG:4326
def tile_to_bbox_epsg4326(x, y, z):
    n = 2 ** z
    lon_min = x / n * 360.0 - 180.0
    lon_max = (x + 1) / n * 360.0 - 180.0
    lat_rad_min = math.atan(math.sinh(math.pi * (1 - 2 * y / n)))
    lat_rad_max = math.atan(math.sinh(math.pi * (1 - 2 * (y + 1) / n)))
    lat_max = math.degrees(lat_rad_min)
    lat_min = math.degrees(lat_rad_max)
    return lon_min, lat_min, lon_max, lat_max

# Show homepage with usage info and sample tiles only
def index(request):
    return render(request, "GeoTile_API/index.html")

# Get tile image from GeoServer
def get_tile(request, z, x, y):
    bbox = tile_to_bbox_epsg4326(x, y, z)
    params = {
        "service": "WMS",
        "version": "1.1.1",
        "request": "GetMap",
        "layers": LAYER_NAME,
        "styles": "",
        "format": "image/png",
        "transparent": "true",
        "height": 256,
        "width": 256,
        "srs": "EPSG:4326",
        "bbox": f"{bbox[0]},{bbox[1]},{bbox[2]},{bbox[3]}"
    }

    response = requests.get(GEOSERVER_WMS_URL, params=params)

    if response.status_code == 200:
        return HttpResponse(response.content, content_type="image/png")
    else:
        return HttpResponse(f"GeoServer error: {response.status_code}", status=500)

# Optional: still provide the JSON API for tile range if user wants it
def tehran_tiles(request, zoom):
    try:
        zoom = int(zoom)

        # Approximate Tehran bounding box
        min_lon = 51.15
        min_lat = 35.52
        max_lon = 51.68
        max_lat = 35.86

        def lonlat_to_tilexy(lon, lat, zoom):
            n = 2 ** zoom
            x = int((lon + 180.0) / 360.0 * n)
            lat_rad = math.radians(lat)
            y = int((1.0 - math.log(math.tan(lat_rad) + 1 / math.cos(lat_rad)) / math.pi) / 2.0 * n)
            return x, y

        x_min, y_max = lonlat_to_tilexy(min_lon, min_lat, zoom)
        x_max, y_min = lonlat_to_tilexy(max_lon, max_lat, zoom)

        return JsonResponse({
            "zoom": zoom,
            "x_range": [x_min, x_max],
            "y_range": [y_min, y_max]
        })
    except Exception as e:
        return JsonResponse({"error": str(e)}, status=400)
