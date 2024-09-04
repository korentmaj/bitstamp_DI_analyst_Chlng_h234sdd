# **🛑🛑🛑 VIDEO DOCUMENTATION WILL BE AVAILABLE IN 1 TO 2 HOURS. I AM SUPER SORRY FOR THE DELAY! 🛑🛑🛑**

[![Link to Video](https://img.shields.io/badge/Link%20to%20Video-Click%20Here-blue)](https://link-to-video)

---

# Bitstamp Data Intelligence Analyst Challenge

This repository contains my solution to the Bitstamp Data Intelligence Analyst Challenge. The project consists of three tasks that test various aspects of data manipulation, analysis, and reporting.

## Repository Structure

The project is divided into the following sections:

- **Task 1: Market Data Cleaning and Metric Calculation**
- **Task 2: SQL Queries for Data Analysis**
- **Task 3: Daily Performance Report Generation**

Each task is located in its respective folder: `Task1/`, `Task2/`, and `Task3/`.

---

## Task 1: Market Data Cleaning and Metric Calculation

**Objective:**

The goal of Task 1 was to clean a provided dataset of cryptocurrency market data and compute key performance metrics for Bitstamp.

### Key Steps:

1. **Data Cleaning**: The dataset was cleaned by renaming columns, converting data types, and handling missing or invalid data.
   - Files: `task1_market_data.csv`
   
2. **Metric Calculation**:
   - **Market Share**: Percentage of Bitstamp's volume out of the total market volume.
   - **Addressable Market Share**: Percentage of Bitstamp's volume out of the market volume for trading pairs available on Bitstamp.
   - **Market Coverage**: Percentage of volume generated on base assets supported by Bitstamp.

3. **Competitor Analysis**: Competitors like Binance, Coinbase, and Kraken were identified, and their volume structure compared to Bitstamp's.

### Results:
- **Market Share**: Bitstamp's volume accounts for approximately **0.0061%** of the total market volume.
- **Addressable Market Share**: **0.0061%**, although this requires further analysis as it should generally be higher than the total market share.
- **Market Coverage**: Bitstamp supports **99.42%** of the total market volume in terms of base assets.

---

## Task 2: SQL Queries for Data Analysis

**Objective:**

In Task 2, the goal was to write efficient SQL queries for analyzing client data and trading volumes, focusing on key metrics like total volume, average volume, and identifying clients on the wrong entity.

### Key SQL Queries:

1. **User Volume Summary**:
   - Total, average, and median trading volume per user.
   - Determine if the user's volume is above the average on an exchange-wide level.

2. **Volume for Specific Clients**:
   - Calculated the trading volume for clients from the Netherlands on a specific date.

3. **Clients on Wrong Entities**:
   - Identified clients who were onboarded to the wrong entity.

4. **Volume by Entity**:
   - Aggregated the trading volume per entity for December 2022.

---

## Task 3: Daily Performance Report Generation

**Objective:**

The goal of Task 3 was to generate a daily report for Bitstamp's management, showing the key performance metrics for a selected date.

### Key Features:

1. **Daily Report Generation**:
   - Generates a report for a specific date, showing metrics like trading volume, new clients, active clients, trading revenue, and more.

2. **7-Day Trends**:
   - The report includes a 7-day moving average for key metrics such as trading volume and new registered clients.

3. **Market Indicators**:
   - Includes Bitcoin price, dominance, and Bitstamp's market share.

### How to Use:

- **Run the Report**: Use the `generate_bitstamp_report('DD/MM/YYYY')` function to generate a report for any specific date.
- **Custom File Names**: The generated report is automatically saved with the date in the file name, e.g., `Report07122022.png`.

---

## How to Run the Project

1. Clone this repository:

