SELECT
    type,
    COUNT(*) AS pocet
FROM t_klaudia_bicanovska_project_SQL_primary_final
GROUP BY type;

SELECT
    item,
    COUNT(year)
FROM t_klaudia_bicanovska_project_SQL_primary_final
WHERE type = 'cena'
GROUP BY item;

SELECT
    year
FROM t_klaudia_bicanovska_project_SQL_primary_final
WHERE type = 'cena'
    AND item = 'Jakostní víno bílé'
ORDER BY year;