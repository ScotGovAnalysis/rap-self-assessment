
library(shiny)
library(dplyr)
library(here)
library(readr)
library(purrr)
library(tibble)

walk(list.files("modules", ".R$", full.names = TRUE), source)

criteria <- read_csv(here("criteria.csv"), show_col_types = FALSE)

options <- c(`Complete` = "yes", 
             `In progress` = "progress", 
             `Not started` = "no",
             `Not assessed` = "not_assessed")

ui <- fluidPage(
    
    lang = "en",
    
    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
        tags$title("RAP Self Assessment")
    ),
    
    h1("Scottish Government RAP Self Assessment") |> 
        tagAppendAttributes(class = "title-class"),
    
    br(),
    
    metadata_ui("metadata"),
    
    form_ui("form", criteria, options),
    
    fluidRow(
        column(width = 2, download_report_ui("report")),
        column(width = 2, download_csv_ui("csv"))
    )
    
)

server <- function(input, output) {

    assessment <- callModule(form_server, "form", criteria$id)
    
    data_output <- reactive({
        criteria |>
            rowwise() |> 
            mutate(
                status = assessment()[[id]],
                status_label = case_when(
                    status == "not_assessed" ~ "Not assessed",
                    TRUE ~ names(options)[match(status, options)]
                )
            )
    })
    
    metadata <- callModule(metadata_server, "metadata")
    
    callModule(download_csv_server, "csv", data_output)
    
    callModule(download_report_server, "report", data_output, options, metadata)
    
}

# Run the application 
shinyApp(ui = ui, server = server)
