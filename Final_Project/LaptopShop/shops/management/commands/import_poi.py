import json
from django.core.management.base import BaseCommand
from django.contrib.gis.geos import Point
from shops.models import POI  # مسیر مدل رو با توجه به اپ خودت تنظیم کن

class Command(BaseCommand):
    help = 'وارد کردن نقاط از فایل GeoJSON به جدول POI'

    def add_arguments(self, parser):
        parser.add_argument('geojson_file', type=str, help='مسیر فایل GeoJSON')

    def handle(self, *args, **options):
        file_path = options['geojson_file']
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                data = json.load(f)

            for feature in data['features']:
                properties = feature['properties']
                geometry = feature['geometry']

                if geometry['type'] == 'Point':
                    coords = geometry['coordinates']
                    # تبدیل مختصات به Point (longitude, latitude)
                    location = Point(coords[0], coords[1], srid=4326)

                    # ساخت شیء POI با مقادیر پیش‌فرض برای فیلدهای خالی
                    poi = POI(
                        name=properties.get('name', 'بدون نام'),
                        location=location,
                        description=properties.get('description', ''),
                        opening_hours=properties.get('opening_hours', ''),
                        shop_type=properties.get('shop', ''),  # 'shop' به 'shop_type' مپ می‌شه
                        phone=properties.get('phone', ''),
                        website=properties.get('website', '')
                    )
                    poi.save()

            self.stdout.write(self.style.SUCCESS('داده‌ها با موفقیت وارد جدول POI شدند!'))

        except Exception as e:
            self.stdout.write(self.style.ERROR(f'خطا در وارد کردن داده‌ها: {str(e)}'))