from django.db import models
from django.contrib.auth.models import User
from Market.models import CurrencyMarket
import re
import hashlib
import binascii
import base64

# Create your models here.
# import random
# hash = random.getrandbits(256)


class Wallet(models.Model):
    name = models.CharField(max_length=31)
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, null=False, blank=False)
    public_key = models.CharField(max_length=255, editable=False)

    def generatePublicKey(self):
        # SHA256 ile public key olusturulacak.
        word = self.name.strip()

        # if (re.search(r'^ssh-(?:rsa|dss) ', word)):
        #     word = word.split(None, 2)[1]

        # try:
        #     word = bytes(word, 'ascii')
        # except TypeError:
        #     word = bytes(word)

        # digest = hashlib.sha256(binascii.a2b_base64(word)).digest()
        # encoded = base64.b64encode(digest).rstrip(b'=')  # ssh-keygen strips this

        # return encoded
        return word

    def save(self, *args, **kwargs):
        if self.public_key == "":
            self.public_key = self.generatePublicKey()

        return super(Wallet, self).save(*args, **kwargs)

    def __str__(self):
        return f"{self.user.__str__()}'s {self.name} wallet"


class WalletItem(models.Model):
    wallet_id = models.ForeignKey(
        Wallet, on_delete=models.CASCADE, null=False, blank=False)
    currencyMarket_id = models.ForeignKey(
        CurrencyMarket, on_delete=models.CASCADE, null=False, blank=False)
    data_created = models.DateTimeField(
        verbose_name='wallet created', auto_now_add=True)
    first_price = models.FloatField(null=True, blank=True, editable=False)
    current_PNL = models.FloatField(null=True, blank=True, editable=False)

    def set_first_price(self):
        currency = CurrencyMarket.objects.filter(id=self.currencyMarket_id.id)[0]
        return currency.price
    
    def calculate_PNL(self):
        currency = CurrencyMarket.objects.filter(id=self.currencyMarket_id.id)[0]
        return ((currency.price/self.first_price) - 1)*100

    def save(self, *args, **kwargs):
        if self.first_price is None: # If first_price is None, then it means we are creating the WalletItem (first addition).
            self.first_price = self.set_first_price() # We set the first_price as currency's current price. 
        self.current_PNL = self.calculate_PNL() # After setting the first price, we can calculate the PNL any time.
                                                # Unlike first_price, PNL has to be calculated everytime we GET the WalletItems
        return super(WalletItem, self).save(*args, **kwargs)

    def __str__(self):
        return f"{self.currencyMarket_id.__str__()} in {self.wallet_id.__str__()}"
