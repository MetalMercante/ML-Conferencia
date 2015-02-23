library("ggplot2")

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
notas2 <- notas-mean(notas)

acumulado <-NULL
total <- 0
for (i in 1:length(notas)){
        total <- (notas2[i] + total)
        acumulado[i] <- total
}

dados <- data.frame(ac=acumulado,musicas=musicas)
dados$musicas <- factor(dados$musicas, levels = dados$musicas, ordered = TRUE)



ggplot(data=dados,aes(x=musicas, y=acumulado, group=1)) + geom_line()

