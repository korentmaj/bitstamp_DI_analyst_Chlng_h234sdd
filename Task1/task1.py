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


total_market_volume = market_data_cleaned['Volume'].sum()


bitstamp_volume = market_data_cleaned[market_data_cleaned['Exchange'] == 'bitstamp']['Volume'].sum()


market_share = (bitstamp_volume / total_market_volume) * 100


bitstamp_trading_pairs = market_data_cleaned[market_data_cleaned['Exchange'] == 'bitstamp']['Trading_Pair'].unique()


addressable_market_volume = market_data_cleaned[market_data_cleaned['Trading_Pair'].isin(bitstamp_trading_pairs)]['Volume'].sum()


addressable_market_share = (bitstamp_volume / addressable_market_volume) * 100


bitstamp_base_assets = set([pair.split('/')[0] for pair in bitstamp_trading_pairs])


market_coverage_volume = market_data_cleaned[market_data_cleaned['Trading_Pair'].apply(lambda x: x.split('/')[0] in bitstamp_base_assets)]['Volume'].sum()


market_coverage = (market_coverage_volume / total_market_volume) * 100

market_share, addressable_market_share, market_coverage

# ---------------------------------------------------------------
exchange_volumes = market_data_cleaned.groupby('Exchange')['Volume'].sum().sort_values(ascending=False)

top_competitors = exchange_volumes.head(5)

competitors_data = market_data_cleaned[market_data_cleaned['Exchange'].isin(top_competitors.index)]

volume_distribution = competitors_data.pivot_table(index='Trading_Pair', columns='Exchange', values='Volume', aggfunc='sum', fill_value=0)

volume_distribution_normalized = volume_distribution.div(volume_distribution.sum(axis=0), axis=1) * 100

top_competitors, volume_distribution_normalized.head(10)


