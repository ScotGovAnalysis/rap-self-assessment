
library(readr)
library(here)
library(dplyr)
library(stringr)

metadata <- list(
  pub_name = "Test pub name", 
  team_lead = "Test team lead",
  team_members = "Test team members"
)

all_levels <- c(`Aspiring` = 0,
                `Fundamental` = 1,
                `Intermediate` = 2,
                `Advanced` = 3)

all_options <- c(`Complete` = "yes", 
                 `In progress` = "progress", 
                 `Not started` = "no",
                 `Not assessed` = "not_assessed")

input_data <- 
  read_csv(here("criteria.csv"), show_col_types = FALSE) |>
  mutate(id = paste0("id_", str_replace(id, "\\.", "_"))) |>
  mutate(
    status = sample(all_options, n(), replace = TRUE),
    status_label = case_when(
      status == "not_assessed" ~ "Not assessed",
      TRUE ~ names(all_options)[match(status, all_options)]
    )
  )

# params <- list(
#   input_data = input_data, 
#   all_options = all_options,
#   all_levels = all_levels,
#   metadata = metadata
# )
