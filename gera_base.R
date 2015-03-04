library(ggplot2)
library(RColorBrewer)

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
        Tempo <- as.Date(dias[1],"%d/%m/%Y")
        for (i in 1:length(Obs)){
                Tempo[i] <- as.Date(dias[i],"%d/%m/%Y")
        }



#dias <- lapply(dias,as.Date,"%d/%m/%Y")
        #dias <- unlist(dias)

plotar <- data.frame(dias=Tempo,Obs=Obs)
scale_fill_manual(values=cbPalette)
ggplot(data=plotar,aes(x=Tempo, y=Obs))+geom_bar(stat="identity", colour="darkblue")+scale_fill_brewer()


Hoje  <- as.character(max(Tempo))
Ontem <- as.character(max(Tempo[Tempo!=max(Tempo)] ))



library(dplyr)
nrow(filter(base, Fonte == "comperdelivery_DF", Data == "04/03/2015"))
base %>% group_by(Fonte, Data) %>% filter(Data == Hoje | Data == Ontem) %>% summarise(counts=n())
# o problema aqui é que "TEMPO" é DATA e o que esta na base e uma String, a qual não consigo tirar o MAX()
