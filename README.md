
<!-- README.md is generated from README.Rmd. Please edit that file -->

# neartools

<!-- badges: start -->
<!-- badges: end -->

During harmonization, there are many repetitive works.

The goal of creating this package is to practice the “don’t repeat
yourself” (DRY) principle and make the harmonization more handy.

Currently, this package contains functions as follows:

-   `sav_to_csv`: Convert all the SPSS data files (*.sav*) to csv files.
    This conversion is needed because the maelstrom harmonization
    package does not read *.sav* data. This function can prevent
    repetitive work of converting *.sav* to *.csv* one by one. More
    details please see description in `?sav_to_csv()`
-   `pretty_template`: Automatically create an ‘rmd’ folder, create &
    open an rmd file with a nice looking template. This facilitates the
    communication with researchers & tracking the records. By default it
    complies an *html* file. More details please see description in
    `?pretty_template()`

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
pretty_template("Reply to Prof XXX")
```
