#' @title Complaints to NYC Council Constituent Services
#' @description Complaints data from New York City;s CouncilStat
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


#' @title Demographic data for NYC zip codes
#' @description USPS zip codes with corresponding census ZCTAs
#' @format A data frame with 68 rows and 10 variables:
#' \describe{
#'   \item{\code{zip}}{character Zip code}
#'   \item{\code{population}}{double Population count: B01001_001}
#'   \item{\code{white_alone}}{double B02001_002}
#'   \item{\code{black_alone}}{double B02001_003}
#'   \item{\code{asian_alone}}{double B02001_005}
#'   \item{\code{two_or_more_races}}{double B02001_008}
#'   \item{\code{hispanic}}{double B03003_001}
#'   \item{\code{nonhispanic_white}}{double B03002_003}
#'   \item{\code{nonhispanic_black}}{double B03002_004}
#'   \item{\code{med_hhinc}}{double B19013_001}
#'}
#' @details USPS zip code list with corresponding ZCTAs; demographic data from the ACS
"nyzip_demog"

#' @title Census variables
#' @description Lookup table for ACS variable names
#' @format A data frame with 9 rows and 2 variables:
#' \describe{
#'   \item{\code{variable}}{character Census variable name}
#'   \item{\code{varname}}{character Short name used in zipcode table}
#'}
#' @details None.
"census_vars"
