# Analyse de la qualité des cafés
> **Projet d'analyse de données multidimensionnelles**
>
> **Objectif :** identifier des profils de cafés à partir de leurs caractéristiques de production et étudier leurs liens avec la qualité sensorielle.
>
> **Technologies :** R • FactoMineR • missMDA • dplyr • ggplot2

---

## Objectif du projet

Les cafés de spécialité sont évalués selon de nombreux critères : origine géographique, variété botanique, méthode de traitement, altitude de culture, humidité des grains, défauts et notes sensorielles.

L'objectif de ce projet est de répondre à la question suivante :

> **Les caractéristiques de production permettent-elles d'expliquer les différences de qualité observées entre les cafés ?**

Pour répondre à cette problématique, une analyse exploratoire, une classification et une analyse factorielle sont réalisées. rapport.pdf

---

## Jeu de données

Les données proviennent du **Coffee Quality Institute (CQI)**.

Le jeu de données comprend :

- **207 cafés**
- **21 variables**
  - caractéristiques géographiques
  - méthodes de production
  - notes sensorielles
  - défauts observés sur les grains
- variables quantitatives et qualitatives. rapport.pdf

---

## Préparation des données

Plusieurs traitements ont été réalisés avant l'analyse :

- suppression des variables constantes ;
- traitement des valeurs manquantes par **imputation AFDM** ;
- transformation logarithmique des variables très asymétriques ;
- standardisation des variables quantitatives ;
- distinction entre variables **actives** et **illustratives** selon leur rôle dans l'analyse.  [oai_citation:3‡rapport.pdf](sediment://file_00000000d56481f48367ee1fcef55398)

---

## Analyse exploratoire

L'étude met notamment en évidence :

- de fortes corrélations entre plusieurs critères sensoriels ;
- une relation négative entre les défauts observés et la qualité sensorielle ;
- une influence de certaines méthodes de traitement sur le score global obtenu par les cafés. rapport.pdf

*Illustration suggérée : matrice de corrélation ou boxplot du score selon la méthode de traitement.*

---

## Méthodologie

La classification repose sur une approche adaptée aux données mixtes.

Pipeline utilisé :

1. Analyse Factorielle des Données Mixtes (AFDM)
2. Conservation des axes expliquant plus de 90 % de l'inertie
3. Classification Ascendante Hiérarchique (méthode de Ward)
4. Consolidation des groupes par k-means (centres mobiles)

Cette démarche permet d'obtenir une typologie robuste des cafés étudiés. rapport.pdf

---

## Résultats

La méthode identifie **5 profils de cafés** présentant des caractéristiques de production distinctes.

La partition est fortement liée :

- au pays d'origine ;
- à la variété botanique ;
- à l'altitude de culture ;

et, dans une moindre mesure :

- à la méthode de traitement ;
- au taux d'humidité ;
- aux défauts des grains ;
- aux notes sensorielles. rapport.pdf

Quelques exemples :

- **Classe 1** : cafés d'Amérique centrale, altitude élevée, davantage de défauts et notes sensorielles plus faibles. rapport.pdf
- **Classe 2** : cafés principalement de Taïwan et d'Hawaï, peu de défauts et meilleures évaluations sensorielles. rapport.pdf
- **Classe 4** : cafés d'Éthiopie cultivés à très haute altitude, excellents scores en acidité et en corps. rapport.pdf

---

## Compétences mises en œuvre

### Analyse de données

- Analyse exploratoire
- Corrélations
- Sélection de variables
- Gestion des données manquantes

### Statistiques multidimensionnelles

- Analyse Factorielle des Données Mixtes (AFDM)
- Classification Ascendante Hiérarchique (CAH)
- Consolidation par k-means
- Interprétation des classes

### R

- FactoMineR
- missMDA
- dplyr
- ggplot2

---

## Structure du projet

```text
Coffee-Quality/
├── README.md
├── code.Rmd
├── data/
└── rapport.pdf
```

---

## Reproduire le projet

1. Installer les packages R nécessaires.
2. Ouvrir `code.Rmd`.
3. Exécuter les différentes étapes :
   - préparation des données ;
   - analyses exploratoires ;
   - AFDM ;
   - classification ;
   - interprétation des résultats.
