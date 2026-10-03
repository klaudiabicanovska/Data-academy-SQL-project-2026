CREATE TABLE t_klaudia_bicanovska_project_SQL_primary_final AS
WITH years AS (
    SELECT
        cp.payroll_year
    FROM czechia_payroll cp
    INTERSECT
    SELECT
        date_part('year', cp2.date_from)
    FROM czechia_price cp2
)
SELECT
    cp.payroll_year AS year,
    'mzda' AS type,
    cpib.name AS item,
    ROUND(AVG(cp.value::numeric), 2) AS value,
    'CZK' AS unit
FROM czechia_payroll cp
JOIN czechia_payroll_industry_branch cpib
    ON cp.industry_branch_code = cpib.code
WHERE cp.value_type_code = 5958
    AND cp.calculation_code = 200
    AND cp.payroll_year IN (SELECT * FROM years)
GROUP BY cp.payroll_year, cpib.name

UNION ALL

SELECT
    date_part('year', date_from) AS year,
    'cena' AS type,
    cpc.name AS item,
    ROUND(AVG(cp.value::numeric), 2) AS value,
    cpc.price_unit AS unit
FROM czechia_price cp
JOIN czechia_price_category cpc
    ON cp.category_code = cpc.code
WHERE cp.region_code IS NULL
    AND date_part('year', date_from) IN (SELECT * FROM years)
GROUP BY date_part('year', date_from), cpc.name, cpc.price_unit;




