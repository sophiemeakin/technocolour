
pacman::p_load(here,
               rio,
               magrittr,
               tibble,
               dplyr)

techno_palettes <- rio::import(file = here("data-raw",
                                          "recordcolours.csv")) %>%
  tibble::tibble() %>%
  dplyr::select(-palette_url)

usethis::use_data(techno_palettes, overwrite = TRUE)
