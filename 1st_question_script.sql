WITH trend_wage AS (
    SELECT
        item,
        value - LAG(value) OVER (PARTITION BY item ORDER BY year) AS trend
    FROM t_klaudia_bicanovska_project_SQL_primary_final
    WHERE type = 'mzda'
)
SELECT
    item AS industry,
    CASE
        WHEN MIN(trend) < 0 THEN 'aspoň raz klesala'
        ELSE 'vždy rástla'
    END AS result
FROM trend_wage
GROUP BY item
ORDER BY result DESC;