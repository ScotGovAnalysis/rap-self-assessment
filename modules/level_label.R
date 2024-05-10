# This is a general function rather than a Shiny module

level_label <- function(level, level_options, rap = TRUE) {
  
  if(any(!level %in% level_options)) {
    stop("Level provided is not in options")
  }
  
  paste0(
    names(level_options[level_options == level]), 
    if(rap) " RAP" else ""
  )
  
}
