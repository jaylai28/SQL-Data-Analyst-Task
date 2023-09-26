-- 1. Conversion Rate by Section
SELECT
    s.space_id,
    s.space_name,
    COUNT(o.order_id) AS total_orders,
    COUNT(DISTINCT o.order_id) AS unique_orders,
    COUNT(s.space_id) AS total_visits,
    COUNT(o.order_id) / COUNT(s.space_id) AS conversion_rate
FROM sensor_data s
LEFT JOIN item_location il ON s.space_id = il.space_id
LEFT JOIN order_items oi ON il.item_id = oi.item_id
LEFT JOIN orders o ON oi.order_id = o.order_id
GROUP BY s.space_id, s.space_name
ORDER BY conversion_rate DESC;

-- 2. Popular Items by Section
SELECT
    s.space_id,
    s.space_name,
    ii.item_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM sensor_data s
LEFT JOIN item_location il ON s.space_id = il.space_id
LEFT JOIN order_items oi ON il.item_id = oi.item_id
LEFT JOIN item_info ii ON oi.item_id = ii.item_id
GROUP BY s.space_id, s.space_name, ii.item_name
ORDER BY total_quantity_sold DESC;

-- 3. Sales Trends Over Time
SELECT
    DATE_FORMAT(o.time, '%H:%i') AS hour_minute,
    SUM(o.value) AS total_sales
FROM orders o
GROUP BY hour_minute
ORDER BY total_sales DESC;

-- 4. Average Basket Value
SELECT
    AVG(o.value) AS average_basket_value
FROM orders o;

