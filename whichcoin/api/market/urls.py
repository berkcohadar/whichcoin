from django.urls import path,include

from .views import MarketAdd,MarketList,MarketUpdate,CurrencyAdd, CurrencyList, CurrencyUpdate, CurrencyMarketAdd, CurrencyMarketList, CurrencyMarketUpdate
# ,addCollection,deleteCollection
# ,CollectionProductList

urlpatterns = [
    path('markets/' ,  MarketList.as_view()  ,  name='markets'),
    path('markets/add/',MarketAdd.as_view()  ,  name='addmarket'),
    path('markets/update/<id>/',MarketUpdate.as_view()  ,  name='updatemarket'),
    
    path('currencies/' ,  CurrencyList.as_view()  ,  name='currencies'),
    path('currencies/add/',CurrencyAdd.as_view()  ,  name='addcurrency'),
    path('currencies/update/<id>/',CurrencyUpdate.as_view()  ,  name='updatecurrency'),
    
    path('currency-markets/' ,  CurrencyMarketList.as_view()  ,  name='marketcurrencies'),
    path('currencies/add/', CurrencyMarketAdd.as_view()  ,  name='addmarketcurrency'),
    path('currencies/update/<id>/',CurrencyMarketUpdate.as_view()  ,  name='updatemarketcurrency'),
]


# ip:8000/api/markets/update/2