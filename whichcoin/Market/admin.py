from django.contrib import admin
from .models import Market, Currency, CurrencyMarket

admin.site.register(Market)
admin.site.register(Currency)
admin.site.register(CurrencyMarket)
