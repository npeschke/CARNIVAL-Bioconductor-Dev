#'\code{write_constraints_3}
#'
#'This code writes the list of constraints (3) of the ILP problem for one 
#'condition.
#'

write_constraints_3 <- function(variables=variables) {
  
  constraints3 <- paste0(
    variables$variables[variables$idxEdgesUp], 
    " + ", 
    variables$variables[variables$idxEdgesDown], 
    " <= 1")
  
  return(constraints3)
  
}