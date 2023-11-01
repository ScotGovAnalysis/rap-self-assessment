
download_report_ui <- function(id) {
  
  ns <- NS(id)
  
  downloadButton(ns("button"), "Download report", class = "ds_button")
  
}

download_report_server <- function(input, 
                                   output, 
                                   session, 
                                   input_data, 
                                   options,
                                   metadata) {
  
  output$button <- downloadHandler(
    
    filename = paste0(lubridate::today(), "_rap-assessment.html"),
    
    content = function(file) {
      
      # Copy the report file to a temporary directory before processing it, in
      # case we don't have write permissions to the current working dir (which
      # can happen when deployed).
      temp_dir <- tempdir()
      file.copy(paste0("markdown/", list.files("markdown")), 
                temp_dir, 
                overwrite = TRUE)
      
      # Set up parameters to pass to Rmd document
      params <- list(
        input_data = input_data(), 
        all_options = options,
        metadata = metadata()
      )
      
      # Knit the document, passing in the `params` list, and eval it in a
      # child of the global environment (this isolates the code in the document
      # from the code in this app).
      rmarkdown::render(file.path(temp_dir, "report.Rmd"), 
                        output_file = file,
                        params = params,
                        envir = new.env(parent = globalenv())
      )
    }
  ) 
  
}