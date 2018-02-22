getwd()

Matable <- read.table("/Users/inestej/Documents/2018/Matable.csv",header=T,sep=";",dec=",")

median(Matable$Poids, na.rm=T)

quantile(Matable$Poids, na.rm=T)
#quantile(Matable$Poids, probs = seq(0, 1, 0.1), na.rm=T)
#quantile(Matable$Poids, 0.2, na.rm=T)

mean(Matable$Poids, na.rm=T)

min(Matable$Poids, na.rm=T)

max(Matable$Poids, na.rm=T)

Etendue <- max(Matable$Poids)-min(Matable$Poids)
Etendue

IntQuart <- quantile(Matable$Poids)[4]-quantile(Matable$Poids)[2]
IntQuart

var(Matable$Poids, na.rm=T)

sd(Matable$Poids, na.rm=T)

t.test(Matable$Poids, conf.level=0.95)$conf.int

summary(Matable$Poids)

head(Matable)

summary(as.factor(Matable$Sexe))

table(Matable$Tranchage)

summary(Matable$Sexe1)

Table1 <- table(Matable$Tranchage)
prop.table(Table1)

round(prop.table(Table1)*100, 1)

margin.table(Table1)

Table1 <- table(Matable$Tranchage)
cumsum(Table1[c(1,3,2)])

Variable <- Matable$Tranchage
Effectifs <- table(Variable)
Proportion <- round(prop.table(Effectifs)*100, 1)
E.cumul <- cumsum(Effectifs[c(1,3,2)])
P.cumul <- cumsum(Proportion[c(1,3,2)])

Age1 <- c(Effectifs[2], Proportion[2], E.cumul[3], P.cumul[3])
Age2 <- c(Effectifs[3], Proportion[3], E.cumul[2], P.cumul[2])
Age3 <- c(Effectifs[1], Proportion[1], E.cumul[1], P.cumul[1])

Age1

TableAge <- rbind(Age1, Age2, Age3)
colnames(TableAge) <- c("Eff", "%", "Eff Cum", "(% cum)")
rownames(TableAge) <- c("0-4 ans", "5-9 ans", ">=10ans")
TableAge

prop.test(table(Matable$Sexe))$conf.int

# Création de l'objet Mesure1
Mesure1 <- runif(30,20,35)

# Calculer la médiane et la moyenne
summary(Mesure1)

# Calculer l'écart-type
sd(Mesure1)

# Calculer l'intervalle de confiance de la moyenne
t.test(Mesure1)$conf.int

# Création de l'objet Mesure2
Mesure2 <- runif(100,20,35)

# Calculer la médiane et la moyenne
summary(Mesure2)

# Calculer l'écart-type
sd(Mesure2)

# Calculer l'intervalle de confiance de la moyenne
t.test(Mesure2)$conf.int

# Création de l'objet Caracter1
Caracter1 <- rbinom(110, 1, 0.15)

# Création de l'objet Caracter2
Caracter2 <- rbinom(110, 2, 0.40)

# Calcul des effectifs de Caracter1
A1 <- table(Caracter1)
A1
prop.table(A1)
# Calcul des pourcentages de Caracter1
P1 <- round(prop.table(A1)*100, 0)
P1

# Table pour Caracter1
Matable1 <- cbind(A1[1], P1[1], A1[2], P1[2], margin.table(A1), 100)
colnames(Matable1) <- c("Eff1", "%", "Eff2", "%", "Total", "%")
rownames(Matable1) <-""
Matable1

# Idem pour les effetifs de Caracter2
# Calcul des effectifs de Caracter2
A2 <- table(Caracter2)
A2
prop.table(A2)
# Calcul des pourcentages de Caracter1
P2 <- round(prop.table(A2)*100, 0)
P2

# Table pour Caracter2
Matable2 <- cbind(A2[1], P2[1], A2[2], P2[2],A2[3], P2[3], margin.table(A2), 100)
colnames(Matable2) <- c("Eff1", "%", "Eff2", "%", "Eff3", "%", "Total", "%")
rownames(Matable2) <-""
Matable2

library(ggplot2)
library(tidyverse)
ggplot2::mpg
summary(mpg)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(diamonds, aes(carat, price)) +
  geom_hex()
ggsave("diamonds.pdf")

write_csv(diamonds, "diamonds.csv")
