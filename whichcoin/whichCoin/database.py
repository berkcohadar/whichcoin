import psycopg2
from nomics_api import get_currencies, get_market_data
from settings import DATABASES
from datetime import datetime

class Database():
    def __init__(self, db_name, db_user, db_pw, db_host, db_port):
        self.db_name = db_name
        self.db_user = db_user
        self.db_pw = db_pw
        self.db_host = db_host
        self.db_port = db_port
        self.conn = 0
        self.cursor = 0

    def connect_my_database(self):
        try:
            self.conn = psycopg2.connect(
                database=self.db_name,
                user=self.db_user,
                password=self.db_pw,
                host=self.db_host,
                port=self.db_port
            )
            # create a psycopg2 cursor that can execute queries
            self.cursor = self.conn.cursor()
            # create a new table with a single column called "name"
        except Exception as e:
            print("Cannot connect to database. Following error occured.")
            print(e)

    def insert_market(self, data):
        query = """INSERT INTO public."Market_market"("name", "total_volume", "total_trades", "status")
                   VALUES(%s,%s,%s,%s) RETURNING id;"""

        name = data["name"]
        total_volume = data["total_volume"]
        total_trades = data["total_trades"]
        status = data["status"]

        # connection = self.conn
        # cursor = connection.cursor()

        try:
            self.cursor.execute(query, (name,
                                   total_volume,
                                   total_trades,
                                   status))
            market_id = self.cursor.fetchone()[0]
            self.conn.commit()
            # self.cursor.close()

        except (Exception, psycopg2.DatabaseError) as error:
            print(error)
            return error

        print("Market added with id:", market_id)
        return market_id

    def insert_currency(self, data):
        query = """INSERT INTO public."Market_currency"("status", "name", "first_trade", "market_cap", "logo")
                   VALUES(%s,%s,%s,%s,%s) RETURNING id;"""
        if data["status"] == "active":
            status = '1'
        else:
            status = '0'
        name = data["name"]
        first_trade = normalize_date_time(data["first_trade"])
        market_cap = data["market_cap"]
        logo = data["logo_url"]

        # connection = self.conn
        # cursor = connection.cursor()

        try:
            self.cursor.execute(query, (status,
                                   name,
                                   first_trade,
                                   market_cap,
                                   logo))
            currency_id = self.cursor.fetchone()[0]
            self.conn.commit()
            # self.cursor.close()

        except (Exception, psycopg2.DatabaseError) as error:
            print(error)
            return error

        print("Currency added with id:", currency_id)
        return currency_id

    def insert_currencymarket(self, data):
        query = """INSERT INTO public."Market_currencymarket"("currency_type", "price", "price_date", "volume_24h", "PNL_24h", "current_ATH", "ATH_date", "currency_id_id", "market_id_id")
                   VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s) RETURNING id;"""
        currency_type = data["currency_type"]
        price = data["price"]
        price_date = data["price_date"]
        volume_24h = data["volume_24h"]
        PNL_24h = data["PNL_24h"]
        current_ATH = data["current_ATH"]
        ATH_date = data["ATH_date"]
        currency_id_id = data["currency_id_id"]
        market_id_id = data["market_id_id"]

        # connection = self.conn
        # cursor = connection.cursor()

        try:
            self.cursor.execute(query, (currency_type,
                                   price,
                                   price_date,
                                   volume_24h,
                                   PNL_24h,
                                   current_ATH,
                                   ATH_date,
                                   currency_id_id,
                                   market_id_id))
            currencyMarket_id = self.cursor.fetchone()[0]
            self.conn.commit()
            # self.cursor.close()

        except (Exception, psycopg2.DatabaseError) as error:
            print(error)
            return error

        print("CurrencyMarket added with id:", currencyMarket_id)
        return currencyMarket_id

    def update(self, table_name, id):
        """ 
        UPDATE table_name
            SET column_1 = %s
            WHERE column_2 = %s
        """

    def get(self, data):
        """
        SELECT
            column_1,
            column_2
        FROM
            table_name
        WHERE
            column_1 = 'data';
        """
        query = "SELECT * FROM Market_currency WHERE name= %s"

        name = data['name']

        connection = self.conn
        cursor = connection.cursor()

        try:
            cursor.execute(query, (name))
            query_response = cursor.fetchall()
            cursor.close()
        except (Exception, psycopg2.DatabaseError) as error:
            return error

        return query_response

    def disconnect_my_database(self):
        self.cursor.close()
        self.conn.close()

def normalize_date_time(date):
    return datetime.strptime(date, '%Y-%m-%dT%H:%M:%SZ')
    
def normalize_market_currency_data(data):
    currency = {}
    currency["currency_type"] = '0'
    currency["price"] = data["price"]
    currency["price_date"] = normalize_date_time(data["price_date"])
    currency["volume_24h"] = data["1d"]["volume"]
    currency["PNL_24h"] = data["1d"]["price_change_pct"]
    currency["current_ATH"] = data["high"]
    currency["ATH_date"] = normalize_date_time(data["high_timestamp"])
    return currency

if __name__ == "__main__":
    db_name = DATABASES["default"]["NAME"]
    db_user = DATABASES["default"]["USER"]
    db_pw   = DATABASES["default"]["PASSWORD"]
    db_host = DATABASES["default"]["HOST"]
    db_port = DATABASES["default"]["PORT"]

    my_db = Database(db_name, db_user, db_pw, db_host, db_port)
    my_db.connect_my_database()

# from nomics_api import get_currencies, get_market_data

    market = get_market_data() # market info
    market_id = my_db.insert_market(market) # get Primary Key

    currencies = get_currencies("") # currencies info (general + price)

    for data in currencies:
        try:
            currency_id = my_db.insert_currency(data) # general info # Get Primary Key

            # Construct currency_market data
            currency = normalize_market_currency_data(data) # convert data format
            currency["currency_id_id"] = currency_id # Add Currency Foreign Key to dictionary
            currency["market_id_id"] = market_id    # Add Market Foreign Key to dictionary

            my_db.insert_currencymarket(currency) # price info
        except KeyError:
            pass
    my_db.cursor.close()

    # EXAMPLE TEST DATABASE CONSTRUCTION 3 STEPS
    # CREATE CURRENCIES (Market_currency) {id, status, name, first_trade, market_cap, logo}
    # CREATE MARKETS (Market_market) {id, name, total_volume, total_trades, status}
    # AFTER THESE, CREATE CURRENCY MARKETS (Market_currencymarket) {id, currency_type, price, price_date, volume_24h, PNL_24h, current_ATH, ATH_date, currency_id_id, market_id_id}
