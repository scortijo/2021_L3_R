**Où:** Salle 109 du batiment 9 (IMAG), au premier étage

**Quand:** 15/10/2020, 14h-17h

**Instructeurs:** 
[Sandra Cortijo](mailto:sandra.cortijo@hotmail.fr), 
[Océane Cassan](mailto:Oceane.CASSAN@cnrs.fr)


### Description

Cette formation va vous apprendre comment exporer des données et réaliser des graphiques sur **R**. 
Les differentes séances sont:
- 14/10/2021 8h-11h15 : organisation des données dans excel, nettoyage des données avec OpenRefine et intro à R (qu'est-ce que R, R studio, une variable, une fonction).
- 21/10/2021 8h-11h15: Réaliser des graphiques en utilisant **ggplot2** sur **R**. 
- 28/10/2021 8h-11h15: Manipulation des données dans **R** ( filtrer, sélectionner, modifier données, extraire statistiques descriptive)
- séance 4 (3h): manipulation des données avancée (combiner fichiers, changer leur organisation (gather et spread), combiner ou séparer colonnes)
- séance 5 (3h):  Notebooks + si temps exemples de combinaison de manipulation de données et graphs (jouer sur les facteurs, ajouter données descriptives dans graph etc)
- séance 6 (3h): mise en pratique de ce qu'on a vu jusque-là: exploration d'un jeu de données (comme un exam blanc)
- séance 7 (1h30): pour revenir sur ce qui n'a pas été compris (à partir de l'exam blanc)



en utilisant **ggplot2**, en partant de données tabulaires (ce que vous pourriez créer en utilisant excel).

Le jeu de données que nous allons utiliser en exemple a été publié par 
[Burghardt .. Schmitt (2015)](https://doi.org/10.1111/nph.13799). 


### Prérequis
Les participants doivent déjà avoir des bases de R et savoir utiliser Rstudio. Si ce n'est pas le cas, veuillez vous inscrire pour une formation R avant de venir à la formation ggplot.



### A faire avant la formation: 
Les participants doivent amener leur ordinateur sur lequel R et R studio sont installés:
[Installer R](https://cran.biotools.fr/);
[Installer Rstudio](https://rstudio.com/products/rstudio/download/)

Dans chaque cas, téléchargez la version pour votre système opérateur (Mac, Windows ou Linux) et installez les programmes normalement.

Vous devez aussi avoir les packages `tidyverse`, `visdat` et `plotly` installés. 
Pour cela:
1. Assurez vous d'avoir acces à internet
2. Ouvrez Rstudio
3. Dans la "console" (panel en haut à gauche), tapez `install.packages(c("tidyverse","visdat", "plotly"))` puis enter
4. Assurez vous que l'installation a fonctionné en tapant `library(tidyverse)` (puis faites la même chose avec `visdat` et `plotly`)
5. Le message affiché doit être similaire à la capture d'écran ci-dessous. Si vous avez un message du type: 
"Error in library(tidyverse): there is no package called 'tidyverse'"
**contactez un des instructeurs avant la formation**.

![capture d'écran d'un installation correcte](installation_package_instructions.png)



### Matériel de la formation


[Scripts et explications](materiel/ggplot_lesson.html)  


[Solution des exercices](materiel/ggplot_exercise_solutions.html)




### Ressources 

[Gallerie de graphiques pouvant être réalisés avec ggplot2](https://www.r-graph-gallery.com/)

[antisèche pour ggplot2](https://rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf)

[antisèche pour la réorganisation de données](module01_data_and_files/materials/data_organisation.md)






