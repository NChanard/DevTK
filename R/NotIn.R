#' NotIn
#'
#' 'NotIn' and '\%ni\%' are binary operator, inverse to \%in\%.
#' @param ... <vector or NULL>: the values to be matched against
#' @return  A boolean
#' @examples
#' "A" %>% NotIn(c("A","B","C"))
#' "A" %>% NotIn(c("B","C","D"))
#' NotIn("A", c("A","B","C"))
#' NotIn("A", c("B","C","D"))

'NotIn' <- Negate('%in%')
