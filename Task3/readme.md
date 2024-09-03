# Bitstamp Daily Performance Report Generator

This project generates a daily performance report for Bitstamp based on a selected date. The report includes key metrics such as trading volume, new registered clients, active clients, market share, Bitcoin price, and more. The generated reports are saved in the `Task3/Reports/` directory with filenames that include the report date.

## Features

- **Custom Date Selection**: Choose any date to generate the report for that specific day.
- **Comprehensive Metrics**: Includes trading volume, client activity, market share, Bitcoin price, and more.
- **7-Day Trend Analysis**: Displays moving averages for key metrics to help analyze trends.
- **Market Indicators**: Provides Bitcoin price and dominance on the selected date.
- **Report Saving**: Reports are saved automatically with a filename that includes the date.

## Usage

### 1. Set Up Your Environment

Ensure you have the following libraries installed:

```bash
pip install pandas matplotlib
