library(shiny)
library(leaflet)
library(dplyr)
library(jsonlite)

issAPI <- "http://api.open-notify.org/iss-now.json"


ui <- fluidPage(
  
  h1("International Space Station - Current Position"),
  br(),
  leafletOutput("google_map",width = 1350, height = 580)
)

server <- function(input, output, session) {
  
  # Timer
  timer <- reactiveTimer(1000)
  
  # Update ISS Position every second
  iss_position <- reactive({
      timer()
      fromJSON(issAPI)
    }) 

  
  # Label
  popupContent <- reactive({
    
    paste(
      sep = "</br>",
      "<b><a href='https://es.wikipedia.org/wiki/Estaci%C3%B3n_Espacial_Internacional'>Internationl Space Station</a></b>",
      paste0("Latitud: ", iss_position()$iss_position$latitude),
      paste0("Longitud: ", iss_position()$iss_position$longitude) 
    )
    
  })
  
  # Leaflet Map
  output$google_map <- renderLeaflet({
    
    leaflet() %>% addTiles() %>%  
      setView(lng = as.numeric(iss_position()$iss_position$longitude),
              lat = as.numeric(iss_position()$iss_position$latitude),
              zoom = 5) %>% 
      addMarkers(lng = as.numeric(iss_position()$iss_position$longitude),
                 lat = as.numeric(iss_position()$iss_position$latitude),
                 popup = "International Space Station") %>% 
      addPopups(lng = as.numeric(iss_position()$iss_position$longitude),
                lat = as.numeric(iss_position()$iss_position$latitude), popupContent(),
                options = popupOptions(closeButton = FALSE)
                )
    
  })
}

shinyApp(ui, server)