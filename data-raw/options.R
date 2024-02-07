
options <- c(`Complete` = "yes", 
             `In progress` = "progress", 
             `Not started` = "no",
             `Not assessed` = "not_assessed")

readr::write_rds(options, here::here("data", "options.rds"))
