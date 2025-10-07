from django.shortcuts import render
from django.views.generic import TemplateView
import json
from django.http import JsonResponse
from django.db.models import Count
from django.contrib.gis.geos import fromstr, Point, Polygon
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required # این خط را اضافه کنید

# Create your views here.
class HomePageView(LoginRequiredMixin,TemplateView):
    template_name = 'shops/index.html'


from django.core.serializers import serialize
from django.http import HttpResponse
from .models import Province


def getData(request):
    provinces = serialize('geojson', Province.objects.all())
    # انکود کردن دستی به UTF-8
    provinces = provinces.encode('utf-8')
    return HttpResponse(provinces, content_type='json; charset=utf-8')


def getPOIData(request):
    pois = serialize('geojson', POI.objects.all())
    # انکود کردن دستی به UTF-8
    pois = pois.encode('utf-8')
    return HttpResponse(pois, content_type='json; charset=utf-8')



from .models import POI
from django.views import generic
from django.contrib.gis.db.models.functions import Distance
from django.contrib.gis.geos import fromstr


class Home(generic.ListView):
    context_object_name = 'POIs'
    user_location = fromstr(f'POINT(51 35)', srid=4326)
    queryset = POI.objects.annotate(
        distance=Distance('location', user_location)
    ).order_by('distance')[0:6]
    template_name = 'shops/res.html'


from django.views.generic import TemplateView





# Make sure these imports are at the top of your shops/views.py
import json
from django.http import JsonResponse
from .models import POI, Province


# You don't need 'from django.db.models import Count' for this version

# Replace the entire old function with this corrected version
def get_province_choropleth_data(request):
    """
    Calculates the number of POIs within each province and returns the data
    as a GeoJSON FeatureCollection. This version is corrected to prevent server errors.
    """
    # Get all POIs and Provinces from the database once to be efficient
    all_pois = list(POI.objects.all())
    all_provinces = list(Province.objects.all())

    # The main structure for our final GeoJSON
    feature_collection = {
        "type": "FeatureCollection",
        "features": []
    }

    # Loop through each province to create its feature
    for province in all_provinces:
        count = 0
        province_geom = province.geom

        # Check each POI to see if it's inside the current province
        for poi in all_pois:
            # Ensure both geometries exist before checking
            if province_geom and poi.location:
                if province_geom.contains(poi.location):
                    count += 1

        # Manually create the GeoJSON feature for the province
        # This includes its geometry and properties
        feature = {
            "type": "Feature",
            "geometry": json.loads(province.geom.geojson),
            "properties": {
                "province_id": province.id,
                "province_name": province.province,
                "region": str(province.region),  # Convert BigIntegerField to string for JSON
                "poi_count": count
            }
        }
        feature_collection["features"].append(feature)

    return JsonResponse(feature_collection)


# Add this import at the top of your views.py if it's not already there
from django.core.serializers import serialize


# Add this new view function at the end of the file
def export_selected_pois(request):
    """
    Exports selected POIs as a GeoJSON file.
    It expects a GET parameter 'ids' with comma-separated POI primary keys.
    e.g., /export-pois/?ids=1,5,12
    """
    ids_str = request.GET.get('ids', '')
    if not ids_str:
        # If no IDs are provided, return an empty FeatureCollection
        return HttpResponse(
            '{"type": "FeatureCollection", "features": []}',
            content_type="application/json"
        )

    try:
        # Convert the comma-separated string of IDs into a list of integers
        selected_ids = [int(id_val) for id_val in ids_str.split(',')]
    except (ValueError, TypeError):
        # Handle cases where IDs are not valid numbers
        return HttpResponse("Invalid IDs provided.", status=400)

    # Query the database to get the POIs with the selected IDs
    selected_pois = POI.objects.filter(pk__in=selected_ids)

    # Serialize the queryset to GeoJSON
    data = serialize('geojson', selected_pois, geometry_field='location',
                     fields=('name', 'shop_type', 'phone', 'website'))

    # Create an HttpResponse that forces the browser to download the file
    response = HttpResponse(data, content_type='application/json')
    response['Content-Disposition'] = 'attachment; filename="exported_pois.geojson"'

    return response


# Add these imports at the top of your views.py if they aren't there
from django.views.decorators.http import require_http_methods
from django.contrib.gis.geos import Point


