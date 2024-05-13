
metadata_ui <- function(id) {
  
  ns <- NS(id)
  
  tagList(
    textInput(ns("name"), "Project name") |>
      tagAppendAttributes(class = "metadata"),
    textInput(ns("lead"), "Project lead") |>
      tagAppendAttributes(class = "metadata"),
    textInput(ns("members"), "Project team members"),
  )
  
}

metadata_server <- function(input, output, session) {
  
  # Return a reactive list of metadata
  return(reactive(list(name = input$name, 
                       lead = input$lead,
                       members = input$members)))
  
}