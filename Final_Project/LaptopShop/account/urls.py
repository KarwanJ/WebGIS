from django.urls import path
from . import views


app_name = 'account'
urlpatterns = [
    path('login/', views.user_login, name='user_login'),
    path('logout/', views.logout_user, name='logout_user'),
    path('register/', views.user_register, name='user_register'),
    path('profile/edit/', views.edit_profile, name='profile_edit')
]