from rest_framework import serializers
from Wallet.models import Wallet, WalletItem
from Market.models import CurrencyMarket
from api.market.serializers import ListCurrencyMarketAPIView
from django.contrib.auth.models import User

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
        for cur in queryset:
            cur.save()
        walletItems = WalletItemSerializer(queryset,many=True).data ##########
        try:
            result = walletItems
        except:
            result = walletItems
            
        return result

class WalletItemSerializer(serializers.ModelSerializer):
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
        for cur in queryset:
            cur.save()
        currencies = ListCurrencyMarketAPIView(queryset,many=True).data
        try:
            result = currencies[0]
        except:
            result = currencies
        return result

class AddToWalletSerializer(serializers.ModelSerializer):

    class Meta:
        model = WalletItem
        fields = [
            "id",
            "wallet_id",
            "currencyMarket_id",
        ]

    def validate(self,attrs):
        # user,created = User.objects.get_or_create(email=attrs["user"])
        # attrs["user"] = user
        product = CurrencyMarket.objects.filter(id=attrs["currencyMarket_id"].id)
        if product:
            if 0:
                raise serializers.ValidationError("out of stock,",code="stock")
        return super().validate(attrs)
        
    # def create(self, validated_data):
    #     customer = validated_data["user"]
    #     product = validated_data["product"]
    #     cart_items = CartItem.objects.filter(customer=customer,product=product,status=0)        
    #     if cart_items:
    #         return self.update(cart_items[0],validated_data)
    #     return super().create(validated_data)

    # def update(self, instance, validated_data):
    #     instance.quantity = int(validated_data["quantity"])
    #     instance.save()
    #     return super().update(instance, validated_data)