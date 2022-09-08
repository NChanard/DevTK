#' Get file extension
#'
#' GetFileExtension
#' @description Give the extension of a file from the path.
#' @param path.pth <character>: the path to the file.
#' @return A character string
#' @examples
#' filePath.pth ="my/path/to/my/file.txt"
#' GetFileExtension(path.pth=filePath.pth)

GetFileExtension <- function(path.pth=NULL) {
    GetFileName(path.pth, ext.bln=TRUE)  %>%
    strsplit(".", fixed = TRUE) %>%
    unlist %>%
    magrittr::extract(2) %>%
    return(.data)
}

