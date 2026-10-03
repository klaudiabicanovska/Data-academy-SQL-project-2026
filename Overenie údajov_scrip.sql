SELECT
    region_code,
    COUNT(*)
FROM czechia_price
GROUP BY region_code;

SELECT
    COUNT(value),
    cp.calculation_code,
    COUNT(cp.calculation_code)
FROM czechia_payroll cp
WHERE cp.value_type_code = 5958
GROUP BY calculation_code;