# SOLUTION DE L EXAMEN : introduction a la bioinformatique pour la biologie vegetale


# ------------ Question 0 ------------------

# Chargez les librairies dont vous aurez besoin

library(tidyverse)
library(visdat)

# Definissez le working directory de R pour etre dans le dossier de l'examen.

getwd() #regarder ou est le repertoire de travail
setwd("~/Desktop/ExamL3_2021_V2_OC_SC_solution/") #changer le repertoire de travail

# Chargez le fichier DOG1_Expression_clean.txt (qui est dans le dossier /data), 
# qui contient les donnees d'expression, dans R et sauvez le dans un objet.

expt1 <- read_tsv("data/DOG1_Expression_clean.txt")

View(expt1)

# ------------ Question 1 ------------------

# Y a-t-il des valeurs manquantes dans les donnees? Comment le voyez vous?

vis_dat(expt1)

# Il n y a pas de donnees manquantes dans ce tableau. 
# En utilisant la fonction vis_dat, les donnees manquantes apparaissent en gris.
# Nous ne detectons aucune zone grise dans la figure, il n'y a donc pas de donnees manquantes. 


# ------------ Question 2 ------------------

# Combien y-a-t-il d'ecotypes differents? Donnez la liste des ecotypes

unique(expt1$Ecotype) #nous donne la liste des differentes variables contenues dans la colonne ecotype

# Il y a 12 écotypes: 
# Bil-7, Ct-1, Cvi-0, Edi-0, Fei-0, Ge-0, Lov-5, 
# Mir-0, Pro-0, Sf-2, Tamm-27 et Ull-2-3.

# ------------ Question 3 ------------------

# Faites une figure representant les niveaux d'expression des deux gènes
# (DOG1 et NCED9) suivant le stade de développement des siliques, 
# l'origine géographique, et les conditions de maturation des graines, 
# et ce uniquement pour des plantes ayant poussé en jours courts a temperature elevee. 

expt1 %>%
  filter(SeedMaturation == "SW")%>% #garder uniquement les plantes ayant la condition de maturation SW
  gather("gene","expression_value",DOG1_normControl,NCED9_normControl)%>% #passer le tableau au format long
  ggplot(aes(x=Geography, y=expression_value, colour = SiliqueDevelopmentalStage))+ #creation du graphique
  geom_boxplot()+ #forme du graphique
  facet_grid(.~gene) #facet en fonction des genes


# Formulez une interpretation complete de ce que nous apprend  cette figure quant a 
# l'influence de la geographie, et du stade de developpement sur l'expression de 
# nos genes d'interets.


# La geographie ne semble pas avoir un impact sur l'expression du gene NCED9. 
# En revanche, au debut du stade de developpement de la silique, le gene DOG1 est moins exprime au Nord qu au Sud.
# Les 2 genes semblent plus exprimes à la fin du developpement de la silique qu au début, quelque soit la geographie.


# ------------ Question 4 ------------------

# Pour verifier si cet effet est observe pour tous les genotypes, mesurez la moyenne de 
# l'expression normalisee de DOG1 aux deux stades de developpement de la silique 
# pour chaque genotypes, et ce uniquement pour des plantes ayant pousse en jours 
# long a temperature elevee.

expt2 <-expt1 %>% #creation d un nouvel objet pour voir en entier le tableau contenant les moyennes
  filter(SeedMaturation == "SW") %>%
  group_by(Ecotype, SiliqueDevelopmentalStage) %>% # permet de grouper les plantes par Ecotype et SiliqueDevelopmentalStage
  summarise(mean.DOG1.expression = mean(DOG1_normControl)) #permet d'obtenir la moyennne de l'expression de DOG1 pour chaque groupe

View(expt2)

# Observez-vous une difference d'expression en fonction du stade de developpement de 
# la silique pour tous les ecotypes?

# Oui en moyenne, le gene DOG1 est moins exprime dans les siliques etant au début du stade 
# de developpement, par rapport a celles etant a la fin du stade de developpement


# Y a-t-il des ecotypes pour lesquels la difference est faible? Si oui, lesquels? 

# Oui, la difference est faible pour l'écotype Sf-2. 
# L'expression moyenne de DOG1 est de -0.5562486 pour le stade de developpement "early", 
# contre -0.7920263 pour le stade "late".

# ------------ Question 5 ------------------

# En utilisant l application [ePlant](https://bar.utoronto.ca/eplant/) de BAR de 
# l'Universite de Toronto trouvez les informations suivantes sur le gene DOG1 :


# Quel est le numero unique de DOG1 (du format AT1G12345)?

# Le numero unique de DOG1 est AT5G45830.


# Dans quel tissu de la plante est ce que le gene DOG1 est exprime? 
# Faites un screenshot de la figure de ePlant qui vous a permis de repondre 
# et envoyez le par mail en meme temps que votre script R.

# Le gène DOG1 est exprimé dans les graines, en particulier au stade 9 (cotylédons) 
# qui est un stade tardif. Cette observation est en accord avec les résultats des 
# questions 3 et 4 montrant que DOG1 est plus exprimé à un stade tardif du développement 
# de la graine pour la grande majorité des écotypes étudiés. 
# Voir l'image data/capture_d_ecran_eplant.png
