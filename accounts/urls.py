from django.urls import path, include
from . import views

urlpatterns = [
    path('logout/', views.logout, name='logout'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('login/', views.login, name='login'),
    path('register/', views.register, name='register'),
    path('oauth/', include('social_django.urls', namespace='social')),
]
