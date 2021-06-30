from django.db import models
# Create your models here.

class Market(models.Model):
    STATUS_MEANS = [
        ('0','Unknown'),
        ('1','Active'),
        ('2','Deactive'),
    ]
    name = models.CharField(max_length=31)
    status = models.CharField(max_length=1,choices=STATUS_MEANS,default="0")
    total_volume = models.FloatField()
    total_trades = models.FloatField()
    
    def isActive(self):
        if (self.status == "1"):
            return True
        else:
            return False

    def __str__(self):
        return f"{self.name}"

class Currency(models.Model): #algo btc xrp xlm
    STATUS_MEANS = [
        ('0','Unknown'),
        ('1','Active'),
        ('2','Deactive'),
    ]
    name = models.CharField(max_length=31)
    status = models.CharField(max_length=1,choices=STATUS_MEANS,default="0")
    logo = models.CharField(max_length=255)
    first_trade = models.DateTimeField()
    market_cap = models.FloatField()

    def isActive(self):
        if (self.status == "1"):
            return True
        else:
            return False

    def __str__(self):
        return f"{self.name}"

class CurrencyMarket(models.Model):
    CURRENCY_TYPES = [
        ('0','USD'),
        ('1','BTC'),
        ('2','ETH'),
    ]
    market_id = models.ForeignKey(Market,on_delete=models.CASCADE,null=False,blank=False)    
    currency_id = models.ForeignKey(Currency,on_delete=models.CASCADE,null=False,blank=False)

    currency_type = models.CharField(max_length=1,choices=CURRENCY_TYPES,default="0")
    price = models.FloatField()
    price_date = models.DateTimeField()
    volume_24h = models.FloatField()
    PNL_24h = models.FloatField()
    current_ATH = models.FloatField()
    ATH_date = models.DateTimeField()

    def __str__(self):
        return f"{self.currency_id.__str__()}/{self.CURRENCY_TYPES[int(self.currency_type)][1]} on {self.market_id.__str__()}"
