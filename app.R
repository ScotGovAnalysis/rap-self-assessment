
library(shiny)
library(shinyWidgets)
library(dplyr)
library(here)
library(readr)
library(purrr)

walk(list.files("modules", ".R$", full.names = TRUE), source)

criteria <- read_csv(here("criteria.csv"), show_col_types = FALSE)

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
    
    br(),
    
    pmap(criteria, form_row_ui),
    
    br(),
    
    fluidRow(
        column(width = 1, download_csv_ui("csv")),
        column(width = 1, download_report_ui("report"))
    )

)

server <- function(input, output) {

    data_output <- reactive({
        criteria %>% 
            rowwise() %>% 
            mutate(status = input[[id]])
    })
    
    metadata <- callModule(metadata_server, "metadata")
    
    callModule(download_csv_server, "csv", data_output)
    
    callModule(download_report_server, "report", data_output, metadata)
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