# import json # Already imported
@login_required
@require_http_methods(["POST"])  # This view should only accept POST requests
def create_poi(request):
    if not request.user.is_superuser:
        return JsonResponse({'status': 'error', 'message': 'Access denied. You do not have permission.'}, status=403)
    try:
        # Load the data from the request's body
        data = json.loads(request.body)

        # Extract attribute data
        name = data.get('name')
        description = data.get('description', '')  # Optional fields

        # Extract geometry data (latitude and longitude)
        lat = data['lat']
        lng = data['lng']

        # Basic validation
        if not name:
            return JsonResponse({'status': 'error', 'message': 'Name is a required field.'}, status=400)

        # Create a new POI instance
        new_poi = POI.objects.create(
            name=name,
            description=description,
            # Create a GIS Point object for the location field
            location=Point(lng, lat, srid=4326)
        )

        # Return a success response
        return JsonResponse({
            'status': 'success',
            'message': 'POI created successfully!',
            'id': new_poi.id
        })

    except (KeyError, json.JSONDecodeError) as e:
        # Handle cases where data is missing or malformed
        return JsonResponse({'status': 'error', 'message': f'Invalid data provided: {str(e)}'}, status=400)
    except Exception as e:
        # Handle other potential errors
        return JsonResponse({'status': 'error', 'message': f'An unexpected error occurred: {str(e)}'}, status=500)


# No new imports are likely needed if you have JsonResponse, POI, and serialize

def search_pois(request):
    """
    Searches for POIs by name based on a query parameter.
    e.g., /api/pois/search/?name=پایتخت
    """
    query = request.GET.get('name', None)  # Get the search term from the URL

    if query:
        # Filter the POI objects where the name contains the query (case-insensitive)
        results = POI.objects.filter(name__icontains=query)
    else:
        # If no query is provided, return an empty list
        results = POI.objects.none()

    # Serialize the results into GeoJSON format
    data = serialize('geojson', results, geometry_field='location',
                     fields=('name', 'shop_type', 'phone', 'website'))

    return HttpResponse(data, content_type='application/json')


# No new imports needed

def get_province_stats(request, province_id):
    """
    Returns statistics for a given province, including POI count and names.
    """
    try:
        # Get the specific province object from the database
        province = Province.objects.get(pk=province_id)

        # Find all POIs that are located within the province's geometry
        pois_in_province = POI.objects.filter(location__within=province.geom)

        # Get the count
        poi_count = pois_in_province.count()

        # Get the list of names
        poi_names = list(pois_in_province.values_list('name', flat=True))

        # Prepare the data to be sent back as JSON
        data = {
            'status': 'success',
            'province_name': province.province,
            'poi_count': poi_count,
            'poi_names': poi_names
        }
        return JsonResponse(data)

    except Province.DoesNotExist:
        return JsonResponse({'status': 'error', 'message': 'Province not found.'}, status=404)
    except Exception as e:
        return JsonResponse({'status': 'error', 'message': str(e)}, status=500)




# Add these imports at the top of your views.py
from django.contrib.gis.geos import GEOSGeometry, Polygon, MultiPolygon
from django.views.decorators.http import require_http_methods
import json

@login_required
@require_http_methods(["POST"])
def create_province(request):
    if not request.user.is_superuser:
        return JsonResponse({'status': 'error', 'message': 'Access denied. You do not have permission.'}, status=403)
    try:
        data = json.loads(request.body)
        province_name_form = data.get('province_name')
        name_form = data.get('name')
        region_str = data.get('region')
        geometry_data = data.get('geometry') # Renamed for clarity

        if not all([province_name_form, name_form, region_str, geometry_data]):
            return JsonResponse({'status': 'error', 'message': 'All fields and geometry are required.'}, status=400)

        # Step 1: Create a GEOSGeometry object from the input GeoJSON
        geom = GEOSGeometry(json.dumps(geometry_data), srid=4326)

        # Step 2: Check if the geometry is a Polygon, and if so, convert it to a MultiPolygon
        if isinstance(geom, Polygon):
            # Create a MultiPolygon that contains only our single Polygon
            multi_polygon_geom = MultiPolygon(geom)
        else:
            # If it's already a MultiPolygon or something else, use it directly (for future flexibility)
            multi_polygon_geom = geom


        # Step 3: Create and save the new Province instance with the correct geometry type
        new_province = Province.objects.create(
            province=province_name_form,
            name=name_form,
            region=int(region_str),
            geom=multi_polygon_geom  # Assign the corrected MultiPolygon object
        )

        return JsonResponse({
            'status': 'success',
            'message': 'Province created successfully!',
            'id': new_province.id
        })

    except (KeyError, ValueError, json.JSONDecodeError) as e:
        return JsonResponse({'status': 'error', 'message': f'Invalid data provided: {str(e)}'}, status=400)
    except Exception as e:
        return JsonResponse({'status': 'error', 'message': f'An unexpected error occurred: {str(e)}'}, status=500)


