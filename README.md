
<!-- README.md is generated from README.Rmd. Please edit that file -->



# nycomplaints <img src="man/figures/hex-nycomplaints-sm.png" align="right" width="240">

<!-- badges: start -->
[![R-CMD-check](https://github.com/kjhealy/nycomplaints/workflows/R-CMD-check/badge.svg)](https://github.com/kjhealy/nycomplaints/actions)
<!-- badges: end -->
The dataset comes from CouncilStat, which is used by many NYC Council district offices to enter and track constituent cases that can range from issues around affordable housing, to potholes and pedestrian safety. This dataset aggregates the information that individual staff have input. However, district staffs handle a wide range of complex issues. Each offices uses the program differently, and thus records cases, differently and so comparisons between accounts may be difficult. Not all offices use the program. For more info - http://labs.council.nyc/districts/data/

This is a teaching package; the data are not clean---in particular there are spurious zip codes in the complaints data, as well as other issues.

Data sourced from [NYC Open Data](https://data.cityofnewyork.us/City-Government/NYC-Council-Constituent-Services/9hzi-kbqb)

The package also includes `nyzip_demog` and `census_vars`. The former is a table of five-year ACS estimates of some demographic features by ZCTA. The latter is a table showing the specific Census Bureau variables used to construct the demographic table.


## Installation

You can install nycomplaints from [GitHub](https://github.com/kjhealy/nycomplaints) with:

``` r
remotes::install_github("kjhealy/nycomplaints@main")
```

## Loading the Data


```r
library(tidyverse) # Optional but strongly recommended
#> ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
#> ✔ dplyr     1.1.2     ✔ readr     2.1.4
#> ✔ forcats   1.0.0     ✔ stringr   1.5.0
#> ✔ ggplot2   3.4.2     ✔ tibble    3.2.1
#> ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
#> ✔ purrr     1.0.1     
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
#> ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
library(nycomplaints)

nycomplaints
#> # A tibble: 240,027 × 11
#>    unique_key   account opendate   closedate  complaint_type    descriptor zip  
#>    <chr>        <chr>   <date>     <date>     <chr>             <chr>      <chr>
#>  1 NYCC01506329 NYCC01  2015-01-02 2015-01-14 Aging             Senior Ce… 11220
#>  2 NYCC01506331 NYCC01  2015-01-04 2016-03-25 Aging             <NA>       11373
#>  3 NYCC01506332 NYCC01  2015-01-04 2016-03-25 Aging             <NA>       11373
#>  4 NYCC01506333 NYCC01  2015-01-04 2017-02-23 Health            Rats/Rode… 10006
#>  5 NYCC01506334 NYCC01  2015-01-05 2015-01-15 Land Use and Zon… <NA>       10003
#>  6 NYCC01506335 NYCC01  2015-01-06 2016-02-09 Transportation    Pot Holes  10002
#>  7 NYCC01506338 NYCC01  2015-01-06 2015-03-17 Transportation    Parking P… 10002
#>  8 NYCC01506342 NYCC01  2015-01-08 2015-01-08 Economy/Jobs      Business … 11355
#>  9 NYCC01506343 NYCC01  2015-01-08 2015-01-08 Immigration       Visas      10002
#> 10 NYCC01506345 NYCC01  2015-01-08 2015-01-08 Housing and Buil… Seeking a… 10013
#> # ℹ 240,017 more rows
#> # ℹ 4 more variables: borough <chr>, city <chr>, council_dist <chr>,
#> #   community_board <chr>

nyzip_demog
#> # A tibble: 68 × 10
#>    zip   population white_alone black_alone asian_alone two_or_more_races
#>    <chr>      <dbl>       <dbl>       <dbl>       <dbl>             <dbl>
#>  1 10001      26966       16963        2117        4527              2178
#>  2 10002      76807       24687        6453       30288              5880
#>  3 10003      54447       38481        2823        9110              2967
#>  4 10004       4795        2758         162        1593               262
#>  5 10005       8637        6496         147        1180               535
#>  6 10006       3894        2526         255         895               150
#>  7 10007       8194        6173         736        1064                78
#>  8 10009      60000       34924        4577        7995              5469
#>  9 10010      33193       22952        2952        4955              1491
#> 10 10011      51867       38919        2322        4854              3795
#> # ℹ 58 more rows
#> # ℹ 4 more variables: hispanic <dbl>, nonhispanic_white <dbl>,
#> #   nonhispanic_black <dbl>, med_hhinc <dbl>

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
