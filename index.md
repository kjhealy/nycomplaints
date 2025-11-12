# nycomplaints ![](reference/figures/hex-nycomplaints-sm.png)

This is a teaching package; the data are not clean—in particular there
are spurious zip codes in the complaints data, as well as other issues.

Data sourced from [NYC Open
Data](https://data.cityofnewyork.us/City-Government/NYC-Council-Constituent-Services/9hzi-kbqb)

The package also includes `nyc_zips` and `census_vars`. The former is a
table of NYC zip codes. The latter is a table the names of some ACS
variables.

## Installation

You can install nycomplaints from
[GitHub](https://github.com/kjhealy/nycomplaints) with:

``` r
remotes::install_github("kjhealy/nycomplaints@main")
```

## Loading the Data

``` r
library(tidyverse) # Optional but strongly recommended
library(nycomplaints)

nycomplaints
#> # A tibble: 341,299 × 11
#>    unique_key   account opendate   closedate  complaint_type    descriptor zip  
#>    <chr>        <chr>   <date>     <date>     <chr>             <chr>      <chr>
#>  1 NYCC34519748 NYCC34  2025-01-09 NA         Governmental Ope… Voting In… 11385
#>  2 NYCC34519746 NYCC34  2025-01-09 2025-01-09 Utilities         Con Edison 11237
#>  3 NYCC34519742 NYCC34  2025-01-08 2025-01-08 Housing and Buil… Heat/Hot … 11249
#>  4 NYCC34519741 NYCC34  2025-01-06 2025-01-08 Housing and Buil… Heat/Hot … 11211
#>  5 NYCC34519743 NYCC34  2024-12-23 2025-01-09 Housing and Buil… Maintenan… 11211
#>  6 NYCC34519744 NYCC34  2024-12-11 2025-01-09 General Welfare   SSI and S… 11211
#>  7 NYCC34519745 NYCC34  2024-09-05 2025-01-09 Finance           Tax Prepa… 11385
#>  8 NYCC31505454 NYCC31  2024-06-04 NA         Sanitation        OVERGROWN… <NA> 
#>  9 NYCC31505447 NYCC31  2024-05-30 NA         <NA>              <NA>       11413
#> 10 NYCC31505450 NYCC31  2024-05-30 NA         <NA>              <NA>       11413
#> # ℹ 341,289 more rows
#> # ℹ 4 more variables: borough <chr>, city <chr>, council_dist <chr>,
#> #   community_board <chr>

nyc_zips
#> # A tibble: 211 × 6
#>      zip borough       city          county          long_county    short_county
#>    <dbl> <chr>         <chr>         <chr>           <chr>          <chr>       
#>  1 11368 Queens        Corona        Queens County   Queens County… Queens      
#>  2 11208 Brooklyn      Brooklyn      Kings County    Kings County,… Kings       
#>  3 11385 Queens        Ridgewood     Queens County   Queens County… Queens      
#>  4 11373 Queens        Elmhurst      Queens County   Queens County… Queens      
#>  5 11226 Brooklyn      Brooklyn      Kings County    Kings County,… Kings       
#>  6 11236 Brooklyn      Brooklyn      Kings County    Kings County,… Kings       
#>  7 10467 Bronx         Bronx         Bronx County    Bronx County,… Bronx       
#>  8 10025 Manhattan     New York      New York County New York Coun… New York    
#>  9 11207 Brooklyn      Brooklyn      Kings County    Kings County,… Kings       
#> 10 10314 Staten Island Staten Island Richmond County Richmond Coun… Richmond    
#> # ℹ 201 more rows

census_vars
#> # A tibble: 9 × 2
#>   variable   varname          
#>   <chr>      <chr>            
#> 1 B01001_001 population       
#> 2 B02001_002 white_alone      
#> 3 B02001_003 black_alone      
#> 4 B02001_005 asian_alone      
#> 5 B02001_008 two_or_more_races
#> 6 B03003_001 hispanic         
#> 7 B03002_003 nonhispanic_white
#> 8 B03002_004 nonhispanic_black
#> 9 B19013_001 med_hhinc
```
