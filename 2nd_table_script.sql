CREATE TABLE t_klaudia_bicanovska_project_SQL_secondary_final AS 
	SELECT
	e.YEAR,
	e.country,
	round(avg(e.gdp::numeric),2) AS average_gdp,
	round(avg(e.gini::numeric),2) AS average_gini,
	round(avg(e.population::numeric),2) AS average_population
FROM economies e 
JOIN countries c
ON e.country = c.country
WHERE e.YEAR BETWEEN 2006 AND 2018
	AND c.region_in_world LIKE '%Europe'
GROUP BY e.YEAR, e.country
ORDER BY e.YEAR;





