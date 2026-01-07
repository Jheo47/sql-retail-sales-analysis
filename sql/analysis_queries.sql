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

-- For each Product Profit / sales / Margins---------------------------

SELECT
  category,
  product_name,
  SUM(quantity) AS total_units_sold,
  ROUND(SUM(sales), 2)  AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit,
  ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct
FROM v_orders
WHERE sales > 0
GROUP BY category, product_name;


-- TOP 30 PRODUCTS --------------------------------------------

WITH product_sales AS (
  SELECT
    category,
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROW_NUMBER() OVER (
      PARTITION BY category
      ORDER BY SUM(sales) DESC
    ) AS sales_rank
  FROM v_orders
  GROUP BY category, product_name
)
SELECT
  category,
  'Top 30 Products' AS product_group,
  ROUND(SUM(total_sales), 2) AS group_sales,
  ROUND(SUM(total_profit), 2) AS group_profit,
  ROUND(SUM(total_profit) / SUM(total_sales) * 100, 2) AS profit_margin_pct
FROM product_sales
WHERE sales_rank <= 30
GROUP BY category;

-- EVERYTHING WIHTOUT TOP 30------

WITH product_sales AS (
  SELECT
    category,
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROW_NUMBER() OVER (
      PARTITION BY category
      ORDER BY SUM(sales) DESC
    ) AS sales_rank
  FROM v_orders
  GROUP BY category, product_name
)
SELECT
  category,
  'Rest of Category' AS product_group,
  ROUND(SUM(total_sales), 2) AS group_sales,
  ROUND(SUM(total_profit), 2) AS group_profit,
  ROUND(SUM(total_profit) / SUM(total_sales) * 100, 2) AS profit_margin_pct
FROM product_sales
WHERE sales_rank > 30
GROUP BY category;

-- BOTTOM 30 products-------------------------------------------


WITH product_sales AS (
  SELECT
    category,
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROW_NUMBER() OVER (
      PARTITION BY category
      ORDER BY SUM(sales) ASC
    ) AS sales_rank
  FROM v_orders
  GROUP BY category, product_name
)
SELECT
  category,
  'Bottom 30 Products' AS product_group,
  ROUND(SUM(total_sales), 2) AS group_sales,
  ROUND(SUM(total_profit), 2) AS group_profit,
  ROUND(SUM(total_profit) / SUM(total_sales) * 100, 2) AS profit_margin_pct
FROM product_sales
WHERE sales_rank <= 30
GROUP BY category;




