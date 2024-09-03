import pandas as pd

bitstamp_data = pd.read_csv('Task3/task3_bitstamp_data.csv')

bitstamp_data_info = bitstamp_data.info(), bitstamp_data.head()
bitstamp_data_info


bitstamp_data['date'] = pd.to_datetime(bitstamp_data['date'], format='%d/%m/%Y')


bitstamp_data['market_share'] = bitstamp_data['trading volume'] / bitstamp_data['total_market_volume']


bitstamp_data = bitstamp_data.sort_values('date')

# 7-day moving averages
bitstamp_data['7_day_avg_trading_volume'] = bitstamp_data.groupby('client_type')['trading volume'].transform(lambda x: x.rolling(7, 1).mean())
bitstamp_data['7_day_avg_new_clients'] = bitstamp_data.groupby('client_type')['new_registered_clients'].transform(lambda x: x.rolling(7, 1).mean())
bitstamp_data['7_day_avg_trading_revenue'] = bitstamp_data.groupby('client_type')['trading_revenue'].transform(lambda x: x.rolling(7, 1).mean())
bitstamp_data['7_day_avg_active_clients'] = bitstamp_data.groupby('client_type')['daily_active_clients'].transform(lambda x: x.rolling(7, 1).mean())


latest_date = bitstamp_data['date'].max()
report_data = bitstamp_data[bitstamp_data['date'] == latest_date]


report_data
