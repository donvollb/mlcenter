#' Example Multilevel Data
#'
#' Generated Multilevel Data with an ID variable, one level 1 variable and one level 2 variable.
#'
#' @format ## `ml_example`
#' A data frame with 500 rows and 3 columns:
#' \describe{
#'   \item{ID}{An ID-Variable identifying clusters}
#'   \item{var_l1}{A randomly generated level 1 variable. The means of the cluster-specific normal distributions were simulated with an uniform distribution between -1 and 1. The SDs were simulated with an uniform distribution between 0 and 1.}
#'   \item{var_l2}{A randomly generated level 2 variable drawn from a normal distribution with a mean of 1 and an SD of 1.}
#' }
"ml_example"