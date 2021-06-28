from django.urls import path,include

from .views import AllWalletList,WalletList,WalletDetail


urlpatterns = [
    path('all_wallets/' ,  AllWalletList.as_view()  ,  name='all_wallets'),
    path('wallets/' ,  WalletList.as_view()  ,  name='wallets'),
    path('wallets/<id>/' ,  WalletDetail.as_view()  ,  name='wallet_detail'),
]
