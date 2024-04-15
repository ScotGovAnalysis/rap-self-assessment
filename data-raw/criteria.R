
criteria <- tibble::tribble(
  ~ id, ~ criteria,
  "0_1", "Code written in an open-source language; e.g. R", 
  "0_2", "Code well-commented", 
  "0_3", "Repository self-contained and well-structured", 
  "0_4", "Repository includes a README file",
  "1_1", "Code used for all data processing steps", 
  "1_2", "Manual steps minimised", 
  "1_3", "Using Git", 
  "1_4", "Code published publicly on GitHub", 
  "1_5", "Code reviewed by somebody inside the immediate team", 
  "1_6", "More detailed documentation",
  "2_1", "Code follows a style guide", 
  "2_2", "Outputs produced by code", 
  "2_3", "Functions used where appropriate", 
  "2_4", "Dependencies documented",
  "2_5", "Code reviewed by somebody outside the immediate team",
  "3_1", "Re-usable components are packaged", 
  "3_2", "Unit tests for functions", 
  "3_3", "Automated testing; e.g. using GitHub actions", 
  "3_4", "Computational environment documented"
) |>
  dplyr::mutate(level = substr(id, 1, 1), .before = criteria) |>
  dplyr::mutate(id = paste0("id_", id))

readr::write_rds(criteria, here::here("data", "criteria.rds"))
