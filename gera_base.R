library(ggplot2)

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

BaseS <- split(base,base$Data)

Observacoes <- lapply(BaseS,nrow)

Obs<- as.numeric(Observacoes)
dias <- names(Observacoes)
        a <- as.Date()
        for (i in 1:40){
                a[i] <- as.Date(dias[i],"%d/%m/%Y")
        }



#dias <- lapply(dias,as.Date,"%d/%m/%Y")
        #dias <- unlist(dias)



qplot(x=a,y=Obs)+ theme(axis.text.x = element_text(angle = 45, hjust = 1))



setwd("F://Drive//Business//Inflacao//Mapa")
write.csv(base, "Base.csv")