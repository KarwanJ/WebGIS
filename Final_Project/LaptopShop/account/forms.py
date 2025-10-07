from django import forms
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.forms import ValidationError

from django.contrib.auth.forms import UserChangeForm



class LoginForm(forms.Form):
    username = forms.CharField(max_length=50,widget=forms.TextInput(attrs={'class':'input100'}))
    password = forms.CharField(max_length=50,widget=forms.PasswordInput(attrs={'class':'input100'}))
    def clean_password(self):
        user=authenticate(username=self.cleaned_data.get('username'),password=self.cleaned_data.get('password'))
        if user is not None:
            return self.cleaned_data.get('password')
        raise ValidationError('Invalid username or password',code='invalid')


class UserEditForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs.update({'class': 'form-control'})