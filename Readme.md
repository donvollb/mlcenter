# mlcenter
A lightweight R package for centering multilevel data.

## Overview
This package contains two functions for centering multilevel data. The first function, `cgm`, grand mean centers level 2 variables. The second function, `cwc`, group mean centers level 1 variables. This is equal to person mean centering when data is nested in person. It also contains an example dataset `ml_example`.

## Installation
You can install mlcenter from GitHub with:
```r
# Install the development version from GitHub
install.packages("devtools") # only if devtools is not already installed.
devtools::install_github("donvollb/mlcenter")
```

