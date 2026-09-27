-- --------------------------------------------------------------------
-- QUERY 1: Route Financial Loss & Ranking (CTE + DENSE_RANK)
-- Business Goal: Identify top financial leak routes causing max penalty loss (₹150/hr).
-- --------------------------------------------------------------------
WITH Route_Metrics AS (
    SELECT 
        source_name,
        destination_name,
        route_type,
        COUNT(trip_uuid) AS total_orders,
        SUM(delay_minutes) AS total_delay_mins,
        ROUND(((SUM(delay_minutes) / 60.0) * 150)::numeric, 2) AS total_delay_loss_inr
    FROM public.logistics
    GROUP BY source_name, destination_name, route_type
)
SELECT 
    source_name,
    destination_name,
    route_type,
    total_orders,
    total_delay_mins,
    total_delay_loss_inr,
    DENSE_RANK() OVER (ORDER BY total_delay_loss_inr DESC) AS financial_loss_rank
FROM Route_Metrics
ORDER BY financial_loss_rank ASC
LIMIT 10;

-- --------------------------------------------------------------------
-- QUERY 2: SLA Risk Categorization & Volume Distribution (CASE WHEN + Aggregation)
-- Business Goal: Categorize operational delay severity across order fulfillment.
-- --------------------------------------------------------------------

WITH SLA_Breakdown AS (
    SELECT 
        trip_uuid,
        delay_minutes,
        CASE 
            WHEN delay_minutes <= 0 THEN 'On-Time'
            WHEN delay_minutes <= 30 THEN 'Minor Delay (<30m)'
            WHEN delay_minutes <= 120 THEN 'Moderate Delay (30m-2h)'
            ELSE 'Critical SLA Breach (>2h)'
        END AS sla_status
    FROM public.logistics
)
SELECT 
    sla_status,
    COUNT(trip_uuid) AS total_orders,
    ROUND((COUNT(trip_uuid) * 100.0 / SUM(COUNT(trip_uuid)) OVER ())::numeric, 2) AS percentage_share,
    ROUND((SUM(GREATEST(delay_minutes, 0) / 60.0) * 150)::numeric, 2) AS category_loss_inr
FROM SLA_Breakdown
GROUP BY sla_status
ORDER BY category_loss_inr DESC;

-- --------------------------------------------------------------------
-- QUERY 3: Route Bottleneck Profiling via NTILE Quartiles (Window Functions)
-- Business Goal: Classify routes into 4 risk tiers (Tier 1: Highest Risk to Tier 4: Lowest).
-- --------------------------------------------------------------------

WITH Route_Performance AS (
    SELECT 
        source_name,
        destination_name,
        AVG(delay_minutes) AS avg_delay_mins,
        ROUND(((SUM(delay_minutes) / 60.0) * 150)::numeric, 2) AS route_loss_inr
    FROM public.logistics
    GROUP BY source_name, destination_name
)
SELECT 
    source_name,
    destination_name,
    ROUND(avg_delay_mins::numeric, 2) AS avg_delay_mins,
    route_loss_inr,
    NTILE(4) OVER (ORDER BY avg_delay_mins DESC) AS risk_quartile
FROM Route_Performance
ORDER BY risk_quartile ASC, avg_delay_mins DESC;

-- --------------------------------------------------------------------
-- QUERY 4: What-If Scenario Optimization Matrix (Cost Reduction Simulation)
-- Business Goal: Simulate potential operational savings at 10%, 20%, and 30% delay reduction.
-- --------------------------------------------------------------------

SELECT 
    COUNT(trip_uuid) AS total_orders,
    ROUND((SUM(delay_minutes) / 60.0)::numeric, 2) AS total_delay_hours,
    ROUND(((SUM(delay_minutes) / 60.0) * 150)::numeric, 2) AS current_total_loss_inr,
    ROUND((((SUM(delay_minutes) / 60.0) * 150) * 0.10)::numeric, 2) AS savings_at_10_percent_reduction,
    ROUND((((SUM(delay_minutes) / 60.0) * 150) * 0.20)::numeric, 2) AS savings_at_20_percent_reduction,
    ROUND((((SUM(delay_minutes) / 60.0) * 150) * 0.30)::numeric, 2) AS savings_at_30_percent_reduction
FROM public.logistics;