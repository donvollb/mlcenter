# mlcenter

A lightweight R package for centering multilevel data.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## Overview

This package contains two functions for centering multilevel data:

- `cgm()`: grand mean centers level 2 variables.
- `cwc()`: group mean centers level 1 variables (i.e., person mean centering when data is nested in individuals).

An example dataset `ml_example` is included for demonstration.

---

## Installation

You can install **mlcenter** from GitHub with:

```r
# Install the development version from GitHub
install.packages("devtools") # only if devtools is not already installed.
devtools::install_github("donvollb/mlcenter")
```

---

## Examples

### Centering a Level 2 Variable at the Grand Mean

```r
# Example of grand mean centering a level 2 variable
var_L2_cgm <- cgm(var = ml_example$var_L2, id = ml_example$ID)
```

In this example, `var_L2_cgm` will contain the grand mean centered version of `var_L2` from `ml_example`.

### Centering a Level 1 Variable Within Clusters

```r
# Example of group mean centering a level 1 variable
var_L1_cwc <- cwc(var = ml_example$var_L1, id = ml_example$ID, warn_zero_var = TRUE)
```

Here, `var_L1_cwc` will contain the group mean centered version of `var_L1` from `ml_example`, effectively centering each data point within its respective cluster. `warn_zero_var` is set to TRUE by default and returns a warning for clusters with zero variance in `var`.

---

## License

This package is released under the [MIT License](LICENSE).

