
form_ui <- function(id, criteria, options) {
  
  ns <- NS(id)
  
  # Recode name of 'not_assessed' for form and reorder to appear first
  options <-
    enframe(options) |>
    mutate(name = ifelse(value == "not_assessed", "Select progress", name)) |>
    arrange(value != "not_assessed") |>
    deframe()
  
  selectInput(
    inputId = ns("form"),
    label = criteria,
    choices = options,
    selected = "Select progress"
  ) |>
    tagAppendAttributes(class = "hide-label")

}

form_server <- function(input, output, session) {
  
  return(reactive(input$form))
  
}