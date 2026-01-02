SELECT *
FROM Capstone1C_EuroMart_Stores
LIMIT 10;


-- 	Cleaned the spaces in columns---------------
CREATE VIEW v_orders AS
SELECT
  "Order ID" AS order_id,
  "Order Date" AS order_date_raw,
  "Customer Name" AS customer_name,
  Country AS country,
  Category AS category,
  "Product Name" AS product_name,
  Quantity AS quantity,
  CAST(REPLACE(TRIM(" Sales "), '$', '') AS REAL) AS sales,
  CAST(REPLACE(TRIM(" Profit "), '$', '') AS REAL) AS profit
FROM Capstone1C_EuroMart_Stores;

SELECT *
FROM v_orders;

-- Looking at profitability ----------------------
SELECT 
	ROUND(SUM(sales), 2) AS total_sales,
	ROUND(SUM(profit), 2 ) AS total_profit
FROM v_orders;

SELECT
  ROUND(100.0 * SUM(profit) / SUM(sales), 2) AS profit_margin_percent
FROM v_orders;

SELECT
  category,
  ROUND(SUM(sales), 2) AS sales,
  ROUND(SUM(profit), 2) AS profit,
  ROUND(100.0 * SUM(profit) / SUM(sales), 2) AS profit_margin_percent
FROM v_orders
GROUP BY category
ORDER BY profit DESC;

-- Which countries are making the most revenue------

SELECT
	country,
	ROUND(SUM(sales),2) AS sales
FROM v_orders
GROUP BY country
ORDER BY sales DESC;


SELECT
  ROUND(
    100.0 * 
    (SELECT SUM(sales)
     FROM (
       SELECT SUM(sales) AS sales
       FROM v_orders
       GROUP BY country
       ORDER BY sales DESC
       LIMIT 5)) / (SELECT SUM(sales) FROM v_orders), 2) AS top_5_country_sales_percentage;

-- The sales between the product categories------------
SELECT
  category,
  ROUND(SUM(sales), 2) AS sales
FROM v_orders
GROUP BY category
ORDER BY sales DESC;

-- Number of Sales monthly -----------------------------

SELECT
  SUBSTR(order_date_raw, 7, 4) || '-' || SUBSTR(order_date_raw, 4, 2) AS month,
  ROUND(SUM(sales), 2) AS sales
FROM v_orders
GROUP BY month
ORDER BY month;


