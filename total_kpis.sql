SELECT LOWER(substring_index(campaign_name, "_",1)) AS company_names, 
ROUND(SUM(mark_spent),2) AS total_campaign_spending,
ROUND(SUM(revenue),2) AS total_revenue,
ROUND((SUM(revenue))/SUM(orders),2) AS avg_order_value,
ROUND(SUM(mark_spent)/SUM(clicks),2) AS cost_per_click,
ROUND(SUM(mark_spent)/SUM(leads),2) AS cost_per_lead,
ROUND(SUM(mark_spent)/SUM(orders),2) AS customer_acquisition_cost,
ROUND((SUM(revenue) - SUM(mark_spent))/(SUM(mark_spent)),2) AS total_ROI

FROM marketing
GROUP BY company_names;