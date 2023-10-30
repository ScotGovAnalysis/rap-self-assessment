
download_report_ui <- function(id) {
  
  ns <- NS(id)
  
  downloadButton(ns("button"), "Download report")
  
}

download_report_server <- function(input, output, session, input_data, metadata) {
  
  output$button <- downloadHandler(
    
    filename = paste0(lubridate::today(), "_rap-assessment.html"),
    
    content = function(file) {
      
      # Copy the report file to a temporary directory before processing it, in
      # case we don't have write permissions to the current working dir (which
      # can happen when deployed).
      tempReport <- file.path(tempdir(), "report.Rmd")
      file.copy("report.Rmd", tempReport, overwrite = TRUE)
      
      # Set up parameters to pass to Rmd document
      params <- c(
        list(input_data = input_data() |> select(criteria, status)),
        metadata()
      )
      
      # Knit the document, passing in the `params` list, and eval it in a
      # child of the global environment (this isolates the code in the document
      # from the code in this app).
      rmarkdown::render(tempReport, output_file = file,
                        params = params,
                        envir = new.env(parent = globalenv())
      )
    }
  ) 
  
}