
-- RÉFÉRENTIEL GÉOGRAPHIQUE MÉTROPOLITAIN
-- 13 régions et 96 départements


USE crime_dashboard;

ALTER TABLE dim_departement
ADD COLUMN nom_departement VARCHAR(100),
ADD COLUMN nom_region VARCHAR(100);

CREATE TABLE staging_departement (
    code_departement VARCHAR(3),
    code_region SMALLINT,
    nom_departement VARCHAR(100)
);

DROP TABLE IF EXISTS departement_ref;
DROP TABLE IF EXISTS region_ref;

CREATE TABLE region_ref (
    code_region SMALLINT PRIMARY KEY,
    nom_region VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE departement_ref (
    code_departement VARCHAR(3) PRIMARY KEY,
    nom_departement VARCHAR(100) NOT NULL,
    code_region SMALLINT NOT NULL,
    CONSTRAINT fk_departement_ref_region
        FOREIGN KEY (code_region)
        REFERENCES region_ref(code_region)
);


-- Insertion des 13 régions métropolitaines

INSERT INTO region_ref (code_region, nom_region) VALUES
(11, 'Île-de-France'),
(24, 'Centre-Val de Loire'),
(27, 'Bourgogne-Franche-Comté'),
(28, 'Normandie'),
(32, 'Hauts-de-France'),
(44, 'Grand Est'),
(52, 'Pays de la Loire'),
(53, 'Bretagne'),
(75, 'Nouvelle-Aquitaine'),
(76, 'Occitanie'),
(84, 'Auvergne-Rhône-Alpes'),
(93, 'Provence-Alpes-Côte d''Azur'),
(94, 'Corse');


-- Insertion des 96 départements métropolitains

INSERT INTO departement_ref (
    code_departement,
    nom_departement,
    code_region
) VALUES
('01', 'Ain', 84),
('02', 'Aisne', 32),
('03', 'Allier', 84),
('04', 'Alpes-de-Haute-Provence', 93),
('05', 'Hautes-Alpes', 93),
('06', 'Alpes-Maritimes', 93),
('07', 'Ardèche', 84),
('08', 'Ardennes', 44),
('09', 'Ariège', 76),
('10', 'Aube', 44),
('11', 'Aude', 76),
('12', 'Aveyron', 76),
('13', 'Bouches-du-Rhône', 93),
('14', 'Calvados', 28),
('15', 'Cantal', 84),
('16', 'Charente', 75),
('17', 'Charente-Maritime', 75),
('18', 'Cher', 24),
('19', 'Corrèze', 75),
('2A', 'Corse-du-Sud', 94),
('2B', 'Haute-Corse', 94),
('21', 'Côte-d''Or', 27),
('22', 'Côtes-d''Armor', 53),
('23', 'Creuse', 75),
('24', 'Dordogne', 75),
('25', 'Doubs', 27),
('26', 'Drôme', 84),
('27', 'Eure', 28),
('28', 'Eure-et-Loir', 24),
('29', 'Finistère', 53),
('30', 'Gard', 76),
('31', 'Haute-Garonne', 76),
('32', 'Gers', 76),
('33', 'Gironde', 75),
('34', 'Hérault', 76),
('35', 'Ille-et-Vilaine', 53),
('36', 'Indre', 24),
('37', 'Indre-et-Loire', 24),
('38', 'Isère', 84),
('39', 'Jura', 27),
('40', 'Landes', 75),
('41', 'Loir-et-Cher', 24),
('42', 'Loire', 84),
('43', 'Haute-Loire', 84),
('44', 'Loire-Atlantique', 52),
('45', 'Loiret', 24),
('46', 'Lot', 76),
('47', 'Lot-et-Garonne', 75),
('48', 'Lozère', 76),
('49', 'Maine-et-Loire', 52),
('50', 'Manche', 28),
('51', 'Marne', 44),
('52', 'Haute-Marne', 44),
('53', 'Mayenne', 52),
('54', 'Meurthe-et-Moselle', 44),
('55', 'Meuse', 44),
('56', 'Morbihan', 53),
('57', 'Moselle', 44),
('58', 'Nièvre', 27),
('59', 'Nord', 32),
('60', 'Oise', 32),
('61', 'Orne', 28),
('62', 'Pas-de-Calais', 32),
('63', 'Puy-de-Dôme', 84),
('64', 'Pyrénées-Atlantiques', 75),
('65', 'Hautes-Pyrénées', 76),
('66', 'Pyrénées-Orientales', 76),
('67', 'Bas-Rhin', 44),
('68', 'Haut-Rhin', 44),
('69', 'Rhône', 84),
('70', 'Haute-Saône', 27),
('71', 'Saône-et-Loire', 27),
('72', 'Sarthe', 52),
('73', 'Savoie', 84),
('74', 'Haute-Savoie', 84),
('75', 'Paris', 11),
('76', 'Seine-Maritime', 28),
('77', 'Seine-et-Marne', 11),
('78', 'Yvelines', 11),
('79', 'Deux-Sèvres', 75),
('80', 'Somme', 32),
('81', 'Tarn', 76),
('82', 'Tarn-et-Garonne', 76),
('83', 'Var', 93),
('84', 'Vaucluse', 93),
('85', 'Vendée', 52),
('86', 'Vienne', 75),
('87', 'Haute-Vienne', 75),
('88', 'Vosges', 44),
('89', 'Yonne', 27),
('90', 'Territoire de Belfort', 27),
('91', 'Essonne', 11),
('92', 'Hauts-de-Seine', 11),
('93', 'Seine-Saint-Denis', 11),
('94', 'Val-de-Marne', 11),
('95', 'Val-d''Oise', 11);



-- ENRICHISSEMENT DE dim_departement


-- À exécuter uniquement si ces colonnes n'existent pas encore.
-- ALTER TABLE dim_departement
--     ADD COLUMN nom_departement VARCHAR(100),
--     ADD COLUMN nom_region VARCHAR(100);

UPDATE dim_departement AS d
INNER JOIN departement_ref AS dr
    ON d.code_departement = dr.code_departement
INNER JOIN region_ref AS r
    ON dr.code_region = r.code_region
SET
    d.nom_departement = dr.nom_departement,
    d.code_region = dr.code_region,
    d.nom_region = r.nom_region;

-- CONTRÔLES

SELECT COUNT(*) AS nb_regions
FROM region_ref;

SELECT COUNT(*) AS nb_departements
FROM departement_ref;

SELECT
    d.code_departement,
    d.nom_departement,
    d.code_region,
    d.nom_region
FROM dim_departement AS d
ORDER BY d.code_departement;

SELECT *
FROM dim_departement
WHERE nom_departement IS NULL
   OR nom_region IS NULL;
