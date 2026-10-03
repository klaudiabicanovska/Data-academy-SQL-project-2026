CREATE TABLE t_klaudia_bicanovska_project_SQL_secondary_final AS
SELECT
    e.year,
    e.country,
    ROUND(e.gdp::numeric, 2) AS average_gdp,
    ROUND(e.gini::numeric, 2) AS average_gini,
    e.population AS average_population
FROM economies e
JOIN countries c
    ON e.country = c.country
WHERE e.year BETWEEN 2006 AND 2018
    AND c.region_in_world IN (
        'Southern Europe',
        'Central and Southeast Europe',
        'Eastern Europe',
        'Western Europe',
        'Baltic Countries',
        'British Isles',
        'Nordic Countries'
    )
ORDER BY e.year, e.country;
