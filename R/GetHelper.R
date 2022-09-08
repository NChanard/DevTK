#' Create pseudo documentation.
#'
#' GetHelper
#' @description Help developpers to create a documentation directly in a function. Usefull when the function is in a source script.
#' @param x.fun <function or call>: a function (or a call of) with the Helper header.
#' @return A character string ready to use in 'cat' function.
#' @examples
#' my_fun = function(x,y,z, help.bln=F){
#'     # Helper
#'         #Na. my_fun
#'         #De. A function that do the mean
#'         #Us. my_fun(x,y,z)
#'         #Ar. x (numeric, integer)
#'         #Ar. y (numeric, integer)
#'         #Ar. z (numeric, integer)
#'         #Va. the mean of x, y and z
#'         #Ex. my_fun(1,3,5)
#'         if(help.bln){return(cat(GetHelper(sys.call())))}
#'     # Run
#'         return(mean(c(x,y,z)))
#' }
#' my_fun(help.bln=TRUE)

GetHelper = function(x.fun=NULL){
    if(methods::is(x.fun,"call")){
        fun.name <- x.fun %>% deparse %>% stringr::str_split("\\(") %>% unlist %>% magrittr::extract(1)
        x.fun <- eval(parse(text = fun.name ))
    }
    lines.chr_vec <- x.fun %>% print %>% utils::capture.output()
    funName.chr         <- lines.chr_vec %>% stringr::str_subset("\\s+#Na.\\s") %>% stringr::str_replace('\\s+#Na.\\s','')
    Description.chr_vec <- lines.chr_vec %>% stringr::str_subset("\\s+#De.\\s") %>% stringr::str_replace('\\s+#De.\\s','') %>% paste0(collapse="\n\t\t ")
    Usage.chr_vec       <- lines.chr_vec %>% stringr::str_subset('\\s+#Us.\\s') %>% stringr::str_replace('\\s+#Us.\\s','') %>% paste0(collapse="\n\t\t ")
    Args.chr_vec        <- lines.chr_vec %>% stringr::str_subset('\\s+#Ar.\\s') %>% stringr::str_replace('\\s+#Ar.\\s','') %>% paste0(collapse="\n\t\t ")
    Values.chr_vec      <- lines.chr_vec %>% stringr::str_subset('\\s+#Va.\\s') %>% stringr::str_replace('\\s+#Va.\\s','') %>% paste0(collapse="\n\t\t ")
    Example.chr_vec     <- lines.chr_vec %>% stringr::str_subset('\\s+#Ex.\\s') %>% stringr::str_replace('\\s+#Ex.\\s','') %>% paste0(collapse="\n\t\t ")
    return(
        paste0(
            "\n\n\n ",
            crayon::bold(crayon::underline(funName.chr)),
                "\n\n\t",crayon::underline("Description:"),
                    "\n\t\t ",Description.chr_vec,
                "\n\n\t",crayon::underline("Usage:"),
                    "\n\t\t ",Usage.chr_vec,
                "\n\n\t",crayon::underline("Arguments:"),
                    "\n\t\t ",Args.chr_vec,
                "\n\n\t",crayon::underline("Value:"),
                    "\n\t\t ",Values.chr_vec,
                "\n\n\t",crayon::underline("Examples:"),
                    "\n\t\t ",Example.chr_vec,
            "\n\n\n "
        )
    )
}
