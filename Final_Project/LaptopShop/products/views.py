from django.contrib import messages
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from .models import Product, Category, Color, Discount, Order
from .forms import CommentForm
from django.views import View
from django.views import generic
from django.contrib import messages
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.decorators import login_required
from django.contrib.auth.decorators import user_passes_test

from .models import Product, Category, Color
from .forms import CommentForm, ProductForm


class ProductListView(generic.ListView):
    queryset = Product.objects.filter(active=True)
    template_name = 'products/product_list.html'
    context_object_name = 'products'
    paginate_by = 8

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        for product in context['products']:
            if product.discount:
                discount = product.discount.discount
                product.discount_price = int(product.price - (product.price * discount / 100))
            else:
                product.discount_price = int(product.price)
        return context


def product_detail_view(request, pk):
    product = get_object_or_404(Product, pk=pk)

    product_comment = product.comments.filter(active=True).order_by('-datetime_created')

    category_product = Category.objects.filter(products=product)
    color_product = Color.objects.filter(products=product)

    discount_price = product.get_discount_price()

    if request.method == "POST":
        comment_form = CommentForm(request.POST)
        if comment_form.is_valid():
            new_comment = comment_form.save(commit=False)
            new_comment.product = product
            new_comment.author = request.user
            new_comment.save()
            messages.success(request, _('Comment Successfully created'))

            comment_form = CommentForm()
    else:
        comment_form = CommentForm()

    return render(
        request,
        'products/product_detail.html',
        {
            'product': product,
            'comment_form': comment_form,
            'product_comment': product_comment,
            'category': category_product,
            'colors': color_product,
            'discount_price': discount_price,
        }
    )


@login_required
def create_order(request, product_id):
    product = get_object_or_404(Product, pk=product_id)

    if request.method == 'POST':
        quantity = int(request.POST.get('quantity', 1))
        total_price = product.price * quantity

        order = Order.objects.create(
            user=request.user,
            product=product,
            quantity=quantity,
            total_price=total_price
        )

        messages.success(request, "Your purchase was successful!")

        return redirect('product-detail', pk=product.id)

    return redirect('product-detail', pk=product.id)


@login_required
def user_orders(request):
    orders = Order.objects.filter(user=request.user)
    return render(request, 'products/user_orders.html', {'orders': orders})


def product_search(request):
    query = request.GET.get('query')
    results = []
    if query:
        results = Product.objects.filter(title__icontains=query)  # Search by product name
    return render(request, 'products/product_search.html', {'results': results, 'query': query})


def is_superadmin(user):
    return user.is_superuser


@user_passes_test(is_superadmin)
def product_management(request):
    products = Product.objects.all()
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, "✅ Product added successfully!")
            return redirect('product-management')
    else:
        form = ProductForm()

    return render(request, 'admin_panel/product_management.html', {'products': products, 'form': form})


@user_passes_test(is_superadmin)
def delete_product(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    product.delete()
    messages.success(request, "❌ Product deleted successfully!")
    return redirect('product-management')


def category_products(request, category_id):
    category = get_object_or_404(Category, id=category_id)
    products = Product.objects.filter(category=category)

    return render(request, 'products/category_products.html', {'category': category, 'products': products})
