library(shiny)
library(leaflet)
library(dplyr)
library(shiny)
library(tidyr)
library(tidyverse)
library(varhandle)

dfPC = read.csv(file="Donnees_OK/DfPC_propre.csv",header=TRUE, sep=",", stringsAsFactors = F)

colnames(dfPC) = c("Site", "Station", "DtHechanti","Parametre","Valeur","Symbol","Signe","LimiteInf","Labo","Methode")
# write.csv(dfPC,"dfPC_propre.csv")
# dfPC$Valeur<-type.convert(dfPC$Valeur)
# dfPC$Valeur<-as.double(dfPC$Valeur)
# dfPC$DtHechanti<-type.convert(dfPC$DtHechanti)
# dfPC$DtHechanti<-as.character(unlist(dfPC$DtHechanti))
 
# dfPC$Valeur<-as.numeric(as.character(dfPC$Valeur))


dfPC$DtHechanti<- strptime(dfPC$DtHechanti,"%d/%m/%Y %H:%M:%S")

dfPC[["DtHechanti"]]<-as.POSIXct(dfPC[["DtHechanti"]])

dfPC%>%distinct(Site, Station) #station par site
dfmethod_Para <- df%>%distinct(Methode, Parametre) #Parametre Par methodo
write.csv(dfmethod_Para ,"Methodo_para.csv")

write.csv(dfPC%>%distinct(Site, Station,Parametre,) ,"site_station_para.csv")

pin_sec<- df[df$Site=="BV Pin Sec",]



library(dygraphs)
library(ggplot2)
library(htmltools)
library(leaflet)
library(rmarkdown)
library(plyr)
library(readxl)
library(shiny)
library(shinydashboard)
library(zoo)
library(tidyr)
library(tidyverse)
library(uuid)
library(xts)
library(dplyr)
library(DT)
library(lubridate)



library(dplyr)



library(varhandle)
library(plotly)
library(reshape2) 
library(qdap)
library(xts)

require(scales)
require(gridExtra)
library(dslabs)

library(ggthemes)

library(rAmCharts)
library(rainbow)

options(warn=-1)
options(digits=8)