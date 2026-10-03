WITH wages AS (
    SELECT
        year,
        ROUND((AVG(value) - LAG(AVG(value)) OVER (ORDER BY year))
            / LAG(AVG(value)) OVER (ORDER BY year) * 100, 2) AS trend_of_wage
    FROM t_klaudia_bicanovska_project_SQL_primary_final
    WHERE type = 'mzda'
    GROUP BY year
),
prices AS (
    SELECT
        year,
        ROUND((AVG(value) - LAG(AVG(value)) OVER (ORDER BY year))
            / LAG(AVG(value)) OVER (ORDER BY year) * 100, 2) AS trend_of_prices
    FROM t_klaudia_bicanovska_project_SQL_primary_final
    WHERE type = 'cena'
    GROUP BY year
)
SELECT
    prices.year,
    trend_of_prices,
    trend_of_wage,
    CASE
        WHEN (trend_of_prices - trend_of_wage) > 10 THEN 'áno'
        ELSE 'nie'
    END AS result
FROM wages
JOIN prices
    ON wages.year = prices.year
ORDER BY year;