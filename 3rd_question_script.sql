WITH change_of_prices AS (
    SELECT
        year,
        item AS type_of_product,
        (AVG(value) - LAG(AVG(value)) OVER (PARTITION BY item ORDER BY year))
            / LAG(AVG(value)) OVER (PARTITION BY item ORDER BY year) * 100 AS percentage_change
    FROM t_klaudia_bicanovska_project_SQL_primary_final
    WHERE type = 'cena'
    GROUP BY item, year
)
SELECT
    type_of_product,
    ROUND(AVG(percentage_change), 2) AS avg_percentage_change
FROM change_of_prices
GROUP BY type_of_product
ORDER BY avg_percentage_change ASC;