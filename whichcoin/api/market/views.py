from rest_framework.generics import ListAPIView,CreateAPIView, RetrieveDestroyAPIView,RetrieveUpdateAPIView
from rest_framework.permissions import AllowAny
from rest_framework.authentication import SessionAuthentication,TokenAuthentication
from rest_framework.permissions import AllowAny,IsAdminUser

from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import filters

from .serializers import ListMarketsAPIView, ListCurrencyAPIView, ListCurrencyMarketAPIView
from Market.models import Market , Currency , CurrencyMarket

# Market API Classes
class MarketAdd(CreateAPIView):
    queryset = Market.objects.all()
    permission_classes = [IsAdminUser]
    authentication_classes = [SessionAuthentication,TokenAuthentication]
    serializer_class = ListMarketsAPIView

class MarketList(ListAPIView):
    queryset = Market.objects.all()
    serializer_class = ListMarketsAPIView
    permission_classes = [AllowAny]

    filter_backends = [DjangoFilterBackend,filters.OrderingFilter]
    filterset_fields = ['id','name','status']
    ordering_fields = ['id']

class MarketUpdate(RetrieveUpdateAPIView):
    queryset = Market.objects.all()
    serializer_class = ListMarketsAPIView
    permission_classes = [IsAdminUser]
    authentication_classes = [SessionAuthentication, TokenAuthentication]
    lookup_field = 'id'

# Currency API Classes
class CurrencyAdd(CreateAPIView):
    queryset = Currency.objects.all()
    permission_classes = [IsAdminUser]
    authentication_classes = [SessionAuthentication,TokenAuthentication]
    serializer_class = ListCurrencyAPIView

class CurrencyList(ListAPIView):
    queryset = Currency.objects.all()
    serializer_class = ListCurrencyAPIView
    permission_classes = [AllowAny]

    filter_backends = [DjangoFilterBackend,filters.OrderingFilter]
    filterset_fields = ['id','name','status']
    ordering_fields = ['id']

class CurrencyUpdate(RetrieveUpdateAPIView):
    queryset = Currency.objects.all()
    serializer_class = ListCurrencyAPIView
    permission_classes = [IsAdminUser]
    authentication_classes = [SessionAuthentication, TokenAuthentication]
    lookup_field = 'id'

# CurrencyMarket API Classes
class CurrencyMarketAdd(CreateAPIView):
    queryset = CurrencyMarket.objects.all()
    permission_classes = [IsAdminUser]
    authentication_classes = [SessionAuthentication,TokenAuthentication]
    serializer_class = ListCurrencyMarketAPIView

class CurrencyMarketList(ListAPIView):
    queryset = CurrencyMarket.objects.all()
    serializer_class = ListCurrencyMarketAPIView
    permission_classes = [AllowAny]

    filter_backends = [DjangoFilterBackend,filters.OrderingFilter]
    filterset_fields = ['id','market_id','currency_id','currency_type']
    ordering_fields = ['id']

class CurrencyMarketUpdate(RetrieveUpdateAPIView):
    queryset = CurrencyMarket.objects.all()
    serializer_class = ListCurrencyMarketAPIView
    permission_classes = [IsAdminUser]
    authentication_classes = [SessionAuthentication, TokenAuthentication]
    lookup_field = 'id'
