# Script for creating an example multilevel data set

# create an empty data frame with three columns (ID, var_L1 and var_L2) and 500 rows
ml_example <- data.frame(ID = rep(1:50, each = 10), var_L1 = rep(NA, 500), var_L2 = rep(NA, 500))

# create a level 2 variable in var_L2 with a mean of 1 and an SD of 1
set.seed(1234)
ml_example$var_L2 <- unlist(by(ml_example$ID, ml_example$ID, function(x) rep(rnorm(1, 1, 1), length(x))))

# create random means and SDs for var_L1
means <- runif(50, -1, 1)
sds <- runif(50, 0, 1)

# create a level 1 variable in var_L1 with means and SDs from above
ml_example$var_L1 <- unlist(by(ml_example$ID, ml_example$ID, function(x) rnorm(length(x), means[x], sds[x])))

# save the data frame
usethis::use_data(ml_example, overwrite = TRUE)
