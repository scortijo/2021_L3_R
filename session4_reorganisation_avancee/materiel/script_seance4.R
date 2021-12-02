# Préparer l'environnement

#1. Spécifier le `working directory`
setwd("Desktop/2021_L3_R/session4_reorganisation_avancee/materiel/")

#2. Charger les librairies
library(tidyverse)


#3. Charger les données `burghardt_et_al_2015_expt1.txt` 
# et mettez les dans expt1

expt1 <-read_tsv("../data/burghardt_et_al_2015_expt1.txt")

# reorganisation avec gather()
expt1_long<-gather(expt1,key="trait", 
       value = "time.in.days",
       days.to.bolt, days.to.flower)

ggplot(expt1_long, aes(x=trait, y=time.in.days,
                       colour=genotype))+
  geom_boxplot()

#  utiliser des pipes %>% 

gather(expt1,key="trait", 
       value = "time.in.days",
      days.to.bolt, days.to.flower) %>% 
ggplot(aes(x=trait, y=time.in.days,
                       colour=genotype))+
  geom_boxplot()

expt1 %>% 
gather(key="trait", 
       value = "time.in.days",
       days.to.bolt, days.to.flower) %>% 
  ggplot(aes(x=trait, y=time.in.days,
             colour=genotype))+
  geom_boxplot()
ggsave("boxplot_days_bolt_flower.jpg")

# Exercice 3 de la séance 4
library(RColorBrewer)

gather(expt1, key="trait", value = "length.mm",
       blade.length.mm, total.leaf.length.mm) %>% 
  ggplot(aes(x=trait, y=length.mm, fill=fluctuation))+
  geom_boxplot(notch=TRUE)+
  scale_fill_brewer(palette = "Set2", 
                    labels=c("Con"="Constant",
                             "Var"="Variable"),
                    name="Fluctuation type") +
  theme_bw()+
  ylab("Length (mm)") +
  scale_x_discrete(labels=c("blade.length.mm"="blade",
                            "total.leaf.length.mm"="leaf"))
  

# Combiner plusieurs tableaux en un  

band_members
band_instruments

full_join(band_members, band_instruments,
          by="name")


## Group by, summarize

expt1 %>%
  group_by(genotype) %>%
  summarise(mean.days.to.flower=mean(days.to.flower, 
                                     na.rm=TRUE))

expt1 %>%
  group_by(genotype, temperature) %>%
  summarise(mean.days.to.flower=mean(days.to.flower, 
                                     na.rm=TRUE),
            median.days.to.flower = median(days.to.flower,
                                           na.rm=TRUE),
            sd.days.to.flower = sd(days.to.flower,
                                   na.rm = TRUE))

expt1 %>%
  group_by(genotype) %>%
  summarise(n.observations = n())

count(expt1, genotype)



ggplot(expt1, aes(genotype, rosette.leaf.num))+
  geom_boxplot()


expt1 %>%
  group_by(genotype) %>%
  summarise(n.obs=n()) %>%
  mutate(n.obs=paste("n=", n.obs)) %>%
  full_join(expt1, by = "genotype") %>%
  ggplot(aes(genotype, rosette.leaf.num))+
  geom_boxplot() +
  geom_text(aes(label=n.obs, x=genotype, y=0))

# Exercice 2 de la partie 2 de la session 5

expt1 %>%
  group_by(genotype) %>%
  summarise(n.obs=n(), 
            median.total.leaf.length=median(total.leaf.length.mm, 
                                            na.rm = TRUE)) %>%
  mutate(n.obs=paste("n=", n.obs)) %>%
  full_join(expt1, by="genotype") %>%
  ggplot(aes(x=genotype, y=total.leaf.length.mm)) +
  geom_violin() +
  geom_text(aes(label=n.obs, x=genotype, y=0)) +
  geom_point(aes(x=genotype, y=median.total.leaf.length),
             color="red")


expt1 %>%
  group_by(genotype, fluctuation) %>%
  summarise(n.obs=n()) %>%
  full_join(expt1, by=c("genotype", "fluctuation")) %>%
  ggplot(aes(genotype, rosette.leaf.num, fill=fluctuation))+
  geom_boxplot() +
  geom_text(aes(label=n.obs, x=genotype, y=0), 
            position = position_dodge(0.8), angle = 45)



