-- Alimentation dim_temps
INSERT INTO dim_temps (annee)
SELECT DISTINCT annee
FROM staging_delinquance
ORDER BY annee;

-- Contrôle dim_temps
SELECT *
FROM dim_temps;

-- Alimentation dim_departement
INSERT INTO dim_departement (
    code_departement,
    code_region
)
SELECT DISTINCT
    Code_departement,
    Code_region
FROM staging_delinquance;

-- Contrôle dim_departement
SELECT COUNT(*) AS nb_departements
FROM dim_departement;

-- Alimentaion dim_indicateur
INSERT INTO dim_indicateur (
    indicateur,
    unite_de_compte,
    denominateur_taux
)
SELECT DISTINCT
    indicateur,
    unite_de_compte,
    CASE
        WHEN indicateur = 'Cambriolages de logement'
            THEN 'logements'
        ELSE 'population'
    END
FROM staging_delinquance
ORDER BY indicateur;


-- Contrôle dim_indicateur
SELECT *
FROM dim_indicateur
ORDER BY id_indicateur; 
