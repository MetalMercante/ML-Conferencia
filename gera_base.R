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


Hoje  <- strftime(max(Tempo),"%d/%m/%Y")
Ontem <- strftime(max(Tempo[Tempo!=max(Tempo)]),"%d/%m/%Y") 
        

strftime(max(Tempo),"%d/%m/%Y")

library(dplyr)
nrow(filter(base, Fonte == "comperdelivery_DF", Data == "05/03/2015"))
bb<- base %>% group_by(Fonte, Data) %>% filter(Data == Hoje | Data == Ontem) %>% summarise(counts=n())
bb

bb %>% group_by(Fonte) %>% mutate(P_yest=c(NA,counts[-length(counts)])) %>% mutate(P_yest=counts/P_yest)

###http://www.r-bloggers.com/good-riddance-to-excel-pivot-tables/
### Deve dar para fazer o que fiz acima com o pacote data.table

