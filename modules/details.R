details <- function(title = "What does this mean?", 
                    file_to_knit, 
                    env = environment()) {
  
  cat(paste0(
    "<details>",
    "<summary class=\"details_summary\">", 
    title,
    "</summary>",
    "<div class=\"details_text\">",
    knitr::knit_child(file_to_knit,
                      envir = env,
                      quiet = TRUE),
    "</div>",
    "</details>"
  ))
  
}
