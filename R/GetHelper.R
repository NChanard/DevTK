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

GetHelper <- function(x.fun=NULL){
    if(inherits(x.fun,"call")){
        fun.name <- deparse(x.fun) |> strsplit("\\(") |> unlist()
        fun.name <- fun.name[1]
        x.fun <- eval(parse(text = fun.name ))
    }
    lines.chr_vec <- utils::capture.output(print(x.fun))
    funName.chr         <- lines.chr_vec[grep(x=lines.chr_vec, pattern="\\s+#Na.\\s")] |> sub(pattern="\\s+#Na.\\s",replacement="")
    Description.chr_vec <- lines.chr_vec[grep(x=lines.chr_vec, pattern="\\s+#De.\\s")] |> sub(pattern="\\s+#De.\\s",replacement="") |> paste0(collapse="\n\t\t")
    Usage.chr_vec       <- lines.chr_vec[grep(x=lines.chr_vec, pattern="\\s+#Us.\\s")] |> sub(pattern="\\s+#Us.\\s",replacement="") |> paste0(collapse="\n\t\t")
    Args.chr_vec        <- lines.chr_vec[grep(x=lines.chr_vec, pattern="\\s+#Ar.\\s")] |> sub(pattern="\\s+#Ar.\\s",replacement="") |> paste0(collapse="\n\t\t")
    Values.chr_vec      <- lines.chr_vec[grep(x=lines.chr_vec, pattern="\\s+#Va.\\s")] |> sub(pattern="\\s+#Va.\\s",replacement="") |> paste0(collapse="\n\t\t")
    Example.chr_vec     <- lines.chr_vec[grep(x=lines.chr_vec, pattern="\\s+#Ex.\\s")] |> sub(pattern="\\s+#Ex.\\s",replacement="") |> paste0(collapse="\n\t\t")
    return(
        paste0(
            "\n\n\n ",
            crayon::bold(crayon::underline(funName.chr)),
                "\n\n\t",crayon::underline("Description:"),
                    "\n\t\t",Description.chr_vec,
                "\n\n\t",crayon::underline("Usage:"),
                    "\n\t\t",Usage.chr_vec,
                "\n\n\t",crayon::underline("Arguments:"),
                    "\n\t\t",Args.chr_vec,
                "\n\n\t",crayon::underline("Value:"),
                    "\n\t\t",Values.chr_vec,
                "\n\n\t",crayon::underline("Examples:"),
                    "\n\t\t",Example.chr_vec,
            "\n\n\n "
        )
    )
}
