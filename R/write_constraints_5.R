#'\code{write_constraints_5}
#'
#' This code writes the list of constraints (5) of the ILP problem for one 
#' condition.
#' 

write_constraints_5 <- function(variables=variables, 
                                conditionIDX=conditionIDX) {
  
  constraints1 <- rep("", length(variables$idxEdgesDown))
  
  idx1 <- which(variables$signs==1)
  idx2 <- which(variables$signs==-1)
  
  constraints1[idx1] <- paste0(
    variables$variables[variables$idxEdgesDown[idx1]], 
    " + ",
    variables$variables[match(
      paste0(
        "Species ",
        unlist(
          strsplit(
            gsub(
              gsub(
                variables$exp[variables$idxEdgesDown[idx1]], 
                pattern = "ReactionDown ", 
                replacement = ""), 
              pattern = paste0(
                " in experiment ", 
                conditionIDX), 
              replacement = ""), 
            split = "="))[c(TRUE, FALSE)],
        " in experiment ",
        conditionIDX), variables$exp)], 
    " - ",
    variables$uTable[match(
      variables$variables[variables$idxEdgesDown[idx1]], 
      variables$uTable[, 2]), 1], " <= 0")
  
  constraints1[idx2] <- paste0(
    variables$variables[variables$idxEdgesDown[idx2]], 
    " - ",
    variables$variables[match(
      paste0(
        "Species ",
        unlist(
          strsplit(
            gsub(
              gsub(
                variables$exp[variables$idxEdgesDown[idx2]], 
                pattern = "ReactionDown ", 
                replacement = ""), 
              pattern = paste0(
                " in experiment ", 
                conditionIDX), 
              replacement = ""), 
            split = "="))[c(TRUE, FALSE)],
        " in experiment ", 
        conditionIDX), variables$exp)], 
    " - ",
    variables$uTable[match(
      variables$variables[variables$idxEdgesDown[idx2]], 
      variables$uTable[, 2]), 1], " >= 0")
  
  return(constraints1)
  
}