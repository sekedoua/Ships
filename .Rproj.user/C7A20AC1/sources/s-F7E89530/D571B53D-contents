
library(dplyr)
library(DT)
library(dygraphs)
library(ggplot2)
library(htmltools)
library(leaflet)
library(lubridate)
library(plyr)
library(readxl)
library(shiny)
library(shinydashboard)

library(tidyr)
library(tidyverse)
library(xts)




options(warn=-1)
options(digits=8)
 
borja_test=readRDS(file="Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_2019_ord.rds")

 dygraph(borja_test, main = "Debit Amont 2019", group = "Debit Amont Noue")%>% dyAxis("y", label = "Debit(m3/s)") %>% dyAxis("y2", label = "Qualite")%>%  dySeries("Debit", axis = 'y')%>%dySeries("Code_Quali", axis = 'y2')%>% dyRangeSelector()
