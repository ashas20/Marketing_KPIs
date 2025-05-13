WITH campaign_metrics AS(
SELECT id,
c_date,
LOWER(campaign_name) AS market_campaign_name, 
category,
campaign_id,
impressions,
mark_spent,
clicks,
leads,
orders,
revenue 
FROM marketing

ORDER BY market_campaign_name,c_date ASC)

SELECT
c_date,
market_campaign_name,
category,
campaign_id,
ROUND(((revenue))/(orders),2) AS avg_order_value,
ROUND(((clicks))/(impressions),2) AS click_through_rate,
ROUND((mark_spent)/(clicks),2) AS cost_per_click,
ROUND((mark_spent)/(leads),2) AS cost_per_lead,
ROUND((mark_spent)/(orders),2) AS customer_acquisition_cost,
ROUND(((revenue) - (mark_spent))/((mark_spent)),2) AS total_ROI
FROM campaign_metrics;