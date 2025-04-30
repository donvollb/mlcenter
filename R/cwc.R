#' Centering Within Clusters
#'
#' @description
#' This function group mean centers level 1 variables in multilevel data. cwc stands for centered within clusters. When data is nested in person, this is equal to person mean centering.
#'
#' @param var The variable to be centered.
#' @param id The ID variable.
#' @param warn_zero_var Whether to warn about clusters with zero variance.
#'
#' @return The centered variable.
#'
#' @examples
#' var_L1_cwc <- cwc(var = ml_example$var_L1, id = ml_example$ID, warn_zero_var = TRUE)
#'
#' @export

cwc <- function(var, id, warn_zero_var = TRUE) {
  #— 1) basic sanity checks
  if (length(var) != length(id)) {
    stop("`var` and `id` must be the same length.")
  }
  if (!is.numeric(var)) {
    stop("`var` must be numeric.")
  }
  if (any(is.na(id))) {
    warning("There are NAs in `id`; corresponding outputs will be NA.")
  }
  if (length(unique(na.omit(id))) == 1) {
    warning("There is only one unique value in `id`.")
  }

  #— 2) focus on non‐NA IDs
  valid <- !is.na(id)
  var_k <- var[valid]
  id_k  <- id[valid]

  #— 3) split into clusters
  splt <- split(var_k, id_k)

  #— 4) compute cluster means AND variance in one pass
  stats <- lapply(splt, function(x) {
    x0 <- na.omit(x)
    list(
      mean = if (length(x0) >= 1) mean(x0) else NA_real_,
      var  = if (length(x0) > 1) var(x0)  else NA_real_
    )
  })
  cluster_means <- vapply(stats, `[[`, numeric(1), "mean")
  cluster_vars  <- vapply(stats, `[[`, numeric(1), "var")

  #— 5) warn (once) about clusters with no variance
  if (warn_zero_var) {
    zero_var_ids <- names(cluster_vars)[
      is.na(cluster_vars) | cluster_vars < 1e-16
    ]
    if (length(zero_var_ids) > 0) {
      warning(
        "Clusters with no within‐cluster variance: ",
        paste(zero_var_ids, collapse = ", ")
      )
    }
  }

  #— 6) subtract group‐mean, preserve NA for missing IDs
  out <- rep(NA_real_, length(var))
  out[valid] <- var_k - cluster_means[as.character(id_k)]

  out
}



