# Classification multi-classe sur données complexes à haute dimension

> **Projet de Data Science**
>
> **Problématique :** comment représenter efficacement des données de grande dimension afin d'améliorer les performances d'un modèle de classification multi-classe ?
>
> **Technologies :** R • Analyse statistique • Machine Learning

---

## Contexte

Les algorithmes de Machine Learning sont souvent confrontés à des jeux de données comportant plusieurs centaines de variables.

Toutes ces variables n'apportent pas la même information : certaines sont redondantes, d'autres peu discriminantes. Le choix d'une représentation pertinente des données devient alors une étape essentielle avant toute modélisation.

Ce projet étudie l'influence de différentes représentations d'un même jeu de données sur les performances d'un modèle de classification.

---

## Question étudiée

**Une représentation adaptée des données permet-elle d'améliorer les performances d'une classification multi-classe ?**

Pour répondre à cette question, plusieurs stratégies sont comparées :

- utilisation des variables originales ;
- réduction de dimension par ACP ;
- représentations construites à partir de différents blocs de variables ;
- comparaison des performances obtenues.

---

## Jeu de données

Le jeu de données comprend :

- 649 variables
- plusieurs représentations d'un même objet
- plusieurs classes à prédire

Cette structure permet d'étudier l'apport de différentes représentations dans un contexte de grande dimension.

---

## Démarche

Le projet suit une démarche progressive.

### 1. Comprendre les données

- exploration des variables
- statistiques descriptives
- analyse des corrélations

### 2. Construire des représentations

- ACP globale
- ACP par blocs
- comparaison des espaces factoriels

### 3. Explorer la structure des classes

- Classification Ascendante Hiérarchique
- comparaison des regroupements

### 4. Construire un modèle prédictif

- Random Forest
- validation croisée
- comparaison des performances

---

## Principaux résultats

L'étude montre que le choix de la représentation influence directement la qualité de la classification.

Certaines représentations permettent de mieux séparer les classes et conduisent à des performances supérieures à celles obtenues avec les variables originales.

Le projet met ainsi en évidence l'intérêt d'une étape de réduction ou de transformation des données avant l'apprentissage supervisé.

---

## Illustration

![ACP](images/acp.png)

Les projections factorielles permettent de visualiser la structure des données avant la phase de modélisation.

---

## Compétences démontrées

### Analyse statistique

- Analyse exploratoire
- Analyse en Composantes Principales (ACP)
- Classification Ascendante Hiérarchique (CAH)

### Machine Learning

- Classification multi-classe
- Random Forest
- Validation croisée
- Comparaison de modèles

### Data Science

- Réduction de dimension
- Sélection de représentations
- Évaluation expérimentale

---

## Arborescence

```text
multiclass-classification/
├── README.md
├── codes/
├── data/
├── images/
└── rapport/
```

---

## Reproduire le projet

1. Charger les données.
2. Réaliser l'analyse exploratoire.
3. Construire les différentes représentations.
4. Entraîner les modèles.
5. Comparer les performances.

---

## Conclusion

Ce projet illustre l'importance de la représentation des données dans une démarche de Machine Learning.

Au-delà de la construction d'un modèle prédictif, il montre qu'une analyse statistique préalable peut améliorer la qualité des performances tout en facilitant l'interprétation des résultats.
