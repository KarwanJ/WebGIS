from django.urls import path
from . import views


urlpatterns = [
    path('' ,views.ProductListView.as_view(), name='product-list'),
    path('<int:pk>/' ,views.product_detail_view, name='product-detail'),
    path('<int:product_id>/order/', views.create_order, name='create_order'),
    path('search/', views.product_search, name='product_search'),
    path('chart/', views.user_orders, name='user_orders'),
     path('management/', views.product_management, name='product-management'),
    path('management/delete/<int:product_id>/', views.delete_product, name='delete-product'),
    path('category/<int:category_id>/', views.category_products, name='category-products'),
]