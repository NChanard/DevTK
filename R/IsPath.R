#' IsPath
#'
#' Check if a variable is a path of an existing file
#' @param var.any <any>: a variable
#' @return  A boolean
#' @examples
#' file.create("test.file", showWarnings = TRUE)
#' IsPath("test.file")
#' IsPath("test.file2")
#' unlink("test.file")
IsPath <- function(var.any) {
    var.any %>% {is.character(.data) && file.exists(.data)} %>% return(.data)
}
        