WITH wages AS (
SELECT
	YEAR,
	round ((avg(value) - LAG (avg(value)) OVER (ORDER BY year))/(LAG (avg(value)) OVER (ORDER BY year)) *100,2)AS trend_of_wage
FROM T_KLAUDIA_BICANOVSKA_PROJECT_SQL_PRIMARY_FINAL TKBPSPF 
WHERE type = 'mzda'
GROUP BY YEAR
),
prices AS (
SELECT
	YEAR,
	round((avg(value) - LAG (avg(value)) OVER (ORDER BY year))/(LAG (avg(value)) OVER (ORDER BY year))*100,2)AS trend_of_prices
FROM T_KLAUDIA_BICANOVSKA_PROJECT_SQL_PRIMARY_FINAL TKBPSPF 
WHERE type = 'cena'
GROUP BY year
)
SELECT
	prices."year",
	TREND_OF_PRICEs,
	trend_of_wage,
	CASE 
		WHEN (TREND_OF_PRICEs - trend_of_wage)>10 THEN 'áno'
		ELSE 'nie'
	END AS RESULT 
FROM wages 
JOIN prices 
ON wages.YEAR = prices.YEAR
ORDER BY year;