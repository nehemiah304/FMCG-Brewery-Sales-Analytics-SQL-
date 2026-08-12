SELECT * 
FROM fmcg_sales;

-- Question 1. Total profit worth of the breweries (Anglophone + Francophone), 2017–2019
SELECT SUM(PROFIT) AS sum_of_profit
FROM fmcg_sales;

-- Question 2. Total profit: Anglophone vs Francophone territory
SELECT
  CASE WHEN COUNTRIES IN ('Ghana','Nigeria') THEN 'Anglophone'
       ELSE 'Francophone' END AS territory,
  SUM(PROFIT) AS total_profit
FROM fmcg_sales
GROUP BY territory
ORDER BY total_profit DESC;

-- Question 3. Country with the highest profit in 2019
SELECT COUNTRIES, SUM(PROFIT) AS total_profit
FROM fmcg_sales
WHERE YEARS = 2019
GROUP BY COUNTRIES
ORDER BY total_profit DESC
LIMIT 1;

-- Question 4. Year with the highest profit
SELECT YEARS, SUM(PROFIT) AS total_profit
FROM fmcg_sales
GROUP BY YEARS
ORDER BY total_profit DESC
LIMIT 1;

-- Question 5. Month with the least profit generated (2017–2019 combined)
SELECT MONTHS, SUM(PROFIT) AS total_profit
FROM fmcg_sales
GROUP BY MONTHS
ORDER BY total_profit ASC
LIMIT 1;

-- Question 6. Minimum profit recorded in December 2018
SELECT MIN(PROFIT) AS min_profit
FROM fmcg_sales
WHERE MONTHS = 'December' AND YEARS = 2018;

-- Question 7. Monthly profit share (%) for 2019
SELECT MONTHS,
  SUM(PROFIT) AS month_profit,
  ROUND(SUM(PROFIT) * 100.0 / (SELECT SUM(PROFIT) FROM fmcg_sales WHERE YEARS = 2019), 2) AS pct_of_2019_profit
FROM fmcg_sales
WHERE YEARS = 2019
GROUP BY MONTHS
ORDER BY CASE MONTHS
  WHEN 'January' THEN 1 WHEN 'February' THEN 2 WHEN 'March' THEN 3
  WHEN 'April' THEN 4 WHEN 'May' THEN 5 WHEN 'June' THEN 6
  WHEN 'July' THEN 7 WHEN 'August' THEN 8 WHEN 'September' THEN 9
  WHEN 'October' THEN 10 WHEN 'November' THEN 11 WHEN 'December' THEN 12 END;
  
-- Question 8. Brand generating the highest profit in Senegal
SELECT BRANDS, SUM(PROFIT) AS total_profit
FROM fmcg_sales
WHERE COUNTRIES = 'Senegal'
GROUP BY BRANDS
ORDER BY total_profit DESC
LIMIT 1;

-- Question 9. Profit trend over the months (chronological, all years)
SELECT YEARS, MONTHS, SUM(profit) AS monthly_profit
FROM fmcg_sales
GROUP BY YEARS, MONTHS
ORDER BY YEARS, CASE MONTHS
  WHEN 'January' THEN 1 WHEN 'February' THEN 2 WHEN 'March' THEN 3
  WHEN 'April' THEN 4 WHEN 'May' THEN 5 WHEN 'June' THEN 6
  WHEN 'July' THEN 7 WHEN 'August' THEN 8 WHEN 'September' THEN 9
  WHEN 'October' THEN 10 WHEN 'November' THEN 11 WHEN 'December' THEN 12 END;

-- Question 10. Top 3 brands consumed in Francophone countries (2018–2019)
SELECT BRANDS, SUM(QUANTITY) AS total_quantity
FROM fmcg_sales
WHERE YEARS IN (2018, 2019)
  AND COUNTRIES IN ('Benin','Senegal','Togo')
GROUP BY BRANDS
ORDER BY total_quantity DESC
LIMIT 3;

