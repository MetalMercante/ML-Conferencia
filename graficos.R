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

dados <- data.frame(ac=acumulado,musicas=musicas, id=1:13)
dados$musicas <- factor(dados$musicas, levels = dados$musicas, ordered = TRUE)
dados$acumulado <- factor(dados$acumulado, levels = dados$acumulado, ordered = TRUE)
dados$id <- factor(dados$id, levels = dados$id, ordered = TRUE)

plot(acumulado)
plot(notas)


qplot(data=dados,x=musicas,y=ac)

ggplot(dados,x=musicas, y=ac)) + geom_line(group=dados$ac)
ggplot(dados,aes(x=musicas,y=ac))+geom_line()

ggplot(dados)+geom_line(aes(y=dados$acumulado,x=dados$musicas))

p <- ggplot(dados, aes(x=acumulado, y=id))
p + geom_line()


df <- read.csv("F://Drive//ML-Conf//ML-Conferencia//Pasta2.csv",sep=";")

pd <- position_dodge(.1)
ggplot(df, aes(x=iter, y=perf, colour=name)) + 
        geom_errorbar(aes(ymin=perf-se, ymax=perf+se), width=.1, position=pd) +
        geom_line(position=pd,aes(group=name)) +
        geom_point(position=pd)+
        ylim(0, 20)
