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


library(tidycensus)

all_vars_acs5 <-
  load_variables(year = 2021, dataset = "acs5")

pop_vars <- tribble(
  ~variable, ~varname,
  "B01001_001", "population",
  "B02001_002", "white_alone",
  "B02001_003", "black_alone",
  "B02001_005", "asian_alone",
  "B02001_008", "two_or_more_races",
  "B03003_001", "hispanic",
  "B03002_003", "nonhispanic_white",
  "B03002_004", "nonhispanic_black",
  "B19013_001","med_hhinc")

# ugh
# https://github.com/walkerke/tidycensus/issues/475
zcta_info <- get_acs(
  geography = "zcta",
  variables = pop_vars$variable)

nyzips_usps <- readxl::read_xlsx(here::here("data-raw", "nyc_zips_usps.xlsx")) |>
  mutate(name = str_trim(str_remove(name, "NEW YORK NY"))) |>
  rename(zip = name)

nyzip_info <- zcta_info |>
  separate_wider_delim(NAME, delim = " ",
                       names = c("zcta", "zip")) |>
  filter(zip %in% nyzips_usps$zip) |>
  left_join(pop_vars, by = "variable")

nyzip_demog <- nyzip_info |>
  select(zip, varname, estimate) |>
  pivot_wider(names_from = varname, values_from = estimate)

census_vars <- pop_vars

usethis::use_data(nyzip_demog, overwrite = TRUE, compress = "xz")
usethis::use_data(census_vars, overwrite = TRUE, compress = "xz")


system("Rscript -e 'knitr::knit(\"README.Rmd\")'")
system("sed -i '' '1,3d' README.md")

