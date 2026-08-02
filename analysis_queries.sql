{\rtf1\ansi\ansicpg1252\cocoartf2865
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Query 1: Sales and profit by category\
SELECT category,\
                  COUNT(*) AS orders_count,\
				  ROUND (SUM(sales), 2) AS total_sales,\
				  ROUND (SUM(profit), 2) AS total_profit\
FROM superstore_cleaned_complete\
GROUP BY category\
ORDER BY total_sales DESC;\
\
-- Query 2: Top 10 customers by profit\
SELECT customer_name,\
                  COUNT(*) AS orders_count,\
				  ROUND (SUM(sales), 2) AS total_sales,\
				  ROUND (SUM(profit), 2) AS total_profit\
FROM superstore_cleaned_complete\
GROUP BY customer_name\
ORDER BY total_profit DESC\
LIMIT 10;\
\
-- Query 3: RFM-like segmentation using NTILE window function\
SELECT customer_name,\
                  COUNT(*) AS frequency,\
				  ROUND(SUM(profit), 2) AS monetary,\
				  NTILE(4) OVER (ORDER BY SUM(profit) DESC) AS profit_quartile\
FROM superstore_cleaned_complete\
GROUP BY customer_name\
ORDER BY monetary DESC;\
\
-- Query 4: Customers with above-average profit (CTE + subquery)\
WITH customer_profit AS (\
            SELECT customer_name, SUM(profit) AS total_profit\
			FROM superstore_cleaned_complete\
			GROUP BY customer_name\
)\
SELECT customer_name, total_profit\
FROM customer_profit\
WHERE total_profit > (SELECT AVG(total_profit) FROM customer_profit)\
ORDER BY total_profit DESC;}