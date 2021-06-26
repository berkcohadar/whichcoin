from django.db import models
from django.contrib.auth.models import User
from Market.models import CurrencyMarket
# Create your models here.
# import random
# hash = random.getrandbits(256)

class Wallet(models.Model):
    name = models.CharField(max_length=31)
    user = models.ForeignKey(User,on_delete=models.CASCADE,null=False,blank=False)
    public_key = models.CharField(max_length=255)
    
    def generatePublicKey(self):
        # SHA256 ile public key olusturulacak.
        return "whichCoin-PublicKeyGenerator"
    
    def save(self,*args,**kwargs):
        if self.public_key == "":
            self.public_key = self.generatePublicKey()

        return super(Wallet,self).save(*args,**kwargs)
    
    def __str__(self):
        return f"{self.user.__str__()}'s {self.name} wallet"


class WalletItem(models.Model):
    wallet_id = models.ForeignKey(Wallet,on_delete=models.CASCADE,null=False,blank=False)
    currencyMarket_id = models.ForeignKey(CurrencyMarket,on_delete=models.CASCADE,null=False,blank=False)
    data_created = models.DateTimeField(verbose_name='wallet created',auto_now_add=True)
    first_price = models.FloatField()
    current_PNL = models.FloatField()

    def __str__(self):
        return f"{self.currencyMarket_id.__str__()} in {self.wallet_id.__str__()}"
