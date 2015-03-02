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


print(max(Tempo))




        
#+scale_fill_gradient(low="green",high="darkgreen")
        

        #ggplot(data=plotar,aes(x=Tempo, y=Obs, group=1)) + geom_line(size=1.5)

#qplot(x=a,y=Obs)+ theme(axis.text.x = element_text(angle = 45, hjust = 1))

escala <scales::seq_gradient_pal(low = "#132B43", high = "#56B1F7", space = "Lab")


setwd("F://Drive//Business//Inflacao//Mapa")
write.csv(base, "Base.csv")