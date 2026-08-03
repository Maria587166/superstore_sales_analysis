# superstore_sales_analysis
Business analytics project examining discount policy and profitability using Excel, SQL and Tableau

Overview 

Business analytics project examining how discount policy affects 

profitability at a retail company, and which product categories and customers actually 

bring value to the business. Built using Excel, SQL, and Tableau to investigate the same 

question from three different angles with cross-validated results. 

live interactive dashboard on Tableau Public  

Business Question 

How does the current discount policy affect profitability at Superstore, and which 

categories, regions, and customers should be prioritized for business decisions? 

This question is investigated step by step: first described (what’s happening), then 

statistically tested (why, and how significant), then made actionable (who is affected 

and what should change). 

Dataset 

Sample Superstore - a well-known global retail dataset, ~51,290 orders from 2011–2014, covering Furniture, Office Supplies, and 

Technology categories across multiple countries. 

Data quality note: 106 rows (~0.2% of the dataset) were excluded from the geographic 

map visualization due to missing values. 

Tools & Methodology 

1. Excel - Exploratory Analysis & Statistics 

Pivot Tables: sales/profit breakdown by category, region, and discount level 

Data Analysis ToolPak: 

T-tests (3x, one per category) comparing profit for discounted vs. non- 

discounted orders, Linear regression, Profit ~ Discount, to quantify the relationship and find a break-even point 

2. SQL (SQLite / DB Browser) 

Aggregate queries (GROUP BY, SUM, COUNT) - cross-checked against the Excel 

pivot tables, results matched exactly 

Window function NTILE(4) for RFM-style customer segmentation by profitability 

CTEs and subqueries to pull out customers with above-average profit 

3. Tableau - Interactive Dashboard 

Map of sales by region 

Profit by category (bar chart) 

Multi-year sales trend showing seasonality (line chart by year) 

Discount vs Profit scatter plot with a trend line 

Interactive category filter applied across all views 

Key Findings 

1. Discounts significantly reduce profitability - across all categories T-tests on all 

three categories showed statistically significant (p < 0.001) drops in average profit when 

a discount was applied: 

Category Avg. Profit (No Discount) Avg. Profit (With Discount) 

Furniture $103.56 / -$33.53 

Technology $131.29 / -$6.74 

Office Supplies $31.69 / -$7.48 

2. There is a quantifiable break-even discount threshold Linear regression (Excel, 

order-level, n=51,290): Profit = 65.76 − 259.93 × Discount (R^2 = 0.10, p < 0.001) 

Solving for Profit = 0 gives Discount ≈ 25.3%. Beyond this threshold, the average order 

becomes unprofitable. This was independently confirmed by Tableau’s aggregated 

trend line (Profit = 834.23 − 2059.92 × Discount, R^2 = 0.30), which shows the same 

negative relationship at a higher level of aggregation. 

3. High revenue doesn’t mean high profit Furniture generates competitive sales but has the lowest profit margin (7% vs 14% for other categories), driven by the highest 

average discount (17% vs 14%). The same pattern holds at the customer level: the top 

customer by sales (Tom Ashbrook, $40,489) ranks only 10th by profit, while the top 

customer by profit (Tamara Chand) isn’t the top by sales. 

4. The business shows consistent year-over-year growth with strong seasonality 

Peak monthly sales grew from ~$330K in 2011 to ~$550K in 2014, with a recurring 

seasonal spike toward year-end (Nov–Dec) every year, consistent with holiday-driven 

retail demand. 

5. Customer segmentation identifies where to focus retention efforts Using 

NTILE(4) in SQL, customers were split into profitability quartiles. The top quartile 

(“Champions”) should be prioritized for loyalty programs; the bottom quartile warrants 

investigation into discount exposure or churn risk. 

Limitations 

Correlation, not proven causation: the discount-profit relationship is strong and 

statistically significant, but this analysis can’t rule out reverse causation (e.g., 

discounts may have been applied more often to already low-margin or slow-moving 

products). A controlled experiment (an A/B test on discount levels) would be needed 

to establish causality. 

Aggregated vs order-level regression: the Excel regression (order-level, R^2=0.10) 

and the Tableau trend line (aggregated by discount level, R^2=0.30) use different 

levels of aggregation, which explains their different coefficients. Both agree on 

direction and significance. 

Single combined regression: the break-even threshold (~25.3%) is computed 

across all categories combined; a category-specific regression would likely yield 

different thresholds given each category’s different baseline profitability (see T-test 

results above). 

Repository Contents 

File Description 

superstore_cleaned_complete.csv - Raw dataset used across all three tools  

superstore_cleaned_complete_project.xlsx - Pivot tables, t-tests, and regression 

analysis_queries.sql - All SQL queries (aggregations, window functions,CTEs) 

sales_project.db - SQLite database (queryable with DB Browser for SQLite) 

dashboard_preview.png - Screenshot of the final Tableau dashboard 

 

How to Explore 

1. Excel: open superstore_cleaned_compete_project.xlsx, review the pivot tables and Data Analysis ToolPak 

output (t-test and regression sheets) 

2. SQL: open sales_project.db in DB Browser for SQLite, run queries from 

analysis_queries.sql on the Execute SQL tab 

Tableau: view the live dashboard  https://public.tableau.com/app/profile/maria.medvedieva2019/viz/SuperstoreSalesProfitabilityAnalysis_17854371878390/Dashboard1?publish=yes 

Author 

Maria M. - Business Analytics student

 

 