-- Question 11. Top 2 consumer brands in Ghana
SELECT BRANDS, SUM(QUANTITY) AS total_quantity
FROM fmcg_sales
WHERE COUNTRIES = 'Ghana'
GROUP BY BRANDS
ORDER BY total_quantity DESC
LIMIT 2;

-- Question 12. Beers consumed in the past 3 years in Nigeria (most oil-rich West African country)
SELECT BRANDS, SUM(QUANTITY) AS total_quantity, SUM(PROFIT) AS total_profit
FROM fmcg_sales
WHERE COUNTRIES = 'Nigeria'
  AND BRANDS NOT IN ('beta malt','grand malt')
GROUP BY BRANDS
ORDER BY total_quantity DESC;

-- Question 13. Favourite malt brand in the Anglophone region (2018–2019)
SELECT BRANDS, SUM(QUANTITY) AS total_quantity
FROM fmcg_sales
WHERE COUNTRIES IN ('Ghana','Nigeria')
  AND YEARS IN (2018, 2019)
  AND BRANDS IN ('beta malt','grand malt')
GROUP BY BRANDS
ORDER BY total_quantity DESC
LIMIT 1;

-- Question 14. Brands that sold the highest in 2019 in Nigeria
SELECT BRANDS, SUM(QUANTITY) AS total_quantity
FROM fmcg_sales
WHERE COUNTRIES = 'Nigeria' AND YEARS = 2019
GROUP BY BRANDS
ORDER BY total_quantity DESC;

-- Question 15. Favourite brand in the South-South region of Nigeria
SELECT BRANDS, SUM(QUANTITY) AS total_quantity
FROM fmcg_sales
WHERE COUNTRIES = 'Nigeria' AND REGION = 'southsouth'
GROUP BY BRANDS
ORDER BY total_quantity DESC
LIMIT 1;

-- Question 16. Beer consumption in Nigeria (all years, all brands excluding malt)
SELECT BRANDS, SUM(QUANTITY) AS total_quantity
FROM fmcg_sales
WHERE COUNTRIES = 'Nigeria'
  AND BRANDS NOT IN ('beta malt','grand malt')
GROUP BY BRANDS
ORDER BY total_quantity DESC;

-- Question 17. Budweiser consumption by region in Nigeria (all years)
SELECT REGION, SUM(QUANTITY) AS total_quantity
FROM fmcg_sales
WHERE COUNTRIES = 'Nigeria' AND BRANDS = 'budweiser'
GROUP BY REGION
ORDER BY total_quantity DESC;

-- Question 18. Budweiser consumption by region in Nigeria, 2019 (promo decision)
SELECT REGION, SUM(QUANTITY) AS total_quantity
FROM fmcg_sales
WHERE COUNTRIES = 'Nigeria' AND BRANDS = 'budweiser' AND YEARS = 2019
GROUP BY REGION
ORDER BY total_quantity DESC;

-- Question 19. Country with the highest beer consumption
SELECT COUNTRIES, SUM(QUANTITY) AS total_quantity
FROM fmcg_sales
WHERE BRANDS NOT IN ('beta malt','grand malt')
GROUP BY COUNTRIES
ORDER BY total_quantity DESC
LIMIT 1;

-- Question 20. Highest-performing Budweiser sales personnel in Senegal
SELECT SALES_REP, SUM(QUANTITY) AS total_quantity, SUM(PROFIT) AS total_profit
FROM fmcg_sales
WHERE COUNTRIES = 'Senegal' AND BRANDS = 'budweiser'
GROUP BY SALES_REP
ORDER BY total_quantity DESC
LIMIT 1;

-- Question 21. Country with the highest profit in Q4 2019 (Oct–Dec)
SELECT COUNTRIES, SUM(PROFIT) AS total_profit
FROM fmcg_sales
WHERE YEARS = 2019 AND MONTHS IN ('October','November','December')
GROUP BY COUNTRIES
ORDER BY total_profit DESC
LIMIT 1;










