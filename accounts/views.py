from django.shortcuts import render, redirect
from django.db import IntegrityError
from social_django.models import UserSocialAuth
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
from social_django.views import complete
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import TemplateView

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
    try: 
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
                    if UserModel.objects.filter(email=email).exists() or UserSocialAuth.objects.get(user=request.user.id):
                        print(UserSocialAuth.objects.get(user=request.user.id), UserModel.objects.filter(email=email).exists())
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
    except IntegrityError:
        return redirect('register')
    
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
    except IntegrityError:
        return redirect('register')
            

class SocialLogin(LoginRequiredMixin, TemplateView):
    def save(self, request, *args, **kwargs):
        user = request.user
        try: 
            github_login = user.social_auth.get(provider='github')
            facebook_login = user.social_auth.get(provider='facebook')
            linkedin_login = user.social_auth.get(provider='linkedin')
            gmail_login = user.social_auth.get(provider='google')
        except UserSocialAuth.DoesNotExist:
            return redirect('register')
        except IntegrityError: 
            return redirect('register')
        
        print(f"User: {user}")
        print(f"GitHub Login: {github_login}")
        print(f"Facebook Login: {facebook_login}")
        print(f"LinkedIn Login: {linkedin_login}")
        print(f"Gmail Login: {gmail_login}")
        
        return render(request, 'accounts/login.html', {
            'github_login': github_login,
            'linkedin_login': linkedin_login,
            'facebook_login': facebook_login,
            'gmail_login': gmail_login
        })
        

def social_login(request, backend):
    try:
        # Handle the social login process
        return complete(request, backend, template_name='accounts/dashboard.html')
    except IntegrityError:
        # Custom handling for IntegrityError
        messages.error(request, "This social account is already associated with another user.")
        return redirect('register')  # Redirect to your login page or handle it accordingly

