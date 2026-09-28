WITH trend_wage AS (
SELECT 
	item,
	value - LAG (value) OVER (PARTITION BY item ORDER BY year) AS trend
FROM T_KLAUDIA_BICANOVSKA_PROJECT_SQL_PRIMARY_FINAL TKBPSPF 
WHERE TYPE = 'mzda')
SELECT 
item AS  industry,
	CASE 
		WHEN min(trend) < 0 THEN 'aspoň raz klesala'
		ELSE 'vždy rástla'
	END AS result
FROM trend_wage
GROUP BY item
ORDER BY RESULT desc; 
