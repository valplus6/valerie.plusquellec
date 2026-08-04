-- VUE DÉTAILLÉE

CREATE OR REPLACE VIEW vw_delinquance_detail AS
SELECT
    f.annee,
    f.code_departement,
    d.nom_departement,
    d.code_region,
    d.nom_region,
    i.id_indicateur,
    i.indicateur,
    i.unite_de_compte,
    i.denominateur_taux,
    f.nombre_faits,
    f.taux_pour_mille,
    f.population,
    f.nombre_logements
FROM fact_delinquance AS f
INNER JOIN dim_departement AS d
    ON f.code_departement = d.code_departement
INNER JOIN dim_indicateur AS i
    ON f.id_indicateur = i.id_indicateur;


-- INDICATEURS NATIONAUX PAR ANNÉE

CREATE OR REPLACE VIEW vw_indicateurs_nationaux AS
SELECT
    annee,
    id_indicateur,
    indicateur,
    unite_de_compte,
    denominateur_taux,
    SUM(nombre_faits) AS nombre_faits_national,
    ROUND(
        1000.0 * SUM(nombre_faits)
        / CASE
            WHEN denominateur_taux = 'logements'
                THEN SUM(nombre_logements)
            ELSE SUM(population)
          END,
        3
    ) AS taux_national_pour_mille
FROM vw_delinquance_detail
GROUP BY
    annee,
    id_indicateur,
    indicateur,
    unite_de_compte,
    denominateur_taux;


-- INDICATEURS RÉGIONAUX PAR ANNÉE

CREATE OR REPLACE VIEW vw_indicateurs_regionaux AS
SELECT
    annee,
    id_indicateur,
    indicateur,
    code_region,
    nom_region,
    denominateur_taux,
    SUM(nombre_faits) AS nombre_faits_region,
    ROUND(
        1000.0 * SUM(nombre_faits)
        / CASE
            WHEN denominateur_taux = 'logements'
                THEN SUM(nombre_logements)
            ELSE SUM(population)
          END,
        3
    ) AS taux_region_pour_mille
FROM vw_delinquance_detail
GROUP BY
    annee,
    id_indicateur,
    indicateur,
    code_region,
    nom_region,
    denominateur_taux;


-- ÉVOLUTION NATIONALE PAR RAPPORT À L'ANNÉE PRÉCÉDENTE

CREATE OR REPLACE VIEW vw_evolution_nationale AS
WITH evolution AS (
    SELECT
        annee,
        id_indicateur,
        indicateur,
        SUM(nombre_faits) AS nombre_faits,
        LAG(SUM(nombre_faits)) OVER (
            PARTITION BY id_indicateur
            ORDER BY annee
        ) AS nombre_faits_annee_precedente
    FROM vw_delinquance_detail
    GROUP BY
        annee,
        id_indicateur,
        indicateur
)

SELECT
    annee,
    id_indicateur,
    indicateur,
    nombre_faits,
    nombre_faits_annee_precedente,
    ROUND(
        100.0
        * (nombre_faits - nombre_faits_annee_precedente)
        / NULLIF(nombre_faits_annee_precedente, 0),
        2
    ) AS evolution_pct
FROM evolution;


-- CLASSEMENT DES DÉPARTEMENTS SELON LE TAUX

CREATE OR REPLACE VIEW vw_classement_departements AS
SELECT
    annee,
    id_indicateur,
    indicateur,
    code_departement,
    nom_departement,
    nombre_faits,
    taux_pour_mille,
    RANK() OVER (
        PARTITION BY annee, id_indicateur
        ORDER BY taux_pour_mille DESC
    ) AS classement
FROM vw_delinquance_detail;


-- PART DE CHAQUE DÉPARTEMENT DANS LE VOLUME NATIONAL

CREATE OR REPLACE VIEW vw_part_nationale_departements AS
SELECT
    annee,
    id_indicateur,
    indicateur,
    code_departement,
    nom_departement,
    nombre_faits,
    ROUND(
        100.0 * nombre_faits
        / NULLIF(
            SUM(nombre_faits) OVER (
                PARTITION BY annee, id_indicateur
            ),
            0
        ),
        2
    ) AS part_nationale_pct
FROM vw_delinquance_detail;


-- ÉVOLUTION ANNUELLE PAR DÉPARTEMENT

CREATE OR REPLACE VIEW vw_evolution_departements AS
WITH evolution_departement AS (
    SELECT
        annee,
        id_indicateur,
        indicateur,
        code_departement,
        nom_departement,
        nombre_faits,
        LAG(nombre_faits) OVER (
            PARTITION BY id_indicateur, code_departement
            ORDER BY annee
        ) AS nombre_faits_annee_precedente
    FROM vw_delinquance_detail
)

SELECT
    annee,
    id_indicateur,
    indicateur,
    code_departement,
    nom_departement,
    nombre_faits,
    nombre_faits_annee_precedente,
    ROUND(
        100.0
        * (nombre_faits - nombre_faits_annee_precedente)
        / NULLIF(nombre_faits_annee_precedente, 0),
        2
    ) AS evolution_pct
FROM evolution_departement;

