#Sums daily revenue 
SELECT c_date,
WEEKDAY(c_date) AS weekday_index,
CASE
WHEN WEEKDAY(c_date) = 0 THEN "Monday"
WHEN WEEKDAY(c_date) = 1 THEN "Tuesday"
WHEN WEEKDAY(c_date) = 2 THEN "Wednesday"
WHEN WEEKDAY(c_date) = 3 THEN "Thursday"
WHEN WEEKDAY(c_date) = 4 THEN "Friday"
WHEN WEEKDAY(c_date) = 5 THEN "Saturday"
WHEN WEEKDAY(c_date) = 6 THEN "Sunday"
END AS specific_day,
LOWER(substring_index(campaign_name, "_",1)) AS company_names,
SUM(revenue) AS summed_weekly_revenue
FROM marketing
GROUP BY c_date,weekday_index,company_names
ORDER BY company_names, c_date;
