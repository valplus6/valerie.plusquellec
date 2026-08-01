# Crime Analytics Dashboard

*capture du dashboard en pleine largeur*

## Contexte

Les statistiques de la délinquance constituent un outil essentiel pour le pilotage des politiques publiques de sécurité. Cependant, l’exploitation de ces données reste complexe en raison de leur volume, de leur granularité et de leur évolution dans le temps.

Ce projet simule une mission de Data Analyst consistant à transformer des données ouvertes en un outil d’aide à la décision destiné aux responsables territoriaux.


## Objectifs

Concevoir une solution décisionnelle permettant de :

* suivre l’évolution de la délinquance entre 2016 et 2024 ;
* comparer les territoires (départements et régions) ;
* identifier les catégories d’infractions les plus représentées ;
* construire des KPI exploitables par les décideurs ;
* restituer ces informations au travers d’un tableau de bord interactif.

## Démarche

Données ouvertes (data.gouv.fr)

              │
              ▼
              
 Préparation et nettoyage (Python)
 
              │
              ▼
              
 Modèle décisionnel SQL (schéma en étoile)
 
              │
              ▼
              
 Construction des KPI
 
              │
              ▼
 Dashboard Power BI
 
              │
              ▼
 Aide à la décision

## Dashboard

Quelques captures d’écran :

* vue d’ensemble ;
* carte de France ;
* évolution temporelle ;
* analyse par catégories.

## Principaux KPI

Exemples :

* nombre total de faits enregistrés ;
* évolution annuelle ;
* département le plus exposé ;
* région la plus exposée ;
* principales catégories de délits ;
* évolution des infractions sur neuf années.

## Principaux enseignements

C’est probablement la partie la plus importante.

Par exemple :

* certaines régions concentrent durablement un volume élevé de faits enregistrés ;
* les écarts entre départements d’une même région peuvent être significatifs ;
* certaines catégories d’infractions présentent des tendances plus marquées que d’autres ;
* les visualisations permettent d’identifier rapidement les territoires nécessitant une attention particulière.


## Technologies utilisées

Préparation des données	: Python (pandas, NumPy)

Modélisation décisionnelle :	MySQL

Requêtes analytiques	: SQL

Visualisation	: Power BI

Versioning :	Git

## Structure du projet

crime-dashboard/

README.md

business/

data/

model/

sql/

powerbi/

img/

## Compétences démontrées

* Analyse exploratoire de données
* Nettoyage et préparation de données
* Modélisation décisionnelle (schéma en étoile)
* SQL analytique
* Construction de KPI
* Développement d’un dashboard Power BI
* Storytelling et restitution des résultats

## Source des données

Les données proviennent des bases statistiques de la délinquance enregistrée par la police et la gendarmerie nationales, publiées en Open Data sur la plateforme data.gouv.fr.
