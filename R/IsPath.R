#' Check if a character string is a file path.
#' 
#' IsPath
#' @description Check if a character string is a path of an existing file.
#' @param var.any <any>: a variable
#' @return  A boolean
#' @examples
#' file.create("test.file", showWarnings = TRUE)
#' IsPath("test.file")
#' IsPath("test.file2")
#' unlink("test.file")
IsPath <- function(var.any) {
    return(is.character(var.any) && file.exists(var.any))
}
        