-- Task 1
SELECT 
    space_id,
    space_name,
    COUNT(space_id) AS number_of_visits
FROM dataset
GROUP BY space_id, space_name;

SELECT
    space_id,
    space_name,
    SUM(total_time_occupied) AS total_time_occupied,
    COUNT(space_id) AS number_of_visits,
    SUM(total_time_occupied) / COUNT(space_id) AS avg_length_of_stay
FROM dataset
GROUP BY space_id, space_name;