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
  # basic checks
  if (length(var) != length(id)) {
    stop("The variable var and the ID-Variable id have to be of the same length.")
  }
  if (!is.numeric(var)) {
    stop("The variable var has to be numeric.")
  }
  if (any(is.na(id))) {
    warning("There are NAs in the ID-Variable. NAs will be returned for these IDs.")
  }
  if (length(unique(id)) == 1) {
    warning("There is only one unique value in `id`.")
  }
  
  # focus on non-NA IDs
  valid <- !is.na(id)
  splt  <- split(var[valid], id[valid])
  
  # single-pass over each cluster: get its constant value and its variance
  stats <- lapply(splt, function(x) {
    x0  <- na.omit(x)
    val <- if (length(x0) >= 1) x0[1] else NA_real_
    v   <- if (length(x0) > 1) var(x0)     else 0
    c(val = val, var = v)
  })
  
  # extract as named numeric vectors
  per_id    <- vapply(stats, `[[`, numeric(1), "val")
  var_by_id <- vapply(stats, `[[`, numeric(1), "var")
  
  # ensure constant‐within‐ID
  bad <- names(var_by_id)[var_by_id > 0]
  if (length(bad) > 1e-16) {
    stop(
      "Non-zero within-cluster variance detected for ID(s): ",
      paste(bad, collapse = ", "),
      call. = FALSE
    )
  }
  
  # grand mean of one value per ID
  GM  <- mean(per_id, na.rm = TRUE)
  
  # subtract and preserve NA for missing IDs
  out <- ifelse(is.na(id), NA_real_, var - GM)
  
  return(out)
}


