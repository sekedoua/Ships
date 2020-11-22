
library(shiny)
library(shinydashboard)
library(ggplot2)
library(dygraphs)
library(dplyr)
library(tidyverse)
library(readxl)
library(xts)
library(plyr)
library(htmltools)
library(DT)



options(warn=-1)
source("exel_format.R")
source("niveau_eau.R")
source("physicochimie.R")
source("carto.R")

ui <- dashboardPage(
  
  dashboardHeader(title = "MATRIOCHKAS DATA DASHBOARD", titleWidth = 450, dropdownMenuOutput("messageMenu")
                  
                  # dropdownMenu(type = "messages",
                  #              messageItem(
                  #                from = "Sales Dept",
                  #                message = "Sales are steady this month."
                  #              ),
                  #              messageItem(
                  #                from = "New User",
                  #                message = "How do I register?",
                  #                icon = icon("question"),
                  #                time = "13:45"
                  #              ),
                  #              messageItem(
                  #                from = "Support",
                  #                message = "The new server is ready.",
                  #                icon = icon("life-ring"),
                  #                time = "2014-12-01"
                  #              )
                  # ),
                  # 
                  # dropdownMenu(type = "notifications",
                  #              notificationItem(
                  #                text = "5 new users today",
                  #                icon("users")
                  #              ),
                  #              notificationItem(
                  #                text = "12 items delivered",
                  #                icon("truck"),
                  #                status = "success"
                  #              ),
                  #              notificationItem(
                  #                text = "Server load at 86%",
                  #                icon = icon("exclamation-triangle"),
                  #                status = "warning"
                  #              )
                  # ),
                  # 
                  # 
                  # dropdownMenu(type = "tasks", badgeStatus = "success",
                  #              taskItem(value = 90, color = "green",
                  #                       "Documentation"
                  #              ),
                  #              taskItem(value = 17, color = "aqua",
                  #                       "Project X"
                  #              ),
                  #              taskItem(value = 75, color = "yellow",
                  #                       "Server deployment"
                  #              ),
                  #              taskItem(value = 80, color = "red",
                  #                       "Overall project"
                  #              )
                  # )
                  
                  
                  
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
    
    #    fluidRow(column(1)
    
    #   box(plotOutput("plot1")),
    
    
    #     box(
    
    #      sliderInput("slider", "Slider input:", 1, 100, 50),
    #      textInput("text", "Text input:")
    #       ),
    
    #      box (title = "Physico-chimie", status = "warning", 
    
    #  "Box content here", br(), "More box content",
    #       #            #       sliderInput("slider", "Slider input:", 1, 100, 50),
    #     textInput("text", "Text input:")
    #        ),
    
    #        box(
    #       title = "Debit-Entree", status = "success", solidHeader = TRUE,
    #     "Box content here", br(), "More box content",
    #         sliderInput("slider", "Slider input:", 1, 100, 50),
    #        textInput("text", "Text input:")
    #       ),
    #         box(
    #       title = "Debit-Sortie", status = " danger", solidHeader = TRUE,
    #      "Box content here", br(), "More box content",
    #      sliderInput("slider", "Slider input:", 1, 100, 50),
    #      textInput("text", "Text input:")
    #     ),
    
    tabItems(
      tabItem(
        
        tabName = "dumont",
        h2("Noue centralisée Standard de Nantes/Site Dumont"),
        
        box( width=NULL,
             title = "Debit-Entree", status = "info", solidHeader = TRUE,
             collapsible = TRUE,collapsed = TRUE,
             
             tabBox(width=NULL,
                    
                    tabPanel("Graphiques",  
                             
                             #      dygraphOutput("plotmehere", width = "100%"),
                             
                             htmlOutput("debits",width = "100%")
                    ),
                    
                    tabPanel("Données", 
                             
                             
                             selectInput("dataset_deb", "Choix des jeux de données:",
                                         choices = c("Instant", "Journalier")),br(),
                             
                             
                             
                             downloadButton("downloadData", "Télécharger les données"),br(),br(),
                             
                             
                             dataTableOutput('mytableInstant'))
                    
                    
                    
                    
                    # dataTableOutput('mytableJournalier'))
                    
             )
        ),
        
        box( width=NULL,
             title = "Niveau", status = "success", solidHeader = TRUE,
             collapsible = TRUE,collapsed = TRUE,
             
             tabBox(width=NULL,
                    
                    tabPanel("Graphiques",  
                             
                             htmlOutput("Niveaux",width = "100%")
                    ),
                    
                    
                    
                    
                    tabPanel("Données", 
                             
                             
                             selectInput("dataset_wl", "Choix des jeux de données:",
                                         choices = c("Instant", "Journalier")),br(),
                             
                             
                             
                             downloadButton("downloadData_wl", "Télécharger les données"),br(),br(),
                             
                             
                             dataTableOutput('mytable_wl'))
                    
             )
        ),
        box( width=NULL,
             title = "Physico-Chimie", status = "info", solidHeader = TRUE,
             collapsible = TRUE,collapsed = TRUE,
             
             tabBox(width=NULL,
                    
                    tabPanel("Graphiques",  
                             
                             dygraphOutput("physicochimie", width = "100%")
                             #plotOutput("plot5", height = 250)
                             
                    ),
                    
                    
                    
                    
                    tabPanel("Données", 
                             
                             
                             downloadButton("downloadData_pc", "Télécharger les données"),br(),br(),
                             
                             
                             dataTableOutput('mytable_pc')     
                             
                             
                    )
                    
             )
        )
        
        #      infoBox("New Orders", 10 * 2, icon = icon("credit-card"), fill = TRUE),
        #     infoBoxOutput("progressBox2"),
        #     infoBoxOutput("approvalBox2")
        
        
        #       ),
        # 
        # fluidRow(
        #   tabBox(
        #     title = "First tabBox",
        #     
        #     id = "tabset1", height = "250px",
        #     tabPanel("Tab1", "First tab content"),
        #     tabPanel("Tab2", "Tab content 2")
        #   ),
        #   
        #   #   infoBox("New Orders", 10 * 2, icon = icon("credit-card")),
        #   # Dynamic infoBoxes
        #   #    infoBoxOutput("progressBox"),
        #   #    infoBoxOutput("approvalBox"),
        #   tabBox(
        #     side = "right", height = "250px",
        #     selected = "Tab3",
        #     tabPanel("Tab1", "Tab content 1"),
        #     tabPanel("Tab2", "Tab content 2"),
        #     tabPanel("Tab3", "Note that when side=right, the tab order is reversed.")
        #   ),
        #   
        #   tabBox(
        #     # Title can include an icon
        #     title = tagList(shiny::icon("gear"), "tabBox status"),
        #     tabPanel("Tab1",
        #              "Currently selected tab from first box:",
        #              verbatimTextOutput("tabset1Selected")
        #     ),
        #     tabPanel("Tab2", "Tab content 2")
        #   )
        # )
      ) , #Fin du  tabItem(Noue)
      
      
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
  
  #Debits
  output$debits <- renderUI({
    #appel depuis le fichier exel_format.R
    htmltools::browsable(htmltools::tagList(dy_graph_Borja))
  })
  
  
  
  
  datasetInput_debit <- reactive({
    switch(input$dataset_deb,
           "Instant" = borja_id,
           "Journalier" = borja_dd )
  })
  
  output$mytableInstant = renderDataTable({
    datasetInput_debit()
    
  })
  
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste(input$dataset_deb, ".csv", sep = "")
    },
    content = function(file) {
      write.csv(datasetInput(), file, row.names = FALSE)
    }
  )
  
  #Niveau
  
  
  output$Niveaux <- renderUI({
    #appel depuis le fichier exel_format.R
    htmltools::browsable(htmltools::tagList(dy_graph_Borja_iwldwl))
  })
  
  datasetInput_niveau <- reactive({
    switch(input$dataset_wl,
           "Instant" = borja_iwl,
           "Journalier" = borja_dwl )
  })
  
  
  
  
  
  
  
  output$mytable_wl = renderDataTable({
    datasetInput_niveau()
    
  })
  
  
  
  
  
  output$downloadData_wl <- downloadHandler(
    filename = function() {
      paste(input$dataset_wl, ".csv", sep = "")
    },
    content = function(file) {
      write.csv(datasetInput(), file, row.names = FALSE)
    }
  )
  
  
  #physico-chimie
  
  output$physicochimie <- renderDygraph({
    
    
    dygraph(don_borja_phys_ok) %>%
      dySeries("Conductivite", label = "Conductivite(µS)") %>%
      dySeries("PH", label = "PH") %>%
      dySeries("Sediments", label = "Sediments(mg/l)") %>%
      dyOptions(stackedGraph = TRUE) %>%
      dyRangeSelector(height = 20)
  })
  
  
  
  
  
  
  
  output$mytable_pc = renderDataTable({
    
    don_borja_phys_ok
    
  })
  
  
  
  
  output$downloadData_pc <- downloadHandler(
    filename = function() {
      paste("borja_pc", ".csv", sep = "")
    },
    content = function(file) {
      write.csv( borja_phys , file, row.names = FALSE)
    }
  )
  
  
  #generation de la carte
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
  
  
  
  
  
  # output$mytableJournalier = renderDataTable({
  #   borja_dd
  #   
  # })
  
  #       output$progressBox <- renderInfoBox({
  #      infoBox(
  #         "Progress", paste0(25 + input$count, "%"), icon = icon("list"),
  #         color = "purple"
  #      )
  #         })
  
  #   output$approvalBox <- renderInfoBox({
  #     infoBox(
  #     "Approval", "80%", icon = icon("thumbs-up", lib = "glyphicon"),
  #     color = "yellow"
  #     )
  #   })
  # 
  #   output$progressBox2 <- renderInfoBox({
  #     infoBox(
  #     "Progress", paste0(25 + input$count, "%"), icon = icon("list"),
  #     color = "purple", fill = TRUE
  #     )
  #   })
  # 
  # output$approvalBox2 <- renderInfoBox({
  #   infoBox(
  #   "Approval", "80%", icon = icon("thumbs-up", lib = "glyphicon"),
  #   color = "yellow", fill = TRUE
  #   )
  # })
  
  
}


shinyApp(ui, server)