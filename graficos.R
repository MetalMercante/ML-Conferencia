library("ggplot2")
library("reshape2")
musicas<- c("Lionheart",
            "Unholy Savior",
            "I Want the World... and Everything in It",
            "Madness",
            "Sea of Dreams",
            "Speed and Danger",
            "Touch in the Night",
            "The Black Swordsman",
            "Hero's Quest",
            "Far Far Away",
            "Angel Cry",
            "Push it to the limit",
            "Wild Child")

notas <- c(7,7,7,7,2,7,5,4,4,6,3,4,9)
notas <- c(7,6.6,5.7,7,3.8,7,3.9,5.1,5.1,6.7,5.9,4,9)
notas2 <- notas-mean(notas)

acumulado <-NULL
total <- 0
for (i in 1:length(notas)){
        total <- (notas2[i] + total)
        acumulado[i] <- total
}

dados <- data.frame(musicas=musicas, acumulado=acumulado+mean(notas), media=rep(mean(notas),length(notas)))
dados$musicas <- factor(dados$musicas, levels = dados$musicas, ordered = TRUE)
dd <- melt(dados, id="musicas")

        
a <- ggplot(data=dd, aes(x=musicas, y=value, colour=variable, group=variable))
a <- a + geom_line(size=2) 
a <- a + theme(axis.text.x=element_text(angle=35, hjust=1))
a <- a + theme(axis.ticks = element_blank(), axis.text.y = element_blank())
a

getwd()

#+ theme(axis.text.x=element_text(angle=35, hjust=1))

