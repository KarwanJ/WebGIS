from django.shortcuts import render
import math



def tile2lon(x, z):
    return x / (2 ** z) * 360.0 - 180.0

def tile2lat(y, z):
    n_ = math.pi - 2.0 * math.pi * y / (2 ** z)
    return math.degrees(math.atan(math.sinh(n_)))

def latlon_to_tile(lat, lon, zoom):
    n = 2 ** zoom
    tile_x = int((lon + 180.0) / 360.0 * n)
    lat_rad = math.radians(lat)
    tile_y = int((1.0 - math.log(math.tan(lat_rad) + 1 / math.cos(lat_rad)) / math.pi) / 2.0 * n)
    return tile_x, tile_y


# ===== Views =====

def home(request):
    return render(request, 'tilemath_app/home.html')


def bbox_Calculator(request):
    if request.method == 'GET':
        return render(request, 'tilemath_app/bbox_Calculator.html')

    elif request.method == 'POST':
        try:
            # Parse inputs
            x = int(request.POST.get('x'))
            y = int(request.POST.get('y'))
            zoom = int(request.POST.get('zoom'))

            # Validate zoom and tile coordinates
            if not (0 <= zoom <= 23):
                raise ValueError("Zoom level must be between 0 and 23")
            n = 2 ** zoom
            if not (0 <= x < n and 0 <= y < n):
                raise ValueError(f"Tile X and Y must be between 0 and {n - 1} at zoom level {zoom}")


            # Compute bounding box
            min_lon = tile2lon(x, zoom)
            max_lon = tile2lon(x + 1, zoom)
            min_lat = tile2lat(y + 1, zoom)
            max_lat = tile2lat(y, zoom)

            context = {
                'min_lon': min_lon,
                'min_lat': min_lat,
                'max_lon': max_lon,
                'max_lat': max_lat,
                'x': x,
                'y': y,
                'zoom': zoom
            }
            return render(request, 'tilemath_app/bbox_result.html', context)

        except Exception as e:
            # Render form with error message
            return render(request, 'tilemath_app/bbox_Calculator.html', {
                'error': f'Error while processing tile inputs: {str(e)}'
            })


def tilecoords_Calculator(request):
    if request.method == 'GET':
        return render(request, 'tilemath_app/tilecoords_Calculator.html')

    elif request.method == 'POST':
        try:
            # Parse inputs
            lat = float(request.POST.get('latitude'))
            lon = float(request.POST.get('longitude'))
            zoom = int(request.POST.get('zoom'))

            # Validate coordinate ranges
            if not (-85.0511 <= lat <= 85.0511):
                raise ValueError("Latitude must be between -85.0511 and +85.0511")
            if not (-180.0 <= lon <= 180.0):
                raise ValueError("Longitude must be between -180 and +180")
            if not (0 <= zoom <= 23):
                raise ValueError("Zoom level must be between 0 and 23")

            # Compute tile numbers
            tile_x, tile_y = latlon_to_tile(lat, lon, zoom)

            context = {
                'latitude': lat,
                'longitude': lon,
                'zoom': zoom,
                'tile_x': tile_x,
                'tile_y': tile_y
            }

            return render(request, 'tilemath_app/tilecoords_result.html', context)

        except Exception as e:
            # Render form with error message
            return render(request, 'tilemath_app/tilecoords_Calculator.html', {
                'error': f'Error while processing coordinates: {str(e)}'
            })
