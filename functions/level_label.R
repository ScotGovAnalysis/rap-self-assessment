level_label <- function(level, level_options, case = c("upper", "lower")) {
  
  case <- match.arg(case)
    
  if(any(!level %in% level_options)) {
    stop("Level provided is not in options")
  }
  
  paste(
    ifelse(case == "upper", "Level", "level"), 
    level, "-", 
    names(level_options[level_options == level]), "RAP"
  )
}
