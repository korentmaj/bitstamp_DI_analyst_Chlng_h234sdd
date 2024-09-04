import pandas as pd

file_path = 'path'
data = pd.read_csv(file_path)



print("Initial Data Overview:\n", data.info())


print("\nMissing values per column:\n", data.isnull().sum())


cleaned_data = data.dropna()


cleaned_data = cleaned_data.drop_duplicates()


cleaned_data['volume'] = cleaned_data['volume'].astype(float)  # Convert volume to float if needed


total_market_volume = cleaned_data['volume'].sum()
bitstamp_volume = cleaned_data[cleaned_data['exchange'] == 'Bitstamp']['volume'].sum()
market_share = (bitstamp_volume / total_market_volume) * 100


bitstamp_pairs = cleaned_data[cleaned_data['exchange'] == 'Bitstamp']['pair'].unique()


addressable_market_volume = cleaned_data[cleaned_data['pair'].isin(bitstamp_pairs)]['volume'].sum()
addressable_market_share = (bitstamp_volume / addressable_market_volume) * 100


bitstamp_assets = set([pair.split('/')[0] for pair in bitstamp_pairs])


market_coverage_volume = cleaned_data[cleaned_data['pair'].apply(lambda x: x.split('/')[0] in bitstamp_assets)]['volume'].sum()
market_coverage = (market_coverage_volume / total_market_volume) * 100



competitors = cleaned_data.groupby('exchange').sum().reset_index()
competitors = competitors[competitors['exchange'] != 'Bitstamp']  # Exclude Bitstamp for comparison


competitors_sorted = competitors.sort_values(by='volume', ascending=False)
top_competitors = competitors_sorted.head(5)  # Top 5 competitors


print("\nCleaned Data Sample:\n", cleaned_data.head())
print("\nMarket Share of Bitstamp: {:.2f}%".format(market_share))
print("Addressable Market Share: {:.2f}%".format(addressable_market_share))
print("Market Coverage: {:.2f}%".format(market_coverage))
print("\nTop 5 Competitors by Volume:\n", top_competitors)


cleaned_data.to_csv('path/cleaned_market_data.csv', index=False)

