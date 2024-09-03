WITH VolumeStats AS (
    SELECT 
        unique_id,
        SUM(daily_trading_volume) AS total_volume,
        AVG(daily_trading_volume) AS average_volume,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY daily_trading_volume) AS median_volume
    FROM 
        Task_2_trading_volume
    GROUP BY 
        unique_id
),
ExchangeAvg AS (
    SELECT 
        AVG(SUM(daily_trading_volume)) OVER () AS exchange_avg_volume
    FROM 
        Task_2_trading_volume
    GROUP BY 
        unique_id
)
SELECT 
    V.unique_id,
    V.total_volume,
    V.average_volume,
    V.median_volume,
    CASE 
        WHEN V.total_volume > E.exchange_avg_volume THEN 'True'
        ELSE 'False'
    END AS volume_above_average
FROM 
    VolumeStats V, 
    ExchangeAvg E;
