from django.contrib import admin
from django.urls import include,path
from . import views

# from rest_framework import routers
# router = routers.DefaultRouter()
# router.register(r'users', views.UserViewSet)
# router.register(r'groups', views.GroupViewSet)
# path('', include(router.urls)),

urlpatterns = [
    path('markets/' , include('api.market.urls')),
]