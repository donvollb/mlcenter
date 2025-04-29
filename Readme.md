# mlcenter
A lightweight R package for centering multilevel data.

## Overview
This package contains two functions for centering multilevel data. The first function, `cgm`, grand mean centers level 2 variables. The second function, `cwc`, group mean centers level 1 variables. This is equal to person mean centering when data points are nested in persons. It also contains an example dataset `ml_example`.

## Installation
You can install mlcenter from GitHub with:
```r
# Install the development version from GitHub
install.packages("devtools") # only if devtools is not already installed.
devtools::install_github("donvollb/mlcenter")
```
## Examples

### Centering a Level 2 Variable at the Grand Mean
The `cgm` function is used to grand mean center level 2 variables in your dataset. 

```r
# Example of grand mean centering a level 2 variable
var_L2_cgm <- cgm(var = ml_example$var_L2, id = ml_example$ID)
```
In this example, `var_L2_cgm` will contain the grand mean centered version of `var_L2` from `ml_example`. 

### Centering a Level 1 Variable Within Clusters
The `cwc` function is used to group mean center level 1 variables within clusters. This is often referred to as person mean centering when data is nested in individuals.

```r
# Example of group mean centering a level 1 variable
var_L1_cwc <- cwc(var = ml_example$var_L1, id = ml_example$ID)
```
Here, `var_L1_cwc` will contain the group mean centered version of `var_L1` from `ml_example`, effectively centering each data point within its respective cluster.

