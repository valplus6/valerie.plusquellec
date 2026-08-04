
CREATE DATABASE IF NOT EXISTS crime_dashboard;
USE crime_dashboard;

DROP TABLE IF EXISTS fact_delinquance;
DROP TABLE IF EXISTS dim_temps; 
DROP TABLE IF EXISTS dim_departement;
DROP TABLE IF EXISTS dim_indicateur;

-- Dimension temps
CREATE TABLE dim_temps (
    annee SMALLINT PRIMARY KEY
);

-- Dimension département
CREATE TABLE dim_departement (
    code_departement VARCHAR(3) PRIMARY KEY,
    code_region SMALLINT NOT NULL
);


-- Dimension indicateur
CREATE TABLE dim_indicateur (
    id_indicateur INT AUTO_INCREMENT PRIMARY KEY,
    indicateur VARCHAR(200) NOT NULL UNIQUE,
    unite_de_compte VARCHAR(50) NOT NULL,
    denominateur_taux VARCHAR(20) NOT NULL
);


-- Table de faits
CREATE TABLE fact_delinquance (
    id_fait INT AUTO_INCREMENT PRIMARY KEY,

    annee SMALLINT NOT NULL,
    code_departement VARCHAR(3) NOT NULL,
    id_indicateur INT NOT NULL,

    nombre_faits INT NOT NULL,
    taux_pour_mille DECIMAL(10,3) NOT NULL,
    population INT NOT NULL,
    nombre_logements INT NOT NULL,

    CONSTRAINT fk_fait_temps
        FOREIGN KEY (annee)
        REFERENCES dim_temps(annee),

    CONSTRAINT fk_fait_departement
        FOREIGN KEY (code_departement)
        REFERENCES dim_departement(code_departement),

    CONSTRAINT fk_fait_indicateur
        FOREIGN KEY (id_indicateur)
        REFERENCES dim_indicateur(id_indicateur),

    CONSTRAINT uq_fait
        UNIQUE (
            annee,
            code_departement,
            id_indicateur
        )
);
