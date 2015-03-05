Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre7')
library(xlsx)
setwd("F:/Drive/ML-Conf/ML-Conferencia/")
jj <- read.xlsx("F://Drive//NY3.xlsx",1)

require(rJava)
.jcall('java.lang.System','S','getProperty','java.version')
