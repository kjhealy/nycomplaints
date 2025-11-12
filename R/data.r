#' @title Complaints to NYC Council Constituent Services
#' @description Complaints data from New York City's CouncilStat
#' @format A data frame with `r fmt_nr(nycomplaints)` rows and `r fmt_nc(nycomplaints)` variables:
#' \describe{
#'   \item{\code{unique_key}}{character Complaint identifier.}
#'   \item{\code{account}}{character NYC Council District that created the casework, this may or not be the district that the constituent lives in.}
#'   \item{\code{opendate}}{date Date the casework is created by staff.}
#'   \item{\code{closedate}}{date Close Date is the date the casework was closed. A casework could be closed because the issue is resolved or because no further action could be taken.}
#'   \item{\code{complaint_type}}{character Broader category designated by staff for the constituent casework. complaint_type corresponds to NYC Council Legislative Committees.}
#'   \item{\code{descriptor}}{character Specific category designated by staff for the constituent casework.}
#'   \item{\code{zip}}{integer Zip code of the constituent.}
#'   \item{\code{borough}}{character Borough of the constituent.}
#'   \item{\code{city}}{character City of the constituent.}
#'   \item{\code{council_dist}}{Council District of the constituent.}
#'   \item{\code{community_board}}{Community Board of the constituent.}
#'
#'}
#' @details
#'
#' ```{r, results = "asis", echo = FALSE}
#' skimr::skim(nycomplaints)
#' ```
#'
#' Produced from NYC Open Data Initiative data. The dataset comes from CouncilStat, which is used by many NYC Council district offices to enter and track constituent cases that can range from issues around affordable housing, to potholes and pedestrian safety. This dataset aggregates the information that individual staff have input. However, district staffs handle a wide range of complex issues. Each offices uses the program differently, and thus records cases, differently and so comparisons between accounts may be difficult. Not all offices use the program. For more info - \url{http://labs.council.nyc/districts/data/}
#' @author Kieran Healy
#' @references \url{https://data.cityofnewyork.us/City-Government/NYC-Council-Constituent-Services/9hzi-kbqb},\url{http://labs.council.nyc/districts/data/}
"nycomplaints"


#' @title NYC Zip Codes by borough
#' @description Zip codes and borough names
#' @format A data frame with 211 rows and 5 variables:
#' - `zip` Zip code (char)
#' - `borough` Borough name
#' - `city` City name (USPS)
#' - `county` County name
#' - `long_county` County name, New York
#' - `short_county` One word county  name
#' @details Sources: https://www.nyc.gov/assets/planning/download/office/data-maps/nyc-population/census2000/sf1p11.xls
#' and https://worldpopulationreview.com/zips/new-york
"nyc_zips"

#' @title Census variables
#' @description Lookup table for ACS variable names
#' @format A data frame with 9 rows and 2 variables:
#' \describe{
#'   \item{\code{variable}}{character Census variable name}
#'   \item{\code{varname}}{character Short name used in zipcode table}
#'}
#' @details None.
"census_vars"
