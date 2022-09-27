#' Create a version number.
#'
#' Versioning
#' @description Create a version number based on date.
#' @return A character string.
#' @examples
#' Versioning()

Versioning <- function(){
    date.tim <- Sys.time()
    sec.tim <- as.character(round(as.POSIXlt(date.tim)$sec * 1000))
    sec.tim <- paste0(rep(0,(5-nchar(sec.tim))),sec.tim)
    version.chr <- paste0(format(date.tim,"%Y:%m:%d:%H%M"),sec.tim)
    return(version.chr)
}
