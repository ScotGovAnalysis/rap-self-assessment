
download_csv_ui <- function(id) {
  
  ns <- NS(id)
  
  downloadButton(ns("button"), "Download csv", class = "ds_button")
  
}

download_csv_server <- function(input, output, session, input_data) {
  
  # Downloadable csv of selected dataset ----
  output$button <- downloadHandler(
    filename = paste0(lubridate::today(), "_rap-assessment.csv"),
    content = function(file) {
      write.csv(
        input_data() |> 
          select(level, criteria, status = status_label, note), 
        file, 
        row.names = FALSE
      )
    }
  )
  
}