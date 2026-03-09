select * from logistics

--Q-1) What percentage of total orders are delivered late?
--(Overall Delay Rate – KPI)
SELECT 
    ROUND(
        100.0 * SUM(CASE WHEN delay_minutes > 0 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS late_delivery_percentage
FROM logistics;

--Q-2) Which states have the highest average delivery delay?
--(Identify Red Zones)
SELECT 
    state,
    AVG(delay_minutes) AS avg_delay_minutes
FROM logistics
WHERE delay_minutes > 0
GROUP BY state
ORDER BY avg_delay_minutes DESC;

--Q-3) Which route types are contributing most to delivery delays?
--(Operational bottleneck detection)
SELECT 
    route_type,
    COUNT(*) AS total_trips,
    AVG(delay_minutes) AS avg_delay
FROM logistics
GROUP BY route_type
ORDER BY avg_delay DESC;

--Q-4)Are delays caused more by sellers or by carriers?
--(Seller Time vs Carrier Time analysis)
SELECT
    CASE 
        WHEN actual_time <= osrm_time THEN 'Seller Delay'
        ELSE 'Carrier Delay'
    END AS delay_reason,
    COUNT(*) AS total_delayed_orders
FROM logistics
WHERE delay_minutes > 0
GROUP BY delay_reason;

--Q-5)Which locations consistently miss delivery commitments despite short delivery distances?
--(Operational inefficiency detection)
SELECT
    state,
    COUNT(*) AS total_orders,
    AVG(delay_minutes) AS avg_delay,
    AVG(actual_distance_to_destination) AS avg_distance
FROM logistics
GROUP BY state
HAVING AVG(actual_distance_to_destination) < 100
   AND AVG(delay_minutes) > 30
ORDER BY avg_delay DESC;

--Q-6) Does delivery distance impact delay duration?
--(Distance vs Delay relationship)
SELECT
    CASE 
        WHEN actual_distance_to_destination < 100 THEN 'Short Distance'
        WHEN actual_distance_to_destination BETWEEN 100 AND 500 THEN 'Medium Distance'
        ELSE 'Long Distance'
    END AS distance_category,
    AVG(delay_minutes) AS avg_delay
FROM logistics
GROUP BY distance_category;

--Q-7) How does delivery speed affect delays?
--(Speed efficiency analysis)
SELECT
    avg_speed AS speed_bucket,
    AVG(delay_minutes) AS avg_delay
FROM logistics
GROUP BY avg_speed
ORDER BY speed_bucket;

--Q-8) How does route efficiency impact delivery delays?
--(Efficiency Ratio KPI analysis)
SELECT
    CASE 
        WHEN efficiency_ratio < 0.8 THEN 'Low Efficiency'
        WHEN efficiency_ratio BETWEEN 0.8 AND 1.0 THEN 'Medium Efficiency'
        ELSE 'High Efficiency'
    END AS efficiency_level,
    AVG(delay_minutes) AS avg_delay
FROM logistics
GROUP BY efficiency_level;

--Q-9) Which source-to-destination routes are the most problematic?
--(Route-level bottleneck identification)
SELECT
    source_name,
    destination_name,
    COUNT(*) AS total_trips,
    AVG(delay_minutes) AS avg_delay
FROM logistics
GROUP BY source_name, destination_name
HAVING AVG(delay_minutes) > 30
ORDER BY avg_delay DESC;

--Q-10) What are the top 10 worst-performing deliveries?
--(Critical cases for management action)
SELECT
    trip_uuid,
    state,
    route_type,
    delay_minutes,
    efficiency_ratio
FROM logistics
ORDER BY delay_minutes DESC
LIMIT 10;