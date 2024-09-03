import pandas as pd

file_path = 'Task1/task1_market_data.csv'
market_data = pd.read_csv(file_path)

market_data.head(), market_data.info(), market_data.describe(include='all')


market_data.columns = ['Date', 'Exchange', 'Market_Type', 'Trading_Pair', 'Volume']


market_data['Date'] = pd.to_datetime(market_data['Date'], errors='coerce')
market_data['Volume'] = pd.to_numeric(market_data['Volume'], errors='coerce')


market_data_cleaned = market_data.dropna(subset=['Date', 'Exchange', 'Market_Type', 'Trading_Pair', 'Volume'])
market_data_cleaned = market_data_cleaned[market_data_cleaned['Volume'] >= 0]


market_data_cleaned.info(), market_data_cleaned.head()