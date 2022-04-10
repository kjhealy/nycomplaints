
<!-- README.md is generated from README.Rmd. Please edit that file -->



# nycomplaints <img src="man/figures/hex-nycomplaints-sm.png" align="right" width="240">

<!-- badges: start -->
[![R-CMD-check](https://github.com/kjhealy/nycomplaints/workflows/R-CMD-check/badge.svg)](https://github.com/kjhealy/nycomplaints/actions)
<!-- badges: end -->
The dataset comes from CouncilStat, which is used by many NYC Council district offices to enter and track constituent cases that can range from issues around affordable housing, to potholes and pedestrian safety. This dataset aggregates the information that individual staff have input. However, district staffs handle a wide range of complex issues. Each offices uses the program differently, and thus records cases, differently and so comparisons between accounts may be difficult. Not all offices use the program. For more info - http://labs.council.nyc/districts/data/

Data sourced from [NYC Open Data](https://data.cityofnewyork.us/City-Government/NYC-Council-Constituent-Services/9hzi-kbqb)

## Installation

There are two ways to install the `nycomplaints` package. 

### Install direct from GitHub

You can install nycomplaints from [GitHub](https://github.com/kjhealy/nycomplaints) with:

``` r
remotes::install_github("kjhealy/nycomplaints@main")
```

### Installation using `drat`

While using `install_github()` works just fine, it would be nicer to be able to just type `install.packages("nycomplaints")` or `update.packages("nycomplaints")` in the ordinary way. We can do this using Dirk Eddelbuettel's [drat](http://eddelbuettel.github.io/drat/DratForPackageUsers.html) package. Drat provides a convenient way to make R aware of package repositories other than CRAN.

First, install `drat`:


```r

if (!require("drat")) {
    install.packages("drat")
    library("drat")
}
```

Then use `drat` to tell R about the repository where `nycomplaints` is hosted:



```r
drat::addRepo("kjhealy")
```

You can now install `nycomplaints` in the usual way:


```r
install.packages("nycomplaints")
```

To ensure that the `nycomplaints` repository is always available, you can add the following line to your `.Rprofile` or `.Rprofile.site` file:



```r
drat::addRepo("kjhealy")
```


With that in place you'll be able to do `install.packages("nycomplaints")` or `update.packages("nycomplaints")` and have everything work as you'd expect. 

Note that my drat repository only contains data packages that are not on CRAN, so you will never be in danger of grabbing the wrong version of any other package.

## Loading the Data


```r
library(tidyverse) # Optional but strongly recommended
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
#> ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
#> ✓ tibble  3.1.6     ✓ dplyr   1.0.8
#> ✓ tidyr   1.2.0     ✓ stringr 1.4.0
#> ✓ readr   2.1.2     ✓ forcats 0.5.1
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> x readr::edition_get()   masks testthat::edition_get()
#> x dplyr::filter()        masks stats::filter()
#> x purrr::is_null()       masks testthat::is_null()
#> x dplyr::lag()           masks stats::lag()
#> x readr::local_edition() masks testthat::local_edition()
#> x dplyr::matches()       masks tidyr::matches(), testthat::matches()
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
#> # … with 240,017 more rows, and 4 more variables: borough <chr>, city <chr>,
#> #   council_dist <chr>, community_board <chr>
```
