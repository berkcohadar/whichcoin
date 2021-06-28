from rest_framework import serializers
from Wallet.models import Wallet, WalletItem
from Market.models import CurrencyMarket
from api.market.serializers import ListCurrencyMarketAPIView

class ListWalletAPIView(serializers.ModelSerializer):
    items = serializers.SerializerMethodField()
    class Meta:
        ordering = ['-id']
        model = Wallet
        fields = [
            'id',
            'name',
            'items',
        ]
    def get_items(self,obj):
        queryset = WalletItem.objects.filter(wallet_id=obj.id)
        itemSerializer = WalletItemSerializer(queryset,many=True).data ##########
        # print(itemSerializer)
        try:
            items = itemSerializer[0]
        except:
            items = itemSerializer
            
        return items

class WalletItemSerializer(serializers.ModelSerializer):
    # wallet_id
    # currencyMarket_id
    currency = serializers.SerializerMethodField()
    class Meta:
        model = WalletItem
        fields = [
            'currency',
            'first_price',
            'current_PNL',
            'data_created',
        ]
    def get_currency(self, obj):
        queryset = CurrencyMarket.objects.filter(id=obj.currencyMarket_id.id) ##########
        itemSerializer = ListCurrencyMarketAPIView(queryset,many=True).data
        # print(itemSerializer)
        try:
            items = itemSerializer[0]
        except:
            items = itemSerializer
        return items