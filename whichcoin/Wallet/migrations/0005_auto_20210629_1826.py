# Generated by Django 3.2.3 on 2021-06-29 15:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Wallet', '0004_alter_wallet_public_key'),
    ]

    operations = [
        migrations.AlterField(
            model_name='walletitem',
            name='current_PNL',
            field=models.FloatField(blank=True, editable=False, null=True),
        ),
        migrations.AlterField(
            model_name='walletitem',
            name='first_price',
            field=models.FloatField(blank=True, editable=False, null=True),
        ),
    ]