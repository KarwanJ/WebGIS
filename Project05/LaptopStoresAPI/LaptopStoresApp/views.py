from django.http import JsonResponse
from django.db import connection

def find_nearby_stores(request):
    # Get parameters from URL
    try:
        lat = float(request.GET.get('lat', 35.7))  # Default latitude (Tehran)
        lon = float(request.GET.get('lon', 51.4))  # Default longitude (Tehran)
        radius = float(request.GET.get('radius', 5000))  # Default radius 5000 meters
    except ValueError:
        return JsonResponse(
            {'error': 'Invalid input. Please provide valid numbers for lat, lon, and radius.'},
            status=400
        )

    # Validate coordinate ranges and radius
    if not (-90 <= lat <= 90):
        return JsonResponse(
            {'error': 'Latitude must be between -90 and 90.'},
            status=400
        )
    if not (-180 <= lon <= 180):
        return JsonResponse(
            {'error': 'Longitude must be between -180 and 180.'},
            status=400
        )
    if radius <= 0:
        return JsonResponse(
            {'error': 'Radius must be a positive number.'},
            status=400
        )

    # Raw SQL query with PostGIS functions
    query = """
        SELECT name, "addr:city", "addr:street", description, phone, opening_hours, email, ST_AsText(geom) AS coordinates
        FROM tehran_laptop_tb
        WHERE ST_DWithin(
            geom::geography,
            ST_SetSRID(ST_MakePoint(%s, %s), 4326)::geography,
            %s
        );
    """

    # Execute query using direct connection
    try:
        with connection.cursor() as cursor:
            cursor.execute(query, [lon, lat, radius])
            rows = cursor.fetchall()
    except Exception as e:
        return JsonResponse(
            {'error': f'Database error: {str(e)}'},
            status=500
        )

    # Convert results to list of dictionaries
    stores = [
        {
            'name': row[0] if row[0] else 'N/A',
            'addr_city': row[1] if row[1] else 'N/A',
            'addr_street': row[2] if row[2] else 'N/A',
            'description': row[3] if row[3] else 'N/A',
            'phone': row[4] if row[4] else 'N/A',
            'opening_hours': row[5] if row[5] else 'N/A',
            'email': row[6] if row[6] else 'N/A',
            'coordinates': row[7]
        }
        for row in rows
    ]

    # Return JSON response
    return JsonResponse({
        'stores': stores,
        'count': len(stores),
        'status': 'success'
    })