library(shiny)
library(htmltools)
require(semantic.dashboard)
library(ggplot2)
library(plyr)
library(dplyr)
library(leaflet)
library(DT)
library("data.table")  
library(lubridate)
#library(geosphere)


#map icons
#icon.glyphicon <- makeAwesomeIcon(icon= 'flag', markerColor = 'blue', iconColor = 'black')
icon.fa <- makeAwesomeIcon(icon = 'flag', markerColor = 'red', library='fa', iconColor = 'black')
icon.ion <- makeAwesomeIcon(icon = 'home', markerColor = 'green', library='ion')

#recommendation <- read.csv('recommendation.csv', stringsAsFactors = FALSE, header = TRUE)
ships_data=readRDS(file ="ships_data.rds")

#add a datetime column type to better manage date
ships_data$datetime_typeok<-as.POSIXct(ships_data$DATETIME,tz=Sys.timezone())

get_longest_course <- function(course)
{
  #Identification of all the courses made by the ship
  data_meri_course=subset(ships_data,(ships_data$SHIPNAME==course))
  
  #extraction of dates max & min for each unique  course
  temp_table_departure<- ddply(data_meri_course, "COURSE", summarize, min = min(datetime_typeok))
  temp_table_arrival <- ddply(data_meri_course, "COURSE", summarize, max = max(datetime_typeok))
  
  #join to calculate time difference
    df<-data.frame(temp_table_departure,temp_table_arrival)
  df$course_diff<- df$max-df$min
  
  #selection of the longest course
  course_selected = df[which.max(df$course_diff), ] 
  
  
  Point_depart = subset(data_meri_course,(data_meri_course$datetime_typeok == course_selected$min[1]) & (data_meri_course$COURSE == course_selected$COURSE[1]))
  Point_arival = subset(data_meri_course,(data_meri_course$datetime_typeok == course_selected$max[1]) & (data_meri_course$COURSE == course_selected$COURSE[1]))
  long_course= bind_rows(Point_depart,Point_arival)
  return(long_course)
}

# Calculate distance in meters between two points 
earth.dist <- function (long1, lat1, long2, lat2)
{
  rad <- pi/180
  a1 <- lat1 * rad
  a2 <- long1 * rad
  b1 <- lat2 * rad
  b2 <- long2 * rad
  dlon <- b2 - a2
  dlat <- b1 - a1
  a <- (sin(dlat/2))^2 + cos(a1) * cos(b1) * (sin(dlon/2))^2
  c <- 2 * atan2(sqrt(a), sqrt(1 - a))
  R <- 6378.145
  d <- R * c  *1000  #"in meters"
  return(d)
}



# Dashboard header carrying the title of the dashboard
header <- dashboardHeader(disable = TRUE)
# Sidebar content of the dashboard
sidebar <- dashboardSidebar(size = "wide",disable = TRUE,
  sidebarMenu(
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("bar chart")),
    menuItem(text = "Visit-us", href = "https://www.appsilondatascience.com", icon = icon("at"))),

)

# frow1 <- fluidRow(
#   # valueBoxOutput("value1"),
#   # valueBoxOutput("value2"),
#   # valueBoxOutput("value3"),
#   valueBoxOutput("Value4")
# 
# )
frow2 <- fluidRow(


  box(
    title = "Ship Courses",
    color = "blue",
    ribbon = TRUE,
    collapsible = TRUE,
    width = 8,
  leafletOutput("mymap")
  
  ),
  box(

    
    inputPanel(
      
      selectInput(inputId="choose_shipetype",
                  label="Select Vessel  type",
                  choices=unique(ships_data$ship_type),
                  selected=unique(ships_data$ship_type)[1]),
      
      selectInput(inputId="choose_shipe_name",
                  label="Select Vessel name",
                  choices=unique(ships_data$SHIPNAME),
                  selected=unique(ships_data$SHIPNAME)[1])
      # end of inputPanel
    )
    
    
    
    #selectInput("shypename",label =  "Shype name", choices ="NULL" )
    

  ),

 box(
   title = "Ship sailed - longest distance ",
   color = "blue",
   ribbon = TRUE,
   collapsible = TRUE,
   width = 8,
  verbatimTextOutput("longestdistance")
 ),
      
      
 
 
 
 
 
 
 
 
 
)

frow3<- fluidRow(
  dataTableOutput("tbchosen_shipes")
 
)
# combine the two fluid rows to make the body
body <- dashboardBody(title = "Dashboard", frow2,frow3)

ui <- dashboardPage(title = 'Vessels Dash',
                    header, sidebar, body)

# create the server functions for the dashboard
server <- function(input, output, session) {

  observe({ updateSelectInput(session,
                              inputId="choose_shipe_name", choices=unique(ships_data[ships_data$ship_type == input$choose_shipetype,"SHIPNAME"])
                              
                              
  )
  })
  
  
  
  output$longestdistance  <- renderText({ 
    
     #nrow(subset(ships_data,ships_data$ship_type==input$choose_shipetype & ships_data$SHIPNAME==input$choose_shipe_name))
    
   paste( earth.dist((get_longest_course(input$choose_shipe_name))$LON[1],(get_longest_course(input$choose_shipe_name))$LAT[1],
                                               (get_longest_course(input$choose_shipe_name))$LON[2],(get_longest_course(input$choose_shipe_name))$LAT[2]
                     ) , "meters"     
           )
    })
  
  
  # output$value4 <- renderValueBox({
  #   valueBox(
  #     value = formatC( nrow(subset(ships_data,ships_data$ship_type==input$choose_shipetype & ships_data$SHIPNAME==input$choose_shipe_name))
  #       , format = "d", big.mark = ','),
  #     subtitle =  'Total of courses:',
  #     icon = icon("ship icon"),
  #     color = "green",
  #     width = 5)
  # })
  
  # output$value4 <- renderValueBox({
  #   valueBox(
  #     value = formatC(  earth.dist((get_longest_course(input$choose_shipe_name))$LON[1],(get_longest_course(input$choose_shipe_name))$LAT[1],
  #                                  (get_longest_course(input$choose_shipe_name))$LON[2],(get_longest_course(input$choose_shipe_name))$LAT[2]
  #                                  )
  #                      , format = "d", big.mark = ','),
  #     subtitle =  'Ship sailed - longest distance  :',
  #     icon = icon("ship icon"),
  #     color = "green",
  #     width = 5)
  # })
  
  output$tbchosen_shipes<- renderDataTable(subset(ships_data,ships_data$ship_type==input$choose_shipetype & ships_data$SHIPNAME==input$choose_shipe_name),
                                           filter = 'top', extensions = c('Buttons', 'Scroller'),
                                                         options = list(scrollY = 650,
                                                                          scrollX = 500,
                                                                          deferRender = TRUE,
                                                                          scroller = TRUE,
                                                                           pageLength = 25,
                                                                          searching = FALSE)
                                           )
  
  
  
  
  # output$mymap <- renderLeaflet({
  #   leaflet() %>%
  #     addProviderTiles(providers$Stamen.TonerLite,
  #                      options = providerTileOptions(noWrap = TRUE)
  #     ) 
  #    # %>%addMarkers(data = points())
  # })
  
  output$mymap<- renderLeaflet({
     
    
    map <-  leaflet(  ) %>%
      
      
      # setView(lng = 18.632813, lat = 56.046733, zoom=5)%>% 
      # fitBounds(16.589355, 55.162333, 20.928955, 54.162333) %>%
      addMeasure(
        position = "bottomleft",
        primaryLengthUnit = "kilometers",
        #secondaryLengthUnit="meters",
        primaryAreaUnit = "sqmeters",
        
        activeColor = "#3D535D",
        completedColor = "#7D4479")%>%
      
      addTiles()  
    # %>%
    #   addMarkers(lng = ~LON,
    #              lat = ~LAT,
    #              popup = paste("SHIP ID:", ships_data$SHIP_ID, "<br>",
    #                            "SHIP name:", ships_data$SHIPNAME)
    #              )
    
    if (input$choose_shipe_name != 0) {
      longroute  <- get_longest_course(input$choose_shipe_name)
      
      map <-   addAwesomeMarkers(map,lng = longroute$LON[1], lat = longroute$LAT[1],    
                                    label='Origin',
                                    icon = icon.ion ,
                                    popup = paste("Ship name:", longroute$SHIPNAME[1], "<br>",
                                                  "Date:",longroute$datetime_typeok[1], "<br>", 
                                                  "Course:" ,longroute$COURSE[1], "<br>",
                                                  "Destination:",longroute$DESTINATION[1]
                                    )) 
      map <- addAwesomeMarkers(map,lng = longroute$LON[2], lat = longroute$LAT[2],
                                                              label='Destination',
                                                              icon = icon.fa,
                                                              popup = paste("Ship name:", longroute$SHIPNAME[2], "<br>",
                                                                            "Date:",longroute$datetime_typeok[2], "<br>", 
                                                                            "Course:" ,longroute$COURSE[2], "<br>",
                                                                            "Destination:",longroute$DESTINATION[2]
                                                              ))
    
      
      
      }
    
    
    map
    
    })
  
  
  
  
}

shinyApp(ui, server)
