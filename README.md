
<!-- README.md is generated from README.Rmd. Please edit that file -->

# neartools

<!-- badges: start -->
<!-- badges: end -->

During harmonization, there are many repetitive works.

The goal of creating this package is to practice the “don’t repeat
yourself” (DRY) principle and make the harmonization more handy.

## Installation

You can install the development version of neartools from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Bolin-Wu/neartools")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(neartools)

?sav_to_csv
## code usage
sav_to_csv("original_data", "SNAC-K")
```
