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
    path('wallets/' , include('api.wallet.urls')),
]
# www.whichcoin.com/admin
# www.whichcoin.com/api
# www.whichcoin.com/api/markets
# www.whichcoin.com/api/wallets
# www.whichcoin.com/api/wallets/all_wallets
# www.whichcoin.com/api/wallets/wallets
# www.whichcoin.com/api/wallets/wallets/<id>
# www.whichcoin.com/api/wallets/add-to-wallet