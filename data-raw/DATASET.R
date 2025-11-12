## code to prepare `DATASET` dataset goes here

library(tidyverse)
library(here)

# Prep zip codes
ny_county_boros <- tribble(
  ~long_county                , ~county           , ~short_county , ~borough        ,
  "New York County, New York" , "New York County" , "New York"    , "Manhattan"     ,
  "Queens County, New York"   , "Queens County"   , "Queens"      , "Queens"        ,
  "Kings County, New York"    , "Kings County"    , "Kings"       , "Brooklyn"      ,
  "Bronx County, New York"    , "Bronx County"    , "Bronx"       , "Bronx"         ,
  "Richmond County, New York" , "Richmond County" , "Richmond"    , "Staten Island"
)

nyc_ziptable <- read_csv(here("data-raw", "nyc-ziptable.csv")) |>
  janitor::clean_names() |>
  select(-population_a) |>
  filter(county %in% ny_county_boros$county) |>
  rename(zip = zip_code)

nyc_zips <- nyc_ziptable |>
  left_join(ny_county_boros) |>
  relocate(borough, .after = zip)

usethis::use_data(nyc_zips, overwrite = TRUE, compress = "xz")


nycomplaints <- read_csv(
  here("data-raw", "NYC_Council_Constituent_Services_20251112.csv"),
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
  )
) |>
  janitor::clean_names() |>
  # filter(str_detect(zip, "(\\d{5})")) |>
  select(unique_key:opendate, closedate, everything())

usethis::use_data(nycomplaints, overwrite = TRUE, compress = "xz")


library(tidycensus)

all_vars_acs5 <-
  load_variables(year = 2021, dataset = "acs5")

census_vars <- tribble(
  ~variable    , ~varname            ,
  "B01001_001" , "population"        ,
  "B02001_002" , "white_alone"       ,
  "B02001_003" , "black_alone"       ,
  "B02001_005" , "asian_alone"       ,
  "B02001_008" , "two_or_more_races" ,
  "B03003_001" , "hispanic"          ,
  "B03002_003" , "nonhispanic_white" ,
  "B03002_004" , "nonhispanic_black" ,
  "B19013_001" , "med_hhinc"
)

# ugh
# https://github.com/walkerke/tidycensus/issues/475
zcta_info <- get_acs(
  geography = "zcta",
  variables = pop_vars$variable
)


usethis::use_data(census_vars, overwrite = TRUE, compress = "xz")


system("Rscript -e 'knitr::knit(\"README.Rmd\")'")
system("sed -i '' '1,3d' README.md")
