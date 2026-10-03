WITH gdp AS (
    SELECT
        year,
        ROUND((average_gdp - LAG(average_gdp) OVER (ORDER BY year))
            / LAG(average_gdp) OVER (ORDER BY year) * 100, 2) AS trend_of_gdp
    FROM t_klaudia_bicanovska_project_SQL_secondary_final
    WHERE country = 'Czech Republic'
),
wages AS (
    SELECT
        year,
        ROUND((AVG(value) - LAG(AVG(value)) OVER (ORDER BY year))
            / LAG(AVG(value)) OVER (ORDER BY year) * 100, 2) AS trend_of_wage,
        ROUND((LEAD(AVG(value)) OVER (ORDER BY year) - AVG(value))
            / AVG(value) * 100, 2) AS next_year_trend_wage
    FROM t_klaudia_bicanovska_project_SQL_primary_final
    WHERE type = 'mzda'
    GROUP BY year
),
prices AS (
    SELECT
        year,
        ROUND((AVG(value) - LAG(AVG(value)) OVER (ORDER BY year))
            / LAG(AVG(value)) OVER (ORDER BY year) * 100, 2) AS trend_of_prices,
        ROUND((LEAD(AVG(value)) OVER (ORDER BY year) - AVG(value))
            / AVG(value) * 100, 2) AS next_year_trend_prices
    FROM t_klaudia_bicanovska_project_SQL_primary_final
    WHERE type = 'cena'
    GROUP BY year
)
SELECT
    g.year,
    trend_of_prices,
    next_year_trend_prices,
    trend_of_wage,
    next_year_trend_wage,
    trend_of_gdp,
    CASE
        WHEN trend_of_gdp > 0 AND trend_of_wage > 0 AND next_year_trend_wage > 0 THEN 'rast v rovnakom aj následujúcom roku'
        WHEN trend_of_gdp > 0 AND trend_of_wage > 0 THEN 'rast v rovnakom roku'
        WHEN trend_of_gdp > 0 AND next_year_trend_wage > 0 THEN 'rast v následujúcom roku'
        ELSE 'HDP neovplyvnilo mzdu'
    END AS gdp_inpact_on_wages,
    CASE
        WHEN trend_of_gdp > 0 AND trend_of_prices > 0 AND next_year_trend_prices > 0 THEN 'rast v rovnakom aj následujúcom roku'
        WHEN trend_of_gdp > 0 AND trend_of_prices > 0 THEN 'rast v rovnakom roku'
        WHEN trend_of_gdp > 0 AND next_year_trend_prices > 0 THEN 'rast v následujúcom roku'
        ELSE 'HDP neovplyvnilo cenu'
    END AS gdp_inpact_on_prices
FROM gdp g
JOIN wages w
    ON g.year = w.year
JOIN prices p
    ON p.year = g.year
ORDER BY g.year;