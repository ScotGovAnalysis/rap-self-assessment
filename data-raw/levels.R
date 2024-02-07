
levels <- c(`Aspiring` = 0,
            `Fundamental` = 1,
            `Intermediate` = 2,
            `Advanced` = 3)

readr::write_rds(levels, here::here("data", "levels.rds"))
