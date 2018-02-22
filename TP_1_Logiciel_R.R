## Seance numéro 2

sum(5,6)

C1 <- 5
C2 = 6
7 -> C3
C1; C2; C3;

# Ce symbole sert à mettre du commentaire
C1

print(C2); print(C3)

5/3

320 + 120

C1 + C2

sum(C1,C2)

"ah !" -> A1
A.1 <- "Hello Word"
A.2 <- "Bonjour"
A.1; A.2

paste(A.1,"Utilisateurs de R a l ESSAI", sep="--")

# La liste des objets crées dans la console sont obtenus par :
ls()

rm(A1)

ls()

# Pour supprimer l'ensemble des objets de la console, utilisez :
rm(list=ls())

ls()

#help(history)

#?sum

# Pour connaître la liste des extensions lancées dans votre session :
search()

# Pour appeler une extension dans la console, utiliser la fonction :
library(nnet)

# w pour working et d pour directory
getwd()

#Pour citer R :
citation()

#Pour quitter R : q()

# Création de l'objet Prenom
Prenom <- "Salah"

# Création de l'objet Nom
Nom <- "Ben Amar"

# Création de l'objet Identite
Identite <- paste(Nom,Prenom,sep=',')

# Affichage du contenu de l'objet Identite
Identite

# Création de l'objet Femme
Femme <- 257836

# Création de l'objet Homme
Homme <- 247643

# Création de l'objet Population
Population <- sum(Femme,Homme)
# ou
Population <- Femme+Homme

# Afficher le contenu de l'objet Population
print(Population)

# Création de l'objet Sexratio
Sexratio <- Homme/Femme

# Affichage de l'objet Sexratio
print(Sexratio)

# Création de l'objet Dcfemme
Dcfemme <- 236

# Création de l'objet Dchomme
Dchomme <- 328

# Création de l'objet Dctotal pour la somme des décès
Dctotal <- Dcfemme+Dchomme
# ou
DcTotal <- sum(Dcfemme,Dchomme)

# Création de l'objet Mortfemme pour mortalité des femmes
Mortfemme <- (Dcfemme/Femme)*1000

# Création de l'objet Morthomme pour mortalité des hommes
Morthomme <- (Dchomme/Homme)*1000

# Création de l'objet Mortpop pour mortalité de la population
Mortpop <- (Dctotal/Population)*1000

# Affichage du contenu des objets sur la mortalité
print(Mortfemme); print(Morthomme); print(Mortpop)

## Seance numéro 3

# Vecteur
Age <- c(2,4,5,10,8,7,12,11,3,5,6)
#Age <- c(2,4,5,10,8,7,12,11,3,5,6, bycol=TRUE)
mode(Age)
#help(c)
Age

# Matrice
Chiffre <- c(1:15)
Matrice.1 <- matrix(Chiffre,ncol=3)
Matrice.2 <- matrix(Chiffre,ncol=3,byrow=TRUE)
print(Matrice.1); print(Matrice.2)

# Liste
Maliste <- list(Age, Matrice.1, Matrice.2)
print(Maliste)

# Tableau ou data frame
Sexe <- rep(c("M","F"), c(16,14))
print(Sexe)

Age <- rep(seq(10,14.5,by=0.5),3)
Age

Matable <- data.frame(Sexe, Age)
#View(Matable)
print(Matable)

str(Matable)

Age <- c(2,4,5,10,8,7,12,11,3,5,6)
print(Age)
Age[Age>=5 & Age<10]

Age[Age!=5]

Age[4]

# Les attributs spéciaux
Parcelle <- letters[1:10]; print(Parcelle)

Rayon <- c(5,6,7,8,12,4,3,10,8,9)
Aire <- pi*Rayon^2; print(Aire)

Aire[Parcelle=="e"]

Limite.1 <- ifelse(Aire<100,0,1)
Limite.1

Limite.2 <- NULL
for(i in 1:10){
    if(Aire[i]<100){Limite.2[i] <- 0}else{Limite.2[i] <-1}}
Limite.2



Limite.1==Limite.2

# Exemple d'estimation d'une douleur lors d'une étude :
Niveau <- rep(c("Supportable","Faible","Intense","Forte","Absente"), c(5,16,18,7,22))

summary(Niveau)

print(Niveau)

Niveau.1 <- ordered(rep(c("Supportable","Faible","Intense", "Forte","Absente"),c(5,16,18,7,22)),levels=c("Absente", "Faible","Supportable","Forte","Intense"))
summary(Niveau.1)

# Si nous codons l'estimation de la douleur en chiffres :
Niveau.A <- rep(c(3,2,5,4,1),c(5,16,18,7,22))
print(Niveau.A)
summary(Niveau.A)

