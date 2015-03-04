library(dplyr)
df_T0 <- data.frame(brand=c("AAA","BBB","CCC","DDD","EEE","GGG"),price=c(1,2,3,4,5,9),time=rep("03/01/2015",6))
df_T1 <- data.frame(brand=c("AAA","BBB","DDD","EEE","FFF"),price=c(1.5,2.5,4.5,5,7),time=rep("03/02/2015",5))
df_T2 <- data.frame(brand=c("AAA","BBB","DDD","EEE","FFF"),price=c(2.5,3.5,5.5,6,8),time=rep("03/03/2015",5))

df <- rbind(df_T0,df_T1,df_T2)

df1 <- arrange(df,desc(brand,time))

#df %>% 
df1 %>% mutate(P_yest=lag(price,1,order_by=brand))

df %>% group_by(brand) %>% mutate(P_yest=price/c(NA,price[-length(price)])-1)
