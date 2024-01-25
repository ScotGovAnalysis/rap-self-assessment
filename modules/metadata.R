
metadata_ui <- function(id) {
  
  ns <- NS(id)
  
  tagList(
    textInput(ns("pub_name"), "Publication Name") |>
      tagAppendAttributes(class = "form-sidebar"),
    textInput(ns("team_lead"), "Team leader") |>
      tagAppendAttributes(class = "form-sidebar"),
    textInput(ns("team_members"), "Team members") |>
      tagAppendAttributes(class = "form-sidebar")
  )
  
}

metadata_server <- function(input, output, session) {
  
  # Return a reactive list of metadata
  return(reactive(list(pub_name = input$pub_name, 
                       team_lead = input$team_lead,
                       team_members = input$team_members)))
  
}