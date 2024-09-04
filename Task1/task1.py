import pandas as pd


file_path = 'Task1/task1_market_data.csv'  # Update the file path if necessary
market_data = pd.read_csv(file_path)

market_data.columns = ['date', 'exchange', 'market_type', 'trading_pair', 'volume']

market_data['volume'] = pd.to_numeric(market_data['volume'], errors='coerce')

market_data['trading_pair'] = market_data['trading_pair'].str.lower().str.replace('-', '/')

cleaned_market_data = market_data.dropna(subset=['volume'])

cleaned_market_data = cleaned_market_data[cleaned_market_data['market_type'] == 'spot']


bitstamp_data = cleaned_market_data[cleaned_market_data['exchange'] == 'bitstamp']

total_market_volume = cleaned_market_data['volume'].sum()


bitstamp_total_volume = bitstamp_data['volume'].sum()


market_share = (bitstamp_total_volume / total_market_volume) * 100


bitstamp_pairs = bitstamp_data['trading_pair'].unique()

addressable_market_data = cleaned_market_data[cleaned_market_data['trading_pair'].isin(bitstamp_pairs)]
addressable_market_volume = addressable_market_data['volume'].sum()

addressable_market_share = (bitstamp_total_volume / addressable_market_volume) * 100


bitstamp_base_assets = bitstamp_data['trading_pair'].str.split('/', expand=True)[0].unique()

market_base_assets = cleaned_market_data['trading_pair'].str.split('/', expand=True)[0].isin(bitstamp_base_assets)
market_coverage_volume = cleaned_market_data[market_base_assets]['volume'].sum()

market_coverage = (market_coverage_volume / total_market_volume) * 100


exchange_volume = cleaned_market_data.groupby('exchange')['volume'].sum().reset_index()
exchange_volume_sorted = exchange_volume.sort_values(by='volume', ascending=False)


print("Metrics:")
print(f"Market Share: {market_share:.2f}%")
print(f"Addressable Market Share: {addressable_market_share:.2f}%")
print(f"Market Coverage: {market_coverage:.2f}%")

print("\nTop 10 Exchanges by Volume:")
print(exchange_volume_sorted.head(10))

output_file_path = 'Task1/Filtered_files/task1_results.csv'
exchange_volume_sorted.to_csv(output_file_path, index=False)
print(f"\nResults saved to {output_file_path}")

filtered_data_file_path = 'Task1/Filtered_files/task1_filtered_data.csv'
cleaned_market_data.to_csv(filtered_data_file_path, index=False)
print(f"Filtered data saved to {filtered_data_file_path}")
