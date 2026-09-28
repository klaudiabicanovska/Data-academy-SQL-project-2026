WITH change_of_prices AS (
SELECT
	YEAR,
	TKBPSPF.ITEM AS type_of_product,
	(avg(value) - lag(avg(value)) OVER (PARTITION BY item ORDER BY year))/lag(avg(value)) OVER (PARTITION BY item ORDER BY year)*100 AS percentage_change
FROM T_KLAUDIA_BICANOVSKA_PROJECT_SQL_PRIMARY_FINAL TKBPSPF 
WHERE TYPE = 'cena'
GROUP BY item,YEAR
)
SELECT 
	type_of_product,
	round(avg(percentage_change),2) AS avg_percentage_change
FROM change_of_prices
GROUP BY type_of_product
ORDER BY avg_percentage_change asc;