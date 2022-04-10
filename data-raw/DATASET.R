## code to prepare `DATASET` dataset goes here

library(tidyverse)
library(here)

nycomplaints <- read_csv(here("data-raw", "NYC_Council_Constituent_Services.csv"),
               col_types = cols(
                 UNIQUE_KEY = col_character(),
                 ACCOUNT = col_character(),
                 OPENDATE = col_date("%m/%d/%Y"),
                 COMPLAINT_TYPE = col_character(),
                 DESCRIPTOR = col_character(),
                 ZIP = col_character(),
                 BOROUGH = col_character(),
                 CITY = col_character(),
                 COUNCIL_DIST = col_character(),
                 COMMUNITY_BOARD = col_character(),
                 CLOSEDATE = col_date("%m/%d/%Y")
               )) %>%
  janitor::clean_names() %>%
  filter(str_detect(zip, "(\\d{5})")) %>%
  select(unique_key:opendate, closedate, everything())

usethis::use_data(nycomplaints, overwrite = TRUE, compress = "xz")


system("Rscript -e 'knitr::knit(\"README.Rmd\")'")
system("sed -i '' '1,3d' README.md")

