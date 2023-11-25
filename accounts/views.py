from django.shortcuts import render, redirect
from django.contrib.auth.hashers import check_password, make_password
from django.contrib import messages
from contacts.models import Contact
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login as auth_login, logout as logout_user
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
from .models import UserModel
from .serializers import UserSerializer

# Create your views here.

# def login(request):
#     if request.method == 'POST':
#         username = request.POST['username']
#         password = request.POST['password']

#         user = auth.authenticate(username=username, password=password)

#         if user is not None:
#             auth.login(request, user)
#             messages.success(request, ': User logged in successfully.')
#             return redirect('dashboard')
#         else:
#             messages.error(request, 'Incorrect Credentials, please try again.')
#             return redirect('login')
#     return render(request, 'accounts/login.html')

# def register(request):
#     if request.method == 'POST':
#         firstname = request.POST['firstname']
#         lastname = request.POST['lastname']
#         username = request.POST['username']
#         email = request.POST['email']
#         password = request.POST['password']
#         confirm_password = request.POST['confirm_password']

#         if password == confirm_password:
#             if User.objects.filter(username=username).exists():
#                 messages.error(request, 'Username already exists!')
#                 return redirect('register')
#             else:
#                 if User.objects.filter(email=email).exists():
#                     messages.error(request, 'Email already exists!')
#                     return redirect('register')
#                 else:
#                     user = User.objects.create_user(first_name=firstname, last_name=lastname, email=email, username=username, password=password)
#                     auth.login(request, user)
#                     messages.success(request, 'You are now logged in.')
#                     return redirect('dashboard')
#         else:
#             messages.error(request, 'Password does not match.')
#             return redirect('register')
#     else:
#         return render(request, 'accounts/register.html')


@login_required(login_url = 'login')
def dashboard(request):
    user_inquiry = Contact.objects.order_by('-create_date').filter(user_id=request.user.id)
    # count = Contact.objects.order_by('-create_date').filter(user_id=request.user.id).count()

    data = {
        'inquiries': user_inquiry,
    }
    return render(request, 'accounts/dashboard.html', data)

def logout(request):
    logout_user(request)
    return redirect('home')


@api_view(['POST', 'GET'])
@permission_classes([AllowAny])
def register(request):
    if request.method == "POST":
        username = request.data.get('username')
        password = request.data.get('password')
        first_name = request.data.get('firstname')
        last_name = request.data.get('lastname')
        email = request.data.get('email')
        confirm_password = request.data.get('confirm_password')

        if password == confirm_password:
            if UserModel.objects.filter(username=username).exists():
                messages.error(request, 'Username already exists!')
                return redirect('login')
            else:
                if UserModel.objects.filter(email=email).exists():
                    messages.error(request, 'Email already exists!')
                    return redirect('login')
                else:
                    hashed_password = make_password(password)
                    user = UserModel.objects.create(
                        username=username,
                        email=email,
                        first_name=first_name,
                        last_name=last_name,
                        password=hashed_password
                    )
                    auth_login(request, user, backend='django.contrib.auth.backends.ModelBackend')

                    # JWT
                    refresh = RefreshToken.for_user(user)
                    serialized_user = UserSerializer(user).data

                    context = {
                        "message": "Registration and Login Successful",
                        'user': serialized_user,
                        'access_token': str(refresh.access_token),
                        'refresh_token': str(refresh)
                    }
                    messages.success(request, f'{username} registered.')
                    return render(request, 'accounts/dashboard.html', context)
        else:
            messages.error(request, 'Password does not match.')
            return redirect('register')
    else:
        return render(request, 'accounts/register.html')
    
@api_view(['POST', 'GET'])
@permission_classes([AllowAny])
def login(request):
    try: 
        if request.method == 'POST':
            username = request.data.get('username')
            password = request.data.get('password')

            user = UserModel.objects.get(username=username)
            if not check_password(password, user.password):
                messages.error(request, "Password is incorrect.")
                return redirect('login')
            else:
                auth_login(request, user, backend='django.contrib.auth.backends.ModelBackend')
                # JWT
                refresh = RefreshToken.for_user(user)
                serialized_user = UserSerializer(user).data
                context = {
                    'message': 'Login successful',
                    'user': serialized_user,
                    'access_token': str(refresh.access_token),
                    'refresh_token': str(refresh),
                }
                messages.success(request, "Logged in successfully.")
                return render(request, 'accounts/dashboard.html', context)
        else:
            return render(request, 'accounts/login.html')
    except UserModel.DoesNotExist:
            messages.error(request, "User not found")
            return redirect('register')
            



