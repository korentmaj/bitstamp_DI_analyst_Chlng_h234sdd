CREATE TEMPORARY TABLE Temp_Ranked_Volumes AS
SELECT
    unique_id,
    daily_trading_volume,
    @rank := IF(@prev = unique_id, @rank + 1, 1) AS rank,
    @prev := unique_id
FROM
    task2_trading_volume, (SELECT @rank := 0, @prev := NULL) AS vars
ORDER BY
    unique_id, daily_trading_volume;

CREATE TEMPORARY TABLE Temp_Medians AS
SELECT 
    unique_id,
    AVG(daily_trading_volume) AS median_volume
FROM
    Temp_Ranked_Volumes
WHERE
    rank IN (FLOOR((SELECT COUNT(*) FROM task2_trading_volume WHERE unique_id = Temp_Ranked_Volumes.unique_id) / 2), 
             FLOOR((SELECT COUNT(*) FROM task2_trading_volume WHERE unique_id = Temp_Ranked_Volumes.unique_id) / 2) + 1)
GROUP BY
    unique_id;


CREATE TABLE Trading_Volume_Summary (
    unique_id INT PRIMARY KEY,
    total_volume BIGINT,
    average_volume DECIMAL(20, 2),
    median_volume DECIMAL(20, 2),
    is_volume_above_average BOOLEAN
);

INSERT INTO Trading_Volume_Summary (unique_id, total_volume, average_volume, median_volume, is_volume_above_average)
WITH VolumeStats AS (
    SELECT 
        unique_id,
        SUM(daily_trading_volume) AS total_volume,
        AVG(daily_trading_volume) AS average_volume
    FROM 
        task2_trading_volume
    GROUP BY 
        unique_id
),
ExchangeAvg AS (
    SELECT 
        AVG(total_volume) AS exchange_avg_volume
    FROM 
        VolumeStats
)
SELECT 
    V.unique_id,
    V.total_volume,
    V.average_volume,
    M.median_volume,
    CASE 
        WHEN V.total_volume > E.exchange_avg_volume THEN TRUE
        ELSE FALSE
    END AS is_volume_above_average
FROM 
    VolumeStats V
JOIN 
    Temp_Medians M ON V.unique_id = M.unique_id
JOIN 
    ExchangeAvg E;
