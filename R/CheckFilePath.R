#' Check if a file path is valid.
#'
#' CheckFilePath
#' @description Check if a file path is valid. If a file not exist, complete or create the file path with the name and extension given to the function.
#' @param path.pth <character>: the file path to check and complete if not complete.
#' @param fileName.chr <character>: the name of the file to complete if not in `path.pth`.
#' @param format.chr <character>: the extension format of the file to complete if not in `path.pth`.
#' @return A character string.
#' @examples
#' CheckFilePath(path.pth="my/path/to/my/file.txt")
#' CheckFilePath(path.pth=NULL,fileName.chr="file", format.chr="txt")

CheckFilePath <- function(path.pth=NULL, fileName.chr="file", format.chr="txt"){
    if(is.null(path.pth)){
        path.pth <- paste0(getwd())
    }
    if(dir.exists(path.pth)){
        if(substring(path.pth, nchar(path.pth), nchar(path.pth))!="/"){
            path.pth <- paste0(path.pth ,"/")
        }
        fileName.chr <- sub(x=fileName.chr, pattern=" ", replacement="_")
        path.pth <- paste0(path.pth,fileName.chr,"_",DevTK::Versioning())
    }
    if(dirname(path.pth)=="."){
        path.pth <- paste0(getwd(),"/",path.pth)
    }
    if(dir.exists(dirname(path.pth)) & is.na(DevTK::GetFileExtension(path.pth))){
        path.pth <- paste0(path.pth,".",format.chr)
    }
    return(path.pth)
}