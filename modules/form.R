
form_ui <- function(id, criteria_data, levels, options) {
  
  ns <- NS(id)
  
  # Check that data has required variables
  exp_vars <- c("id", "level", "criteria")
  if(any(!exp_vars %in% names(criteria_data))) {
    cli::cli_abort(
      paste("{.var criteria_data} is missing at least one of the following",
            "variables: {exp_vars}.")
    )
  }
  
  # Recode name of 'not_assessed' for form and reorder to appear first
  options <-
    enframe(options) |>
    mutate(name = ifelse(value == "not_assessed", "Select progress", name)) |>
    arrange(value != "not_assessed") |>
    deframe()
  
  # Function to create form row
  form_row <- function(id, criteria) {
    tagList(
      selectInput(
        inputId = id,
        label = criteria,
        choices = options,
        selected = "Select progress"
      )
    )
  }
  
  tagList(
    map(
      unique(criteria_data$level),
      function(x) {
        tagList(
          pmap(criteria_data |> 
                 filter(level == x) |> 
                 mutate(id = ns(id)) |>
                 select(id, criteria), 
               form_row
          )
        )
      }
    )      
  )  
}

form_server <- function(input, output, session, criteria_id) {
  
  return(reactive(
    map(set_names(criteria_id), ~ input[[.x]])
  ))
  
}