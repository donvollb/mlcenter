#' Centering At The Grand Mean
#'
#' @description
#' This function grand mean centers level 2 variables in multilevel data. cgm stands for centered at the grand mean.
#'
#' @param var The variable to be centered.
#' @param id The ID variable.
#'
#' @return The centered variable.
#'
#' @examples
#' var_L2_cgm <- cgm(var = ml_example$var_L2, id = ml_example$ID)
#'
#' @export

cgm <- function(var, id) {

  # check if var and id have the same length
  if (length(var) != length(id)) {
    stop("The variable var and the ID-Variable id have to be of the same length.")
  }

  var_cgm <- var - mean(tapply(var, id, 
    mean, na.rm=TRUE), na.rm=TRUE)

  return(var_cgm)

}

