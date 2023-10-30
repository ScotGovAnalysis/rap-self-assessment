
form_row_ui <- function(id, level, criteria, help_text){
  
  fluidRow(
    
    column(
      width = 4,
      criteria
    ),
    
    column(
      width = 3,
      prettyRadioButtons(
        inputId = id,
        label = NULL,
        choices = c("Yes", "No", "Working on it"),
        selected = "No", 
        status = "primary",
        shape = "curve",
        bigger = TRUE,
        inline = TRUE
      )
    ),
    
    column(
      width = 5,
      help_text
    )
    
  )  
  
}