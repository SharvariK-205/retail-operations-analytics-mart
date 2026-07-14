CREATE OR REPLACE TABLE store_daily_kpi AS
SELECT
    ds.date,
    ds.store_id,
    s.store_name,
    s.region,
    ds.sales_amount,
    t.target_sales_amount,
    ROUND(
        CASE
            WHEN t.target_sales_amount IS NOT NULL AND t.target_sales_amount <> 0
            THEN ds.sales_amount * 1.0 / t.target_sales_amount
            ELSE NULL
        END, 4
    ) AS sales_vs_target_ratio,
    st.staff_hours,
    ROUND(
        CASE
            WHEN st.staff_hours IS NOT NULL AND st.staff_hours <> 0
            THEN ds.sales_amount * 1.0 / st.staff_hours
            ELSE NULL
        END, 2
    ) AS sales_per_staff_hour,
    ds.transactions,
    ROUND(
        CASE
            WHEN ds.transactions IS NOT NULL AND ds.transactions <> 0
            THEN ds.sales_amount * 1.0 / ds.transactions
            ELSE NULL
        END, 2
    ) AS avg_basket_value
FROM daily_sales ds
LEFT JOIN stores s
    ON ds.store_id = s.store_id
LEFT JOIN staffing st
    ON ds.store_id = st.store_id
    AND ds.date = st.date
LEFT JOIN targets t
    ON ds.store_id = t.store_id
    AND ds.date = t.date;

CREATE OR REPLACE TABLE store_summary AS
SELECT
    store_id,
    store_name,
    region,
    ROUND(SUM(sales_amount), 2) AS total_sales,
    ROUND(SUM(target_sales_amount), 2) AS total_target,
    ROUND(AVG(sales_vs_target_ratio), 4) AS avg_sales_vs_target_ratio,
    ROUND(AVG(sales_per_staff_hour), 2) AS avg_sales_per_staff_hour,
    ROUND(AVG(avg_basket_value), 2) AS avg_basket_value
FROM store_daily_kpi
GROUP BY store_id, store_name, region
ORDER BY total_sales DESC;

CREATE OR REPLACE TABLE complaint_summary AS
SELECT
    store_id,
    COUNT(*) AS complaint_count
FROM complaints
GROUP BY store_id;

CREATE OR REPLACE TABLE store_performance_overview AS
SELECT
    ss.store_id,
    ss.store_name,
    ss.region,
    ss.total_sales,
    ss.total_target,
    ss.avg_sales_vs_target_ratio,
    ss.avg_sales_per_staff_hour,
    ss.avg_basket_value,
    COALESCE(cs.complaint_count, 0) AS complaint_count
FROM store_summary ss
LEFT JOIN complaint_summary cs
    ON ss.store_id = cs.store_id
ORDER BY ss.total_sales DESC;