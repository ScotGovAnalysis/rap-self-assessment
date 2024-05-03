
download_report_ui <- function(id) {
  
  ns <- NS(id)
  
  downloadButton(ns("button"), "Download report", class = "ds_button")
  
}

download_report_server <- function(input, 
                                   output, 
                                   session, 
                                   input_data,
                                   metadata) {
  
  output$button <- downloadHandler(
    
    filename = paste0(lubridate::today(), "_rap-assessment.html"),
    
    content = function(file) {
      
      # Create a temporary directory and copy all files required to render
      # report. This step is required as sometimes when app is deployed, 
      # we don't have write permissions to the current working directory.
      
      temp_dir <- tempdir()
      
      to_copy <- c(
        paste0("quarto-docs/", list.files("quarto-docs", recursive = TRUE)),
        "modules/level_label.R",
        "modules/details.R",
        "styles.scss",
        "partials/title-block.html",
        "images/SG-logo.jpg",
        paste0("data/", list.files(here::here("data")))
      )
      
      file.copy(to_copy, temp_dir, recursive = TRUE)
      
      # Save input data to temp_dir
      readr::write_rds(input_data(), file.path(temp_dir, "input.rds"))

      # Render output report from temp_dir
      xfun::in_dir(
        temp_dir,
        report <- quarto::quarto_render(
          "_report.qmd",
          output_file = "report.html",
          execute_params = list(metadata = metadata())
        )
      )
      
      # Copy output file from temp_dir to download file path
      file.copy(
        file.path(temp_dir, "report.html"),
        file
      )
      
    }
    
  ) 
  
}