#' Create a version number.
#'
#' Versioning
#' @description Create a version number based on date.
#' @return A character string.
#' @examples
#' Versioning()

Versioning <- function(){
    d <- Sys.time()
    s <- d %>% as.POSIXlt %>% magrittr::use_series("sec") %>% magrittr::multiply_by(1000) %>% round %>% as.character
    if(nchar(s)<5){ s <- paste0(rep(0,(5-nchar(s))),s)}
    paste0(format(d,"%Y:%m:%d:%H%M"),s) %>% return(.data)
}
