from rest_framework import serializers
from Market.models import Market , Currency, CurrencyMarket

class ListMarketsAPIView(serializers.ModelSerializer):
    class Meta:
        ordering = ['-id']
        model = Market
        fields = [
            'id',
            'name',
            'status',
            'total_volume',
            'total_trades',
        ]

class ListCurrencyAPIView(serializers.ModelSerializer):
    class Meta:
        ordering = ['-id']
        model = Currency
        fields = [
            'id',
            'name',
            'status',
            'logo',
            'first_trade',
            'market_cap',
        ]

class ListCurrencyMarketAPIView(serializers.ModelSerializer):
    market_id = serializers.SerializerMethodField()
    currency_id = serializers.SerializerMethodField()
    class Meta:
        ordering = ['-id']
        model = CurrencyMarket
        fields = [
            'id',
            'market_id',
            'currency_id',
            'currency_type',
            'price',
            'price_date',
            'volume_24h',
            'PNL_24h',
            'current_ATH',
            'ATH_date',
        ]
    def get_market_id(self,obj):
        return obj.market_id.__str__()
    def get_currency_id(self,obj):
        return obj.currency_id.__str__()