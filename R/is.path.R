#' is.path
#'
#' Check if a variable is a path of an existing file
#' @param var.any <any>: a variable
#' @return  A boolean
#' @examples
#' file.create("test.file", showWarnings = TRUE)
#' is.path("test.file")
#' is.path("test.file2")
#' unlink("test.file")
is.path <- function(var.any) {
    var.any %>% {is.character(.) && file.exists(.)} %>% return
}
        