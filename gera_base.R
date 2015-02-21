directory <- "F://Drive//Business//Inflacao//Output//"
fontes <- list.files(directory,,pattern="csv")

base <-NULL
for (i in 1:10){
        dest <- paste(directory, fontes[i], sep="")
        b1 <- read.csv(dest, sep=";", header=FALSE)
        base <- rbind(base,b1)
}

nomes <-  c("Fonte","Data","hora","Cat","Sku","Preço")
colnames(base)<-nomes


setwd("F://Drive//Business//Inflacao//Mapa")
write.csv(base, "Base.csv")