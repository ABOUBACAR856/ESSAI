set.seed(3)
Sexe <- rbinom(31, size=1, prob=.48)
Sexe1 <- ifelse(Sexe==0,"Femme","Homme")
Tranchage <- rep(c("0:4","5:9",">10"),c(8,9,14))
Poids <- seq(10,25,by=0.5)
Matable <- data.frame(Sexe,Sexe1,Poids,Tranchage)
Matable$GROUPOIDS <- cut(Matable$Poids,breaks=c(9,15,20,25))

Matable$NIVSCOLMERE <- factor(c(rep("Primaire",12), rep("Secondaire",10), rep("Universitaire",9)))
#View(Matable)
library(tidyverse)

plot(Matable$NIVSCOLMERE, col='red')
plot(Matable$NIVSCOLMERE, ylab='Effectifs')
plot(Matable$NIVSCOLMERE, ylab='Effectifs', ylim=c(0,14))
plot(Matable$NIVSCOLMERE, ylab='Effectifs', ylim=c(0,14), main='Distribution \n en fonction des niveaux scolaires\n des mères')
#p <- ggplot(Matable, aes(NIVSCOLMERE)) 
#p <- p + geom_bar(aes(fill=NIVSCOLMERE)) 
#p <- p + scale_fill_brewer(palette="Blues")
#p <- p + labs(x="Niveau scolaire de la mère", y="Effectif", title="Diagramme en barre", 
#     subtitle="Distribution en fonction \n des niveaux scolaires\n des mères")
#p

plot(Matable$NIVSCOLMERE, density=c(NA,50,30), xlab='Effectifs', xlim=c(0,14), horiz=T)
#p + coord_flip()

# Ne s'applique pas sur des données brutes
pie(table(Matable$NIVSCOLMERE))
Nom <- levels(Matable$NIVSCOLMERE)
Donnee <- table(Matable$NIVSCOLMERE)
pie(Donnee, labels=c(paste(Nom[1],';',Donnee[1]), paste(Nom[2],';',Donnee[2]), paste(Nom[3],';',Donnee[3])))    
#p + coord_polar(theta="x", direction=1)

Title <- 'Repartition par groupe de poids'
hist(Matable$Poids, breaks=c(10,15,20,25), density=c(NA, 50, 30), 
     col='blue', main=Title, xlab='Poids en Kg', ylab='Effectifs')

#q <- ggplot(Matable, aes(Poids)) 
#q + geom_histogram(breaks=c(10,15,20,25), color="black", fill="lightblue", linetype="dashed") 

Donnee <- table(Matable$GROUPOIDS)
plot(Donnee, type='o', main=Title, ylab=Effectifs, ylim=c(0,12))
plot(Donnee, type='o', main=Title, ylab=Effectifs, ylim=c(0,12), pch=8)

boxplot(Matable$Poids, xlab='Poids en Kg', main='Description de la valeur Poids')
points(x=1, y=mean(Matable$Poids), pch=4)

par(mfrow=c(3,2))
layout.show(6)
Zone <- matrix(c(2,4,1,1,3,5), byrow=T, ncol=2)
layout(Zone)
layout.show(Zone)
graphics.off()
pdf(file='figure.pdf')
Nom <- levels(Matable$NIVSCOLMERE)
Donnee <- table(Matable$NIVSCOLMERE)
pie(Donnee, labels=c(paste(Nom[1],';',Donnee[1]), paste(Nom[2],';',Donnee[2]), paste(Nom[3],';',Donnee[3])))    
dev.off()

#last_plot() 
#ggsave("plot.png", width = 5, height = 5) 

by(Matable$Poids, Matable$Sexe, summary)
tapply(Matable$Poids, list(Matable$Sexe), summary)
aggregate(Matable$Poids, list(Matable$Sexe), summary)
by(Matable$Poids, list(Matable$Sexe, Matable$GROUPOIDS), summary)
aggregate(Matable$Poids, list(Matable$Sexe, Matable$GROUPOIDS), summary)
tapply(Matable$Poids, list(Matable$Sexe, Matable$GROUPOIDS), summary)

boxplot(Matable$Poids~Matable$Sexe1, xlab='Sexe', ylab='Poids en Kg', main='Poids en fonction du Sexe')
points(1, mean(Matable$Poids[Matable$Sexe1=="Femme"]), pch=4)
points(2, mean(Matable$Poids[Matable$Sexe1=="Homme"]), pch=4)

#ggplot(Matable, aes(Sexe1, Poids)) + geom_boxplot() 
#qplot(Matable$Sexe1, Matable$Poids, geom="point")

boxplot(Matable$Poids~Matable$Sexe1+Matable$Tranchage, xlab='Sexe', 
        ylab='Poids en Kg', main='Poids en fonction du Sexe et du groupe d age')

ggplot(Matable, aes(Sexe1, Tranchage)) + geom_count()

table(Matable$Sexe1, Matable$NIVSCOLMERE)
Tab.1 <- table(Matable$Sexe1, Matable$NIVSCOLMERE)
prop.table(Tab.1, 1)
round(prop.table(Tab.1,1)*100, 1)
round(prop.table(Tab.1,2)*100, 1)

Var.1 <- Matable$Sexe1
Var.2 <- Matable$NIVSCOLMERE
a  <- table(Var.1, Var.2)
b <- round(prop.table(a,1)*100, digit=1)
Total.1 <- margin.table(a,2)

Counting.1 <- rbind(a[1,],b[1,], a[2,],b[2,])
dimnames(Counting.1) <- list(c('Male','%','Femelle','%'), c('Prim', 'Secon', 'Universit'))
Counting <- rbind(Counting.1, Total.1)
Total.1 <- margin.table(Counting.1, 1)
Counting.1 <- cbind(Counting.1, Total=Total.1)
Counting.1

Total.2 <- margin.table(a,1)
Counting.2 <- cbind(a[,1],b[,1], a[,2],b[,2], a[,3],b[,3])
dimnames(Counting.2) <- list(c('Male','Femelle'), c('Prim','%', 'Secon','%', 'Universit','%'))
Counting.2 <- cbind(Counting.2, Total=Total.2)
Total.2 <- margin.table(Counting.2, 2)
Total.2[2] <- round((Total.2[1]/Total.2[7])*100, 1)
Total.2[4] <- round((Total.2[3]/Total.2[7])*100, 1)
Total.2[6] <- round((Total.2[5]/Total.2[7])*100, 1)
Counting.2 <- rbind(Counting.2, Total=Total.2)
Counting.2

plot(Matable$GROUPOIDS~Matable$Sexe1, density=c(NA,50,30), xlab='Sexe', ylab='Poids', main='Poids en fonction du Sexe')

barplot(table(Matable$Sexe1,Matable$GROUPOIDS), col='blue', 
        density=c(NA,30), xlab='Poids', ylab='Effectifs', main='Poids en fonction du Sexe', beside=T)
legend(7,6, legend=c("Feminin", "Masculin"), bty='n', fill='red', density=c(NA,30), cex=0.7)


