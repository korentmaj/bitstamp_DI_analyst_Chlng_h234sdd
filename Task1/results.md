
# Crypto Market Data Analysis

## Task Overview
The goal of this task was to clean and analyze a weekly sample of crypto market data to provide insights related to Bitstamp's market position. The data provided covered spot markets from various exchanges, with the objective to:

1. **Clean the data** for easy usability.
2. **Calculate key metrics** for reporting:
   - Market Share (% of Bitstamp volume out of total market volume)
   - Addressable Market Share (% of Bitstamp volume for pairs available on Bitstamp)
   - Market Coverage (% of volume generated on base assets that Bitstamp supports)
3. **Identify direct competitors** to Bitstamp based on the data and analyze its volume structure compared to those exchanges.

## Data Cleaning Process
Upon reviewing the data, the following steps were taken to clean and standardize it:

1. **Renaming Columns**: The columns were renamed to be more descriptive.
2. **Standardizing Trading Pairs**: The trading pairs were made consistent by converting them to lowercase and ensuring all pairs were in the same format (i.e., replacing any `-` with `/`).
3. **Removing Missing Values**: Rows with missing volume data were removed.
4. **Ensuring Spot Markets**: The dataset was filtered to ensure only spot markets were considered.

After cleaning, the dataset consisted of 11,613 valid rows, and was ready for analysis.

## Metrics Calculation
### 1. **Market Share**
Bitstamp's market share was calculated as the percentage of its volume out of the total market volume across all exchanges in the dataset.

- **Market Share**: **0.92%**

### 2. **Addressable Market Share**
Addressable market share was computed as Bitstamp's percentage of the total volume, but only considering trading pairs that are available for trading on Bitstamp.

- **Addressable Market Share**: **2.02%**

### 3. **Market Coverage**
Market coverage was defined as the percentage of the total market volume generated from base assets supported by Bitstamp (e.g., BTC, ETH).

- **Market Coverage**: **81.11%**

This means that Bitstamp supports the vast majority of base assets generating volume in the market, giving it a broad coverage even if its specific share of the trading volume is smaller.

## Competitor Analysis
By analyzing the volume structure across different exchanges, the largest competitors to Bitstamp were identified as follows:

| Exchange  | Volume (USD)      |
|-----------|-------------------|
| Binance   | $29.6 billion      |
| Coinbase  | $3.41 billion      |
| Kraken    | $1.23 billion      |
| KuCoin    | $954 million       |
| **Bitstamp** | **$328 million** |
| Gemini    | $72.9 million      |
| Bittrex   | $48.9 million      |

### Observations:
- **Binance** dominates the market with a massive lead in trading volume.
- Bitstamp ranks fifth in terms of volume, with a significantly smaller market share compared to Binance, Coinbase, and Kraken.
- Bitstamp has a competitive edge in market coverage, with its supported assets accounting for over 80% of the total market volume, despite its lower overall market share.

## Conclusion
The analysis provided insight into Bitstamp's position in the market, showing that while it competes in a highly competitive space dominated by larger players like Binance and Coinbase, it still holds a strong position in terms of market coverage. The exchange's ability to support a wide range of high-volume assets gives it an advantage in addressing a large portion of the market.

Further efforts could be directed at increasing its market share and addressable market share through targeted strategies aimed at improving its competitive position in pairs it already supports.

