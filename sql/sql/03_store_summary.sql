SELECT * FROM store_performance_overview;

SELECT
    region,
    ROUND(SUM(total_sales), 2) AS region_total_sales,
    ROUND(SUM(total_target), 2) AS region_total_target,
    ROUND(AVG(avg_sales_vs_target_ratio), 4) AS region_avg_sales_vs_target_ratio,
    ROUND(AVG(avg_sales_per_staff_hour), 2) AS region_avg_sales_per_staff_hour,
    ROUND(AVG(avg_basket_value), 2) AS region_avg_basket_value,
    SUM(complaint_count) AS region_complaint_count
FROM store_performance_overview
GROUP BY region
ORDER BY region_total_sales DESC;