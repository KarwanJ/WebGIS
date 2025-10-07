from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include

from laptop_shop import settings

urlpatterns = [
                  path('admin/', admin.site.urls),
                  path('', include('pages.urls')),
                  path('', include('account.urls')),
                  path('product/', include('products.urls')),
                  path('shops/', include('shops.urls'))

              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
