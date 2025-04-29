#' Centering Within Clusters
#'
#' @description
#' This function group mean centers level 1 variables in multilevel data. cwc stands for centered within clusters. When data is nested in person, this is equal to person mean centering.
#'
#' @param var The variable to be centered.
#' @param id The ID variable.
#'
#' @return The centered variable.
#'
#' @examples
#' var_L1_cwc <- cwc(var = ml_example$var_L1, id = ml_example$ID)
#'
#' @export

cwc <- function(var, id) {

  # check if var and id have the same length
  if (length(var) != length(id)) {
    stop("The variable var and the ID-Variable id have to be of the same length.")
  }

  var_cwc <- var - ave(var, id, FUN=function(x) mean(x, na.rm=T))

  return(var_cwc)

}

