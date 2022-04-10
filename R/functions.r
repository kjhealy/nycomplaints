#' @importFrom magrittr %>%
#' @export
magrittr::`%>%`

#' @title fmt_nc
#' @description Format fmt_nc in df
#' @param x df
#' @return formatted string
#' @details use in fn documentation
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname fmt_nc
#' @author Kieran Healy
fmt_nc <- function(x){
  prettyNum(ncol(x), big.mark=",", scientific=FALSE)
}


#' @title fmt_nr
#' @description Format fmt_nr in df
#' @param x df
#' @return formatted string
#' @details use in fn documentation
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @author Kieran Healy
fmt_nr <- function(x){
  prettyNum(nrow(x), big.mark=",", scientific=FALSE)
}
