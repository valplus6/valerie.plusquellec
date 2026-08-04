USE crime_dashboard;

DROP TABLE IF EXISTS staging_delinquance;

-- création d'une table de chargement
CREATE TABLE staging_delinquance (
	code_departement VARCHAR(3),
	code_region SMALLINT,
	annee SMALLINT,   
    indicateur VARCHAR(100),
    unite_de_compte VARCHAR(50),
	nombre INT,
    taux_pour_mille DECIMAL(10,3),
    insee_pop INT,
    insee_pop_millesime SMALLINT,
    insee_log INT,
    insee_log_millesime SMALLINT
);

-- importation du csv
LOAD DATA INFILE
'/var/lib/mysql-files/delinquance_metropole_mysql.csv'
INTO TABLE staging_delinquance
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    code_departement,
    code_region,
    annee,
    indicateur,
    unite_de_compte,
    nombre,
    taux_pour_mille,
    insee_pop,
    insee_pop_millesime,
    insee_log,
    insee_log_millesime
);

-- Visualisation après importation
SELECT *
FROM staging_delinquance
LIMIT 10;

-- Vérification après importation du nombre de ligne
SELECT COUNT(*) AS nombre_lignes
FROM staging_delinquance;

-- contrôle des principales colonnes
SELECT
    COUNT(DISTINCT Code_departement) AS nb_departements,
    COUNT(DISTINCT Code_region) AS nb_regions,
    COUNT(DISTINCT annee) AS nb_annees,
    COUNT(DISTINCT indicateur) AS nb_indicateurs
FROM staging_delinquance;
