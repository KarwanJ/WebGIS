from django.core.files.base import ContentFile
import requests
from django.http import JsonResponse
from django.shortcuts import render
from django.views import View
from TileAPI_app.models import Tile
from django.views.decorators.csrf import csrf_exempt
import json

class TileView(View):
    @csrf_exempt
    def get(self, request):
        zoom = [14, 19, 11, 9, 1, 7, 3]
        tile_x = [9280, 336663, 1316, 293, 1180, 77, 0]
        tile_y = [4840, 211845, 828, 151, 602, 38, 3]
        zipped_context = zip(zoom, tile_x, tile_y) #giving user some true samples to test
        context = {'zipped_context': zipped_context}
        return render(request, 'TileAPI_app/tile_form.html', context)

    def post(self, request):
        # Get data from the AJAX request
        data = json.loads(request.body)
        zoom = data.get('zoom')
        tile_x = data.get('tile_x')
        tile_y = data.get('tile_y')

        # Attempt to search for the existing tile in the database
        tile = Tile.objects.filter(zoom=zoom, tile_x=tile_x, tile_y=tile_y).first()

        # If the tile is found, load the image from the database
        if tile:
            image_url = tile.tile_image.url
            return JsonResponse({"image_url": image_url})  # Return the image URL as JSON
        else:
            # Construct the download URL for the tile
            url = f"https://tile.openstreetmap.org/{zoom}/{tile_x}/{tile_y}.png"

            # Headers to simulate a browser request
            headers = {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:135.0) Gecko/20100101 Firefox/135.0',
                'Accept': 'image/avif,image/webp,image/png,image/svg+xml,image/*;q=0.8,*/*;q=0.5',
                'Accept-Encoding': 'gzip, deflate, br, zstd',
                'Accept-Language': 'en-US,en;q=0.5',
                'Referer': 'https://www.openstreetmap.org/',
                'Connection': 'keep-alive',
                'Cookie': '_osm_totp_token=981352',
                'Sec-Fetch-Dest': 'image',
                'Sec-Fetch-Mode': 'no-cors',
                'Sec-Fetch-Site': 'same-site',
                'TE': 'trailers',
                'Alt-Used': 'tile.openstreetmap.org',
            }

            # Send the request with the proper headers
            response = requests.get(url, headers=headers)

            if response.status_code == 200:
                tile_image = ContentFile(response.content)
                image_path = f"{zoom}_{tile_x}_{tile_y}.png"
                tile = Tile.objects.create(zoom=zoom, tile_x=tile_x, tile_y=tile_y)
                tile.tile_image.save(image_path, tile_image)

                # Send the image path from OpenStreetMap to the client
                return JsonResponse({"image_url": tile.tile_image.url})
            else:
                return JsonResponse({"image_url": None})
