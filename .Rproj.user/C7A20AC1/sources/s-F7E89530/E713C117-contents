
#source("Debit.R")
#library(datamatri)
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

options(warn=-1)
options(digits=8)

 

# sites_matri <- read.csv("https://www.dropbox.com/s/vc9m3tk68ero65o/coordo_sites.csv?dl=1",header=TRUE, sep=";")
sites_matri <- read.csv(file="./Donnees_test/coordo_sites.csv", header=TRUE, sep=";")
sites_matri$Latitude <- as.double(sites_matri$Latitude )
sites_matri$Longitude <- as.double(sites_matri$Longitude)
sites_matri$Nom_site<-as.character(sites_matri$Nom_site)
colnames(sites_matri) = c("Num_station", "Latitude", "Longitude","Nom_Site","X") 
sites_matri<-select (sites_matri,-c(X))

#borja_dd= read.csv(file="Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_date_heure.csv", header=TRUE, sep=";",stringsAsFactors=FALSE)
#borja_id_2019= read.csv(file="Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_date_heure.csv", header=TRUE, sep=";",stringsAsFactors=FALSE)

borja_id_2019<-read.csv(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_2019.csv", header=TRUE, sep=",",stringsAsFactors=FALSE)
borja_id_2018<-read.csv(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_2018.csv", header=TRUE, sep=",",stringsAsFactors=FALSE)
borja_id_2017<-read.csv(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_2017.csv", header=TRUE, sep=",",stringsAsFactors=FALSE)

borja_dd_2019<-read.csv(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2019.csv", header=TRUE, sep=",",stringsAsFactors=FALSE)
borja_dd_2018<-read.csv(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2018.csv", header=TRUE, sep=",",stringsAsFactors=FALSE)
borja_dd_2017<-read.csv(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2017.csv", header=TRUE, sep=",",stringsAsFactors=FALSE)
borja_dd_2016<-read.csv(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2016.csv", header=TRUE, sep=",",stringsAsFactors=FALSE)
borja_dd_2015<-read.csv(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2015.csv", header=TRUE, sep=",",stringsAsFactors=FALSE)
borja_dd_2014<-read.csv(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2014.csv", header=TRUE, sep=",",stringsAsFactors=FALSE)
borja_dd_2013<-read.csv(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2013.csv", header=TRUE, sep=",",stringsAsFactors=FALSE)


# borja_id_2019<-read.csv("https://www.dropbox.com/s/r0py2cyhchbnx3u/Noue_Dumont_Amont_Debit_2019.csv?dl=1", header=TRUE, sep=",",stringsAsFactors=FALSE)
# borja_id_2018<-read.csv("https://www.dropbox.com/s/t50cvtiv7w51mfy/Noue_Dumont_Amont_Debit_2018.csv?dl=1", header=TRUE, sep=",",stringsAsFactors=FALSE)
# borja_id_2017<-read.csv("https://www.dropbox.com/s/50b9d88odk585s7/Noue_Dumont_Amont_Debit_2017.csv?dl=1", header=TRUE, sep=",",stringsAsFactors=FALSE)
# 
# borja_dd_2019<-read.csv("https://www.dropbox.com/s/9kpbbkkdek3fwpx/Noue_Dumont_Aval_Debit_2019.csv?dl=1", header=TRUE, sep=",",stringsAsFactors=FALSE)
# borja_dd_2018<-read.csv("https://www.dropbox.com/s/n8y6dwvq0psdov6/Noue_Dumont_Aval_Debit_2018.csv?dl=1", header=TRUE, sep=",",stringsAsFactors=FALSE)
# borja_dd_2017<-read.csv("https://www.dropbox.com/s/czm5xoieumxko35/Noue_Dumont_Aval_Debit_2017.csv?dl=1", header=TRUE, sep=",",stringsAsFactors=FALSE)
# borja_dd_2016<-read.csv("https://www.dropbox.com/s/e0q9nrjuyrccygi/Noue_Dumont_Aval_Debit_2016.csv?dl=1", header=TRUE, sep=",",stringsAsFactors=FALSE)
# borja_dd_2015<-read.csv("https://www.dropbox.com/s/fsxkevpjmz3k5ht/Noue_Dumont_Aval_Debit_2015.csv?dl=1", header=TRUE, sep=",",stringsAsFactors=FALSE)
# borja_dd_2014<-read.csv("https://www.dropbox.com/s/awbnq1ak21m8sai/Noue_Dumont_Aval_Debit_2014.csv?dl=1", header=TRUE, sep=",",stringsAsFactors=FALSE)
# borja_dd_2013<-read.csv("https://www.dropbox.com/s/8jo42oo91f0upon/Noue_Dumont_Aval_Debit_2013.csv?dl=1", header=TRUE, sep=",",stringsAsFactors=FALSE)
# 
# borja_id_temp_2019 <-readRDS(gzcon(url("https://www.dropbox.com/s/e05kcsxcrlejmas/Noue_Dumont_Amont_Debit_2019_ord.rds?dl=1")))
# borja_id_temp_2018 <-readRDS(gzcon(url("https://www.dropbox.com/s/sblx3umvlalnxel/Noue_Dumont_Amont_Debit_2018_ord.rds?dl=1")))
# borja_id_temp_2017 <-readRDS(gzcon(url("https://www.dropbox.com/s/3q4zrlvamrqe7pc/Noue_Dumont_Amont_Debit_2017_ord.rds?dl=1")))
# # 
# # 
# # 
# borja_dd_temp_2019<-readRDS(gzcon(url("https://www.dropbox.com/s/7la68ktmi1a3bgs/Noue_Dumont_Aval_Debit_2019_ord.rds?dl=1")))
# borja_dd_temp_2018<-readRDS(gzcon(url("https://www.dropbox.com/s/hsjfsy65lwj47h7/Noue_Dumont_Aval_Debit_2018_ord.rds?dl=1")))
# borja_dd_temp_2017<-readRDS(gzcon(url("https://www.dropbox.com/s/umo18z6z5vp8qll/Noue_Dumont_Aval_Debit_2017_ord.rds?dl=1")))
# borja_dd_temp_2016<-readRDS(gzcon(url("https://www.dropbox.com/s/hgs488o5j27zryn/Noue_Dumont_Aval_Debit_2016_ord.rds?dl=1")))
# borja_dd_temp_2015<-readRDS(gzcon(url("https://www.dropbox.com/s/msm4shhq5xud2vl/Noue_Dumont_Aval_Debit_2015_ord.rds?dl=1")))
# borja_dd_temp_2014<-readRDS(gzcon(url("https://www.dropbox.com/s/fs7h3nuo4xp9lt1/Noue_Dumont_Aval_Debit_2014_ord.rds?dl=1")))
# borja_dd_temp_2013<-readRDS(gzcon(url("https://www.dropbox.com/s/1kh4wmbx299zatq/Noue_Dumont_Aval_Debit_2013_ord.rds?dl=1")))

borja_id_temp_2019 <-readRDS(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_2019_ord.rds")
borja_id_temp_2018 <-readRDS(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_2018_ord.rds")
borja_id_temp_2017 <-readRDS(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Amont_Debit_2017_ord.rds")
#
#
#
borja_dd_temp_2019<-readRDS(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2019_ord.rds")
borja_dd_temp_2018<-readRDS(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2018_ord.rds")
borja_dd_temp_2017<-readRDS(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2017_ord.rds")
borja_dd_temp_2016<-readRDS(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2016_ord.rds")
borja_dd_temp_2015<-readRDS(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2015_ord.rds")
borja_dd_temp_2014<-readRDS(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2014_ord.rds")
borja_dd_temp_2013<-readRDS(file="./Donnees_test/EcoQUA_15/Noue_Dumont_Aval_Debit_2013_ord.rds")













dygrph_noue_amont_2019<- dygraph(borja_id_temp_2019, main = "Debit Amont 2019", group = "Debit Amont Noue")%>% dyAxis("y", label = "Debit(m3/s)") %>% dyAxis("y2", label = "Qualite")%>%  dySeries("Debit", axis = 'y')%>%dySeries("Code_Quali", axis = 'y2')%>% dyRangeSelector()
dygrph_noue_amont_2018<-dygraph(borja_id_temp_2018, main = "Debit Amont 2018", group = "Debit Amont Noue")%>% dyAxis("y", label = "Debit(m3/s)") %>% dyAxis("y2", label = "Qualite")%>%  dySeries("Debit", axis = 'y')%>%dySeries("Code_Quali", axis = 'y2')%>% dyRangeSelector()
dygrph_noue_amont_2017<-dygraph(borja_id_temp_2017, main = "Debit Amont 2017", group = "Debit Amont Noue")%>% dyAxis("y", label = "Debit(m3/S)") %>% dyAxis("y2", label = "Qualite")%>%  dySeries("Debit", axis = 'y')%>%dySeries("Code_Quali", axis = 'y2')%>% dyRangeSelector()


dygrph_noue_aval_2019<-dygraph(borja_dd_temp_2019, main = "Debit Aval 2019", group = "Debit Aval Noue")%>% dyAxis("y", label = "Debit(m3/s)") %>% dyAxis("y2", label = "Qualite")%>%  dySeries("Debit", axis = 'y')%>%dySeries("Code_Quali", axis = 'y2')%>% dyRangeSelector()
dygrph_noue_aval_2018<-dygraph(borja_dd_temp_2018, main = "Debit Aval 2018", group = "Debit Aval Noue")%>% dyAxis("y", label = "Debit(m3/s)") %>% dyAxis("y2", label = "Qualite")%>%  dySeries("Debit", axis = 'y')%>%dySeries("Code_Quali", axis = 'y2')%>% dyRangeSelector()
dygrph_noue_aval_2017<-dygraph(borja_dd_temp_2017, main = "Debit Aval 2017", group = "Debit Aval Noue")%>% dyAxis("y", label = "Debit(m3/s)") %>% dyAxis("y2", label = "Qualite")%>%  dySeries("Debit", axis = 'y')%>%dySeries("Code_Quali", axis = 'y2')%>% dyRangeSelector()
dygrph_noue_aval_2016<-dygraph(borja_dd_temp_2016, main = "Debit Aval 2016", group = "Debit Aval Noue")%>% dyAxis("y", label = "Debit(m3/s)") %>% dyAxis("y2", label = "Qualite")%>%  dySeries("Debit", axis = 'y')%>%dySeries("Code_Quali", axis = 'y2')%>% dyRangeSelector()
dygrph_noue_aval_2015<-dygraph(borja_dd_temp_2015, main = "Debit Aval 2015", group = "Debit Aval Noue")%>% dyAxis("y", label = "Debit(m3/s)") %>% dyAxis("y2", label = "Qualite")%>%  dySeries("Debit", axis = 'y')%>%dySeries("Code_Quali", axis = 'y2')%>% dyRangeSelector()
dygrph_noue_aval_2014<-dygraph(borja_dd_temp_2014, main = "Debit Aval 2014", group = "Debit Aval Noue")%>% dyAxis("y", label = "Debit(m3/s)") %>% dyAxis("y2", label = "Qualite")%>%  dySeries("Debit", axis = 'y')%>%dySeries("Code_Quali", axis = 'y2')%>% dyRangeSelector()
dygrph_noue_aval_2013<-dygraph(borja_dd_temp_2013, main = "Debit Aval 2013", group = "Debit Aval Noue")%>% dyAxis("y", label = "Debit(m3/S)") %>% dyAxis("y2", label = "Qualite")%>%  dySeries("Debit", axis = 'y')%>%dySeries("Code_Quali", axis = 'y2')%>% dyRangeSelector()



ui <- dashboardPage(
  
  dashboardHeader(title = "MATRIOCHKAS DATA DASHBOARD", titleWidth = 400, dropdownMenuOutput("messageMenu")
                  
                  
                  
                  
                  
  ),
  
  dashboardSidebar(
    width = 350,
    sidebarMenu(
      menuItem("Site 1: Noue Dumont", tabName = "dumont", icon = icon("dashboard")),
      menuItem("Site 2: Bassin BO3", icon = icon("th"), tabName = "BO3"     ),
      menuItem("Site 3: Bassin du Vertou", icon = icon("file-code-o"),tabName = "Vertou")
      ,
      menuItem("Localisation des sites", icon = icon("map-marked-alt"),tabName = "Carto")
    )
    
    
  ),
  
  dashboardBody
  
  (
    
    
    
    tabItems(
      tabItem(
        
        tabName = "dumont",
        h2("Noue centralisée Standard de Nantes/Site Dumont"),
        br(),br(),
        h3("Debit Amont"),
        fluidRow(
          
          
          
          box("Noue_Debit_Amont2019",  
              
              
              
              dygraphOutput("dydebiamont2019",width = "100%")
          ),
          box("Noue_Debit_Amont2018",  
              
              
              
              dygraphOutput("dydebiamont2018",width = "100%")
          ),
          box("Noue_Debit_Amont2017",  
              
              
              
              dygraphOutput("dydebiamont2017",width = "100%")
          ),
          
          box("Données", 
              
              
              selectInput("dataset_deb_noue_amont", "Choix des jeux de données:",
                          choices = c("2019_Noue_Deb_Amont", "2018_Noue_Deb_Amont","2017_Noue_Deb_Amont")),br(),
              
              
              
              downloadButton("BtdownloadData_noueamont", "Télécharger les données"),br(),br(),
              
              
              dataTableOutput('mytable_noue_Amont'))
          
          
          
          
          
          
        ),
        
        h3("Debit Aval"),
        
        fluidRow( 
          
          box("Noue_Debit_Aval2019",  
              
              dygraphOutput("dydebiaval2019",width = "100%")
          ),
          
          box("Noue_Debit_Aval2018",  
              
              dygraphOutput("dydebiaval2018",width = "100%")
          ),
          box("Noue_Debit_Aval2017",  
              
              dygraphOutput("dydebiaval2017",width = "100%")
          ),
          box("Noue_Debit_Aval2016",  
              
              dygraphOutput("dydebiaval2016",width = "100%")
          ),
          box("Noue_Debit_Aval2015",  
              
              dygraphOutput("dydebiaval2015",width = "100%")
          ),
          box("Noue_Debit_Aval2014",  
              
              dygraphOutput("dydebiaval2014",width = "100%")
          ),
          box("Noue_Debit_Aval2013",  
              
              dygraphOutput("dydebiaval2013",width = "100%")
          ),
          
          
          box("Données", 
              
              
              selectInput("dataset_deb_noue_aval", "Choix des jeux de données:",
                          choices = c("2019_Noue_Deb_Aval", "2018_Noue_Deb_Aval","2017_Noue_Deb_Aval","2016_Noue_Deb_Aval","2015_Noue_Deb_Aval","2014_Noue_Deb_Aval","2013_Noue_Deb_Aval")),br(),
              
              
              
              downloadButton("BtdownloadData_noueaval", "Télécharger les données"),br(),br(),
              
              
              dataTableOutput('mytable_noue_Aval'))
          
        ),
        
        
        
        h3("Physico-chimie"),
        
        fluidRow(width=NULL,
                 box( 
                   tabPanel("Graphiques"
                            
                            
                            
                   )
                 ),
                 box(
                   
                   
                   tabPanel("Données"
                            
                            , 
                            
                            
                            
                            br(),br()
                            
                   )    
                   
                 )
                 
        )
      ), #Fin du  tabItem(Noue)
      
      
      
      
      
      tabItem(
        
        tabName = "BO3",
        h2("Bassin sec Coueron")
      ),#Fin du  tabItem(BO3)
      
      tabItem(
        
        tabName = "Vertou",
        h2("Bassin en eau Vertou")
      ),#Fin du  tabItem(Vertou)
      
      tabItem(
        
        tabName = "Carto",
        h2("Localisation des sites"),br(),
        leafletOutput("macarte",width = "100%",height = 1000)
        
        
        
      )#Fin du  tabItem(Carto)
      
      
      
      
      
      
    )  # Fin des tabItems()
    
    
    
    
    
  )#Fin du dashboardBody()
  
  
  
  
  
  
  
)#Fin du dashboardPage








server <- function(input, output) {
  
  
  
  #affichage dygraph amont
  output$dydebiamont2019 <- renderDygraph({
    dygrph_noue_amont_2019
  })
  output$dydebiamont2018 <- renderDygraph({
    dygrph_noue_amont_2018
  })
  output$dydebiamont2017 <- renderDygraph({
    dygrph_noue_amont_2017
  })
  
  datasetInput_debit_amont <- reactive({
    switch(input$dataset_deb_noue_amont,
           "2019_Noue_Deb_Amont" = borja_id_2019,
           "2018_Noue_Deb_Amont" = borja_id_2018,
           "2017_Noue_Deb_Amont" = borja_id_2017 )
  })
  
  output$mytable_noue_Amont = renderDataTable({
    datasetInput_debit_amont()
    
  })
  
  
  output$BtdownloadData_noueamont <- downloadHandler(
    filename = function() {
      paste(input$dataset_deb_noue_amont, ".csv", sep = "")
    },
    content = function(file) {
      write.csv(datasetInput_debit_amont(), file, row.names = FALSE)
    }
  )
  
  
  #affichage dygraph aval
  output$dydebiaval2019 <- renderDygraph({
    dygrph_noue_aval_2019
  })
  output$dydebiaval2018 <- renderDygraph({
    dygrph_noue_aval_2018
  })
  output$dydebiaval2017 <- renderDygraph({
    dygrph_noue_aval_2017
  })
  
  output$dydebiaval2016 <- renderDygraph({
    dygrph_noue_aval_2016
  })
  
  output$dydebiaval2015 <- renderDygraph({
    dygrph_noue_aval_2015
  })
  output$dydebiaval2014 <- renderDygraph({
    dygrph_noue_aval_2014
  })
  output$dydebiaval2013 <- renderDygraph({
    dygrph_noue_aval_2013
  })
  
  
  
  
  
  
  
  
  
  
  #noue aval
  datasetInput_debit_aval <- reactive({
    switch(input$dataset_deb_noue_aval,
           "2019_Noue_Deb_Aval" = borja_dd_2019,
           "2018_Noue_Deb_Aval" = borja_dd_2018, 
           "2017_Noue_Deb_Aval" = borja_dd_2017,
           "2016_Noue_Deb_Aval" = borja_dd_2016,
           "2015_Noue_Deb_Aval" = borja_dd_2015,
           "2014_Noue_Deb_Aval" = borja_dd_2014,
           "2013_Noue_Deb_Aval" = borja_dd_2013)
  })
  
  
  
  
  output$mytable_noue_Aval = renderDataTable({
    datasetInput_debit_aval()
    
  })
  
  
  
  
  
  output$BtdownloadData_noueaval <- downloadHandler(
    filename = function() {
      paste(input$dataset_deb_noue_aval, ".csv", sep = "")
    },
    content = function(file) {
      write.csv(datasetInput_debit_aval(), file, row.names = FALSE)
    }
  )
  
  
  
  
  
  
  
  
  
  
  
  #map
  data_coordo <- reactive({
    x <- sites_matri
  })
  
  output$macarte<- renderLeaflet({
    df <- data_coordo()
    
    m <- leaflet(data = df) %>%
      addTiles() %>%
      addMarkers(lng = ~Longitude,
                 lat = ~Latitude,
                 popup = paste("Station:", df$Num_station, "<br>",
                               "Site:", df$Nom_Site))
    m
  })
  
  
  
  
  
  
  
}


shinyApp(ui, server)