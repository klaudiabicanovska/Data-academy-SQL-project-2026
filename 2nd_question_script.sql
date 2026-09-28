WITH price AS (
SELECT
	year,
	item AS type_of_product,
	value AS price_of_product
FROM T_KLAUDIA_BICANOVSKA_PROJECT_SQL_PRIMARY_FINAL TKBPSPF 
WHERE
	TYPE = 'cena'
	AND item IN ('Chléb konzumní kmínový','Mléko polotučné pasterované')
	AND YEAR IN (2006,2018)
),
wage AS (
SELECT
	YEAR,
	avg(value) AS average_wage
FROM T_KLAUDIA_BICANOVSKA_PROJECT_SQL_PRIMARY_FINAL TKBPSPF 
WHERE TYPE ='mzda'
	AND YEAR IN (2006,2018)
GROUP BY year
)
SELECT 
	price.YEAR,
	TYPE_OF_PRODUCT,
	round(AVERAGE_WAGE /price.price_of_product,2) AS amount_affordable_per_wage
FROM price 
JOIN wage
ON price.YEAR=wage.YEAR;


