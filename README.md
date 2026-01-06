# SQL Retail Sales Analysis

## Overview
This project analyses an order level retail dataset using SQL to explore sales performance, profitability, and demand trends.

## Dataset
- Source: Kaggle – EuroMart Stores Order Data (https://www.kaggle.com/datasets/braniac2000/retail-dataset/data)
- The dataset contains information on orders, products, customers, sales, profit, and geography.

## Key Questions
- Which categories drive the most revenue?
- How does profitability vary by category?
- How is sales distributed across countries?
- What trends and seasonal patterns exist over time?

## Data analysis
The top 30 products generated £85.9k in sales with a profit margin of 19.23%, compared to £255.7k in sales and a lower margin of 14.02% for the rest of the category. This indicates that higher performing Furniture products are also more margin efficient.
The bottom 30 products generated only £296 in sales showing negative profit margins, which contribute negligible revenue but can potentially cut profitability. Given their minimal impact, these items may warrant review for discontinuation or pricing adjustment.

The top 30 products generated £138.3k in sales at a profit margin of 10.2%, compared to £475.4k in sales and a higher margin of 20.04% for the rest of the category. This indicates that Office Supplies’ highest selling products are largely volume driven, while stronger margins are achieved by mid tier products.
The bottom 30 products generated only £95 in sales and produced extreme profit margins due to very low revenue levels. These products may serve niche customer needs and could be retained with minimal overhead while focusing efforts on loss making items.

The top 30 products generated £92.5k in sales with a profit margin of 10.5%, compared to £381.6k in sales and a higher margin of 23.54% for the rest of the category. This indicates that Technology highest selling products are largely volume driven, while stronger margins are achieved by mid tier products.
The bottom 30 products contributed just £1.6k in sales and produced disproportionately high margin's driven by low sales rather than sustainable profitability but does indicate viable pricing or cost structures. These products may serve niche customers demands and could warrant selective experimentation through targeted marketing or bundling to further scale up.


## Key Insights
- Office Supplies is the largest revenue driving category, accounting for approximately 43% of total sales followed by Technology and Furniture. Although Office Supplies drives the highest revenue, its profit margin (18.13%) is lower than Technology (21%). This suggests that while Office Supplies generates volume-led revenue, Technology delivers more efficient profit per unit of sales. Improving margins within Office Supplies could have a significant impact on overall profitability given its large revenue share.
- Between Office Supplies and Technology, top selling products drive most revenue but operate at lower margins, indicating volume led growth and increased sensitivity to pricing. Mid tier products consistently achieve higher margins, suggesting stronger pricing power and a disproportionate contribution to profitability. Bottom selling products generate negligible revenue, while some remain profitable and serve niche demand, optimisation efforts should prioritise margin improvement among high volume products and rationalisation of consistently loss making items.

- Sales are highly concentrated, with the top 5 countries accounting for approximately 84.59%. The remaining 10 countries contribute relatively low sales, indicating potential for market expansion.
  
- Monthly sales show a clear upward trend over time, indicating growth in overall demand. Sales Exhibit seasonal patterns, with noticeable peaks during specific periods. Sustained growth combined with seasonal peaks suggests the need for effective capacity and inventory planning to meet periods of higher demand.

## Tools Used
- SQL (SQLite)
- DBeaver




