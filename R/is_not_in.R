#' is_not_in
#'
#' 'is_not_in' and '\%ni\%' are binary operator, inverse to \%in\%.
#' @param ... <vector or NULL>: the values to be matched against
#' @return  A boolean
#' @examples
#' "A" %>% is_not_in(c("A","B","C"))
#' "A" %>% is_not_in(c("B","C","D"))
#' is_not_in("A", c("A","B","C"))
#' is_not_in("A", c("B","C","D"))

'is_not_in' <- Negate('%in%')
