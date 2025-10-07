from django.contrib.auth.models import User
from django.http import HttpResponse
from django.contrib.auth import authenticate, login,logout
from django.views.generic import View
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from account.forms import LoginForm, UserEditForm



#using django forms
def user_login(request):
    if request.user.is_authenticated==True:
        return HttpResponse("<h1>Logged in was successful</h1>")
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            user=User.objects.get(username=form.cleaned_data.get('username'))
            login(request,user)
            return redirect('home')
    else:
        form = LoginForm()
    return render(request,'account/login.html',{'form':form})

def logout_user(request):
    logout(request)
    return redirect('home')


def user_register(request):
    context = {'errors': []}
    if request.user.is_authenticated:
        return redirect('/')

    if request.method == 'POST':
        username = request.POST["username"]
        email = request.POST["email"]
        password1 = request.POST["password1"]
        password2 = request.POST["password2"]

        # بررسی تکراری بودن نام کاربری
        if User.objects.filter(username=username).exists():
            context['errors'].append('This username is already taken. Please choose another one.')
            return render(request, 'account/register.html', context)

        if password1 != password2:
            context['errors'].append('Passwords are not the same')
            return render(request, 'account/register.html', context)

        # ایجاد کاربر جدید
        user = User.objects.create(username=username, email=email)
        user.set_password(password1)  # رمز عبور باید هش شود
        user.save()

        # ثبت‌نام موفق و ورود کاربر
        login(request, user)
        return redirect('home')

    return render(request, 'account/register.html', context)



@login_required
def edit_profile(request):
    if request.method == 'POST':
        form = UserEditForm(request.POST, request.FILES, instance=request.user)
        if form.is_valid():
            form.save()
            messages.success(request, "Your profile has been updated successfully!")
            return redirect('home')
    else:
        form = UserEditForm(instance=request.user)

    return render(request, 'account/profile_edit.html', {'form': form})
