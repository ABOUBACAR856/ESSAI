
getwd()

Matable <- read.table("/Users/inestej/Documents/2018/Matable.csv",header=T,sep=";",dec=",")

dim(Matable)

print("nombre de lignes"); dim(Matable)[1]
print("nombre de colonnes"); dim(Matable)[2] ; length(Matable)

# Retrouver le nom des variables :
names(Matable)

# La structure de la base de données
str(Matable)
head(Matable)
head(Matable, 35)

tail(Matable) # Indique les six dernières lignes
tail(Matable, 2) #Indique les deux dernières lignes

# La fonction paste() permet de concaténer des chaînes de caractères :
Ident <- paste("VRS",c(1:31), sep="---")
row.names(Matable) <- Ident
head(Matable)

row.names(Matable) <- NULL
head(Matable)

View(Matable)
Matable$Sexe1
attach(Matable)
Poids
Sexe
Matable[3,]

Matable[,3]

names(Matable)[Matable$Sexe] <- "CODSEX"
names(Matable)[3] <- "POIDS"

Matable[3,]

names(Matable)[c(2,4)] <- c("SEXE","GROUPAGE")
Matable[3,]

Nomvar <- names(Matable) # pour sauvegarder.
names(Matable) <- NULL # pour effacer.
View(Matable) # pour voir les modifications de l'objet.
names(Matable) <- Nomvar # pour réattribuer les noms.
View(Matable) # pour voir les modifications de l'objet.

Matable[3,4]

Matable[20:25,1:3]

Matable[c(20,25),c(1,3)]

# Autre façon d'extraire toutes les variables ssauf la première
Matable2 <- Matable[1:20,-1]

# Cette commande extrait da,s un objet R les enregistrements de 1 à 20 pour les variables 1, 3 et 4.
Matable3 <- Matable[1:20,c(1,3,4)]

# Cette commande extrait dans un objet R tous les enregistrements sauf le 20ème, et toutes les variables sauf la 1ère et la 3ème.
Matable4 <- Matable[-20,c(-1,-3)]

# Cette fonction extrait des données pour les sujets de sexe masculin codé 1 :
Matable5 <- subset(Matable, Matable$CODSEX==1)

# Cette commande extrait les données pour les femmes :
Matable6 <- subset(Matable, Matable$SEXE=="Femme")

# On peut également faire une extraction selon un critère avec `[]` :
Matable7 <- Matable[Matable$POIDS<20,]

# Cette commande crée une variable binaire codée (0 ou 1) qui prend la valeur 1 si le poids est supérieur ou égal à 20 et 0 sinon :
Matable$POIDS20 <- ifelse(Matable$POIDS >= 20,1,0)

# La fonction `transform()` permet d'ajouter des variables du tableau :
Matable <- transform(Matable,POIDSENG=POIDS*1000)

Matable <- transform(Matable,POIDS15=ifelse(POIDS<15,1,0))
#cette commande ajoute une variable `POIDS15` qui prend la valeur 1 si le poids est inférieur à 15 et 0 dans les autres cas.

# La fonction `cut()`permet d'effectuer des regroupements par classe de variables quantitatives.
Matable$GROUPOIDS <- cut(Matable$POIDS,breaks=c(9,15,20,25))
View(Matable)
str(Matable)

#Seance5
attach(Matable)
mode(GROUPOIDS)

Indic <- c(1, 3, 5)

for(i in 1:3) {Matable[,Indic[i]] <- factor(Matable[,Indic[i]])}

str(Matable)

# Créer une valeur aberrante :
Matable[20,3] <- Matable[20,6]

Result <- boxplot(Matable$POIDS)
str(Matable$POIDS)
# Les différents composants de `Result` :
attributes(Result)

which(Matable==20, arr.ind=T)
which(Matable > 24000, arr.ind=T)

which(is.na(Matable), arr.ind=T)

fix(Matable)

Matable <- edit(Matable)

Matable10 <- rbind(Matable5, Matable6)

Fievre <- rbinom(31, size=1, prob=0.25)
Matable <- cbind(Matable, Fievre)

names(Matable)[10] <- "FIEVRE"

Toux <- rbinom(31, size=1, prob=0.28)
Matable11 <- data.frame(Toux)
row.names(Matable11) <- Ident[31:1]

Matable <- merge(Matable, Matable11, by="row.names")

names(Matable)[11] <- "TOUX"

#View(Matable)
#install.packages("tidyverse")
library(tidyverse)
