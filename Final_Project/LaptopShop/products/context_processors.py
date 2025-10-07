from .models import Product , Category

def product(request):
    return {'product': Product}

def categories(request):
    return {'categories': Category.objects.all()}