Niveau.B <- factor(rep(c(3,2,5,4,1),c(5,16,18,7,22)))
print(Niveau.B)
summary(Niveau.B)
table(Niveau.B)

Niveau.C <- ordered(rep(c(3,2,5,4,1),c(5,16,18,7,22)), levels=c(5,4,3,2,1))
summary(Niveau.C)

# Convertir les données en date reconnue par R :
Dcalend.1 <- c("17/09/92","27/02/92","14/01/92","28/02/92")
Dcalend.1

Dcalend.11 <- as.Date(Dcalend.1,"%d/%m/%y")
Dcalend.11

Dcalend.2 <- c("17/09/1992","27/02/1992","14/01/1992","28/02/2002")
Dcalend.2

Dcalend.21 <- as.Date(Dcalend.2,"%d/%m/%Y")
Dcalend.21

# Extraire le numéro de semaine d'une date :
as.character(Dcalend.21,"%U")

# Extraire l'année d'une date :
as.character(Dcalend.21,"%Y"); substr(Dcalend.21,1,4)

# Pour l'année à deux chiffres :
as.character(Dcalend.21,"%y"); substr(Dcalend.21,3,4)

# Le mois d'une date :
as.character(Dcalend.21,"%m"); substr(Dcalend.21,6,7)

# Le jour d'une date :
as.character(Dcalend.21,"%d"); substr(Dcalend.21,9,10)

# Le jour dans l'année :
as.character(Dcalend.21,"%j")

# La différence entre deux dates
Dcalend.3 <- c("23/02/1993","17/07/1994","24/10/1995","06/03/1992")

Dcalend.31 <- as.Date(Dcalend.3,"%j/%m/%Y")
Dcalend.31

Temps.d <- difftime(Dcalend.31, Dcalend.21,units="days")
Temps.d

Temps.w <- difftime(Dcalend.31, Dcalend.21,units="weeks")
Temps.w

Temps.m <- difftime(Dcalend.31, Dcalend.21,units="min")
Temps.m

Temps <- difftime(Dcalend.31, Dcalend.21,units="auto")
Temps <- as.numeric(Temps)
Temps

# Par défaut c'est la différence en jours
Temps <- difftime(Dcalend.31, Dcalend.21)
Temps <- as.numeric(Temps)
Temps

set.seed(3)

Sexe <- rbinom(31, size=1, prob=.48)
Sexe1 <- ifelse(Sexe==0,"Femme","Homme")
Sexe1

Tranchage <- rep(c("0:4","5:9",">10"),c(8,9,14))
Tranchage

Poids <- seq(10,25,by=0.5)
Poids

Matable <- data.frame(Sexe,Sexe1,Poids,Tranchage)

# Les 5 premières lignes :
Matable[1:5,]

# La distribution de l'ensemble des donénes selon leur nature :
summary(Matable)

rnorm(10); rnorm(10, mean=100)

runif(10); runif(10, min=20, max=21)

getwd()
write.csv2(Matable, file="Matable.csv", row.names=F)

install.packages("xlsx")
library(xlsx)
getwd()
write.xlsx(Matable, "/Users/inestej/Documents/2018", sheetName="Matable1", col.names=TRUE, row.names=TRUE, append=FALSE, showNA=TRUE)

#getwd()
#setwd(le-repertoire-de-travail(file.choose()))
library(foreign)
#read.dta(file.choose())

#library(xlsReadWrite)
# read.xls(file.choose(), clNames=TRUE, sheet=1, from=1, rowNames=T)
View(Matable)
install.packages("xlsx")
library(xlsx)

print(getwd())
Matable1 <- read.table("/Users/inestej/Documents/2018/Matable.csv",header=T,sep=";",dec=",")

dim(Matable1)

# Création d'un objet appelé Poids et affichage du contenu
Poids <- seq(20,45,0.5)

# Extraire la 16ème Extraire la 16ème valeur de l'objet Poids
Poids[16]

# Extraire les 1ère, 16ème et 31ème valeurs de l'objet Poids
Poids[c(1,16,31)]

# Extraire les poids dont la valeur est supérieure à 38
Poids[Poids>38]

# Extraire les poids dont les valeurs sont à la fois supérieures à 25 et inférieures à 37
Poids[Poids>25&Poids<37]

# Créer un objet Classpoids
Classpoids <- ifelse(Poids<25,1,ifelse(Poids>30,3,2))

# Afficher l'effectif de chacun des groupes
table(Classpoids)
# ou
summary(as.factor(Classpoids))
