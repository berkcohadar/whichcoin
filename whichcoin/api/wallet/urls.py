from django.urls import path,include

from .views import AllWalletList,WalletList,WalletDetail,AddToWallet,CreateWallet


urlpatterns = [
    path('all_wallets/' ,  AllWalletList.as_view()  ,  name='all_wallets'),
    path('wallets/' ,  WalletList.as_view()  ,  name='wallets'),
    path('wallets/<id>/' ,  WalletDetail.as_view()  ,  name='wallet_detail'),
    path('add-to-wallet/' ,  AddToWallet.as_view()  ,  name='add_to_wallet'),
    path('create-wallet/' ,  CreateWallet.as_view()  ,  name='create_wallet'),


]
