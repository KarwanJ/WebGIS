from import_export.admin import ExportMixin
from django.contrib import admin
from jalali_date.admin import ModelAdminJalaliMixin

from .models import Discount, Order, Product, Comment, Category, Color

admin.site.register(Category)
admin.site.register(Color)
admin.site.register(Discount)


class CommentInline(admin.TabularInline):
    model= Comment
    fields= ( 'author', 'stars', 'active', )
    extra= 0


@admin.register(Product)
class ProductAdmin(ModelAdminJalaliMixin ,admin.ModelAdmin):
    list_display= ('title', 'price', 'active',)

    inlines= [CommentInline]


@admin.register(Comment)
class CommentAdmin(ExportMixin,admin.ModelAdmin):
    '''Admin View for Comment'''

    list_display = ('product', 'author', 'stars', 'active', )
    list_filter = ('active',)
    readonly_fields = ('product',)
    search_fields = ('product', 'author',)

@admin.register(Order)
class OrderAdmin(ExportMixin, admin.ModelAdmin):
    list_display = ('id', 'user', 'product', 'quantity', 'total_price', 'created_at', 'updated_at')
    list_filter = ('created_at', 'updated_at')
    search_fields = ('user__username', 'product__name')