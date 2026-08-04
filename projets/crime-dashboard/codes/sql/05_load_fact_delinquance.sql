-- Alimentaion table de faits
INSERT INTO fact_delinquance (
    annee,
    code_departement,
    id_indicateur,
    nombre_faits,
    taux_pour_mille,
    population,
    nombre_logements
)
SELECT
    s.annee,
    s.Code_departement,
    i.id_indicateur,
    s.nombre,
    s.taux_pour_mille,
    s.insee_pop,
    s.insee_log
FROM staging_delinquance AS s
INNER JOIN dim_indicateur AS i
    ON s.indicateur = i.indicateur;
    
-- Visualisation
SELECT
    f.annee,
    f.code_departement,
    i.indicateur,
    f.nombre_faits,
    f.taux_pour_mille
FROM fact_delinquance AS f
INNER JOIN dim_departement AS d
    ON f.code_departement = d.code_departement
INNER JOIN dim_indicateur AS i
    ON f.id_indicateur = i.id_indicateur
LIMIT 20;

-- Vérifications
SELECT
    (SELECT COUNT(*) FROM staging_delinquance) AS lignes_source,
    (SELECT COUNT(*) FROM fact_delinquance) AS lignes_chargees;
    
SELECT DISTINCT s.indicateur
FROM staging_delinquance AS s
LEFT JOIN dim_indicateur AS i
    ON s.indicateur = i.indicateur
WHERE i.id_indicateur IS NULL;