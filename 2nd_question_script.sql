WITH price AS (
    SELECT
        year,
        item AS type_of_product,
        value AS price_of_product
    FROM t_klaudia_bicanovska_project_SQL_primary_final
    WHERE type = 'cena'
        AND item IN ('Chléb konzumní kmínový', 'Mléko polotučné pasterované')
        AND year IN (2006, 2018)
),
wage AS (
    SELECT
        year,
        AVG(value) AS average_wage
    FROM t_klaudia_bicanovska_project_SQL_primary_final
    WHERE type = 'mzda'
        AND year IN (2006, 2018)
    GROUP BY year
)
SELECT
    price.year,
    type_of_product,
    ROUND(average_wage / price.price_of_product, 2) AS amount_affordable_per_wage
FROM price
JOIN wage
    ON price.year = wage.year;