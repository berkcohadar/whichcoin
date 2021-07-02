import urllib.request
import json

BASE_URL = "https://api.nomics.com/v1/"
API_KEY = "b370f56d3f77c121f9c6178856cbb9f497f4d47f"

def get_currencies(currencies):
    currencies = "BTC,ETH,XRP,XLM,ADA,DOT,LTC,CHZ,HOT,BTT,WIN,TRX,THETA,ALGO,STX,BNB,FIL,MATIC,VET,ENJ,IOTA,ONT,ONE,XTZ,EOS"
    currency_type = "USD" # can be BTC or ETH or any FIAT currencies.
    url = BASE_URL + "currencies/ticker?key=" + API_KEY + "&ids=" + currencies + "&convert=" + currency_type
    # example -> https://api.nomics.com/v1/currencies/ticker?key=b370f56d3f77c121f9c6178856cbb9f497f4d47f&ids=CHZ&convert=TRY
    response = urllib.request.urlopen(url).read()
    result = response.decode("utf-8")
    currencies = json.loads(result)
    # CONVERT 'response' to python dictionary

    return currencies
    # for currency in currencies:
    #     currency_items = currency.items()
    #     for item in currency_items:
    #         print(item)
    
    # CURRENCY FIELDS = name - status - logo_url - first_trade - market_cap
    # CURR_MARKET FIELDS = price - price_timestamp - 1d[volume] - 1d[price_change_pct] - high - high_timestamp

def get_market_data():
    data = {}
    data["name"] = "Binance"
    data["total_volume"] = 5386928326
    data["total_trades"] = 28325699821
    data["status"] = '1'
    return data
