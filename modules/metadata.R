
metadata_ui <- function(id) {
  
  ns <- NS(id)
  
  fluidRow(
    column(width = 2, textInput(ns("pub_name"), "Publication Name")),
    column(width = 2, textInput(ns("team_lead"), "Team leader")),
    column(width = 2, textInput(ns("team_members"), "Team members"))
  )  
  
}

metadata_server <- function(input, output, session) {
  
  # Return a reactive list of metadata
  return(reactive(list(pub_name = input$pub_name, 
                       team_lead = input$team_lead,
                       team_members = input$team_members)))
  
}