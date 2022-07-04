#' GetFileName
#'
#' Function as `basename()` with the option to not return the file extension
#' @param path.pth <character>: the path to the file.
#' @param ext.bln <logical>: if TRUE give the extension with the file, if FALSE give the file name without extension. (Default FALSE)
#' @return A character string
#' @examples
#' filePath.pth ="my/path/to/my/file.txt"
#' GetFileName(path.pth=filePath.pth, ext.bln=FALSE)
#' GetFileName(path.pth=filePath.pth, ext.bln=TRUE)

GetFileName = function(path.pth=NULL, ext.bln=FALSE){
    ifelse(ext.bln,
        fileName.str<-basename(path.pth),
        fileName.str<-sub(pattern = "(.*)\\..*$", replacement = "\\1", basename(path.pth))
    )
    return(fileName.str)
}
