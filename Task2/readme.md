# Bitstamp Data Intelligence Analyst - SQL Task Report

## Introduction

This README provides an overview of the tasks completed for the Bitstamp Data Intelligence Analyst SQL assignment. The goal of the project was to clean, structure, and analyze data from multiple CSV files provided and answer several questions using SQL. We utilized a MySQL server to perform the tasks and created two new tables to aid in answering the questions efficiently. 

## Database Setup

To begin, a new MySQL database was created. The three CSV files (`task2_userprofile.csv`, `task2_trading_volume.csv`, and `task2_entities_mapping.csv`) were uploaded into the database as separate tables:
- `Task_2_userprofile`
- `Task_2_trading_volume`
- `Task_2_entities_mapping`

### Table Creation Issues

We were tasked with creating two additional summary tables to make answering the questions easier:
1. **Trading_Volume_Summary** – Summarizes total, average, and median trading volumes per user.
2. **Client_Profile** – Contains each client's current country, associated entity, and last date of country change.

During the creation of the **Trading_Volume_Summary** table, we encountered an issue where calculating the median (a non-trivial aggregate function) required additional steps. MySQL does not natively support a direct `MEDIAN()` function, so we used temporary table formats and the `PERCENTILE_CONT` function to compute it. This added complexity made it necessary to use temporary tables for the interim calculation before constructing the final summary table.

You can find the table creation queries in the following files:
- `setup_Trading_Volume_Summary.sql` – Creates the `Trading_Volume_Summary` table.
- `setup_Client_Profile.sql` – Creates the `Client_Profile` table.

## First Query

The first query we created (located in `1st_query.sql`) was designed to return essential statistics per user:
SELECT 
    unique_id,
    total_volume,
    average_volume,
    median_volume,
    is_volume_above_average
FROM 
    Trading_Volume_Summary;

### Explanation:
- **`unique_id`**: The unique identifier for each user.
- **`total_volume`**: The total trading volume for that user.
- **`average_volume`**: The average daily trading volume for that user.
- **`median_volume`**: The median daily trading volume for that user (to provide insights beyond the average).
- **`is_volume_above_average`**: A boolean (`true` or `false`) that indicates whether the user's total volume is above the exchange-wide average.

This query was designed to give a quick overview of each user’s trading behavior and how they compare to the overall market.

## Answering the Task Questions

The answers to the task-specific questions are structured in separate queries located in the **`questions`** folder. Below is an overview of the thought process for each question and how it was addressed:

### 1. What was the volume of NL clients on 2022-12-06?

In this query, we joined the `Task_2_userprofile` table with the `Task_2_trading_volume` table and filtered it by clients from the Netherlands (`NL`) on the date `2022-12-06`.

### 2. How many clients were on the wrong entity on 2022-12-27?

To answer this, we joined the `Task_2_userprofile` and `Task_2_entities_mapping` tables. We filtered the records to find clients whose country had changed by 2022-12-27 but who were still associated with the wrong entity. The complexity here was ensuring that we tracked the correct entity using the mapping table and flagged those incorrectly assigned.

### 3. Calculate volume per entity for December 2022.

For this question, we aggregated the trading volumes per entity for all users over the month of December 2022. We joined the `Task_2_trading_volume` with the `Task_2_entities_mapping` table to get the correct entity for each user and summed the trading volumes.

### Query Files

All queries mentioned above are located in the following files within the `questions` folder:
- `query_1_NL_clients_volume.sql`
- `query_2_wrong_entity_clients.sql`
- `query_3_volume_per_entity.sql`

## Results

The results of each query are available in the attached video, which walks through the execution and output of each SQL query. You can access the video using the button below:

[**Watch Results Video**](#) *(Link will be added here)*

## Conclusion

This report outlines the process followed to clean, structure, and analyze the provided data, addressing the key challenges of creating summary tables and computing non-trivial aggregates like the median. The SQL queries provided are optimized for larger datasets and the entire workflow is documented step-by-step.

If there are any further questions, please don't hesitate to reach out.