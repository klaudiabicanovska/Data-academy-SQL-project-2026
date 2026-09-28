---Pomocné scripty.
SELECT
	region_code,
	count(*)
FROM czechia_price
GROUP BY region_code;

SELECT 
	count(value),
	CP.CALCULATION_CODE,
	count(CP.CALCULATION_CODE )
FROM CZECHIA_PAYROLL CP 
WHERE CP.VALUE_TYPE_CODE = 5958
GROUP BY CALCULATION_CODE;

---Vytvorenie tabuľky.
CREATE TABLE t_klaudia_bicanovska_project_SQL_primary_final AS 
WITH years as(
SELECT 
	CP.PAYROLL_YEAR 
FROM CZECHIA_PAYROLL CP 
INTERSECT 
SELECT
 	date_part('year', cp2.date_from)
FROM CZECHIA_PRICE CP2 
)
SELECT 
	CP.PAYROLL_YEAR AS year,
	'mzda' AS TYPE,
	cpib.name AS item,
	round(avg(cp.value::numeric),2) AS value,
	'CZK' AS unit
FROM CZECHIA_PAYROLL CP 
JOIN CZECHIA_PAYROLL_INDUSTRY_BRANCH CPIB 
	ON cp.INDUSTRY_BRANCH_CODE =cpib.code
WHERE CP.VALUE_TYPE_CODE = 5958
	AND CP.CALCULATION_CODE = 200
	AND CP.PAYROLL_YEAR IN (SELECT*FROM years)
GROUP BY cp.PAYROLL_YEAR, cpib.name
UNION ALL 
SELECT 
	date_part('year', date_from) AS year,
	'cena' AS TYPE,
	cpc.name AS item,
	round(avg (cp.value::numeric),2) AS value,
	cpc.PRICE_UNIT AS unit 
FROM CZECHIA_PRICE CP 
JOIN CZECHIA_PRICE_CATEGORY CPC 
	ON cp.CATEGORY_CODE = cpc.code
WHERE CP.REGION_CODE IS NULL
	AND date_part('year', date_from) IN (select*FROM years)
GROUP BY date_part('year', date_from), cpc.name, cpc.PRICE_UNIT ;

--Overenie dát.
SELECT
	TYPE,
	count(*) AS pocet
FROM t_klaudia_bicanovska_project_SQL_primary_final 
WHERE TYPE IN ('mzda','cena')
GROUP BY "type" ;

SELECT
	item,
	count(year)
FROM t_klaudia_bicanovska_project_SQL_primary_final
WHERE TYPE = 'cena'
GROUP BY item;

SELECT
	YEAR
FROM t_klaudia_bicanovska_project_SQL_primary_final
WHERE TYPE = 'cena'
		AND item = 'Jakostní víno bílé';



