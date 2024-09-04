
CREATE TABLE Client_Profile (
    unique_id INT PRIMARY KEY,
    current_country VARCHAR(50),
    current_entity VARCHAR(50),
    date_of_last_change DATE
);


INSERT INTO Client_Profile (unique_id, current_country, current_entity, date_of_last_change)
SELECT 
    U.unique_id,
    U.country AS current_country,
    E.entity AS current_entity,
    U.date_changed AS date_of_last_change
FROM 
    task2_userprofile U
LEFT JOIN 
    task2_entities_mapping E
ON 
    U.country = E.country
WHERE 
    U.date_changed IS NULL 
    OR U.date_changed = (
        SELECT MAX(date_changed)
        FROM task2_userprofile
        WHERE unique_id = U.unique_id
    );
