#' add_attributes
#'
#' Add a list as attributes to any object.
#' @param var.any <any>: an object.
#' @param attribute.lst <list>: a named list of new attributes.
#' @param overwrite.bln <logical>: a boolean that indicate if need and overwrite if two attributes (new and old) have same name. (Default FALSE)
#' @return the object with new attributes
#' @examples
#' x <- 1:10
#' x
#' attribute.lst = list(dim=c(2,5))
#' x <- add_attributes(x,attribute.lst)
#' x
#' attribute.lst = list(dim=c(5,2))
#' x <- add_attributes(x,attribute.lst)
#' x
#' x <- add_attributes(x,attribute.lst,overwrite.bln=TRUE)
#' x

add_attributes <- function(var.any=NULL, attribute.lst=NULL, overwrite.bln=FALSE){
    intersectAttr <- intersect(names(attributes(var.any)),  names(attribute.lst))
    if(overwrite.bln & length(intersectAttr)){
        attribute.lst <- c(attributes(var.any)[which(names(attributes(var.any)) != intersectAttr)] , attribute.lst)
    }else if (length(intersectAttr)){
        attribute.lst <- c(attributes(var.any) , attribute.lst[which(names(attribute.lst) != intersectAttr)])
    }else{
        attribute.lst <- c(attributes(var.any) , attribute.lst)
    }
    var.any %>% set_attributes(.,attribute.lst) %>% return
}
