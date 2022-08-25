
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Motivation

<!-- badges: start -->
<!-- badges: end -->

There are many repetitive works when doing data harmonization and
keeping track of communication with researchers.

The goal of creating this package is to practice the “don’t repeat
yourself” (DRY) principle, making the daily work more handy.

# Functions

Currently, this package contains functions as follows:

-   `sav_to_csv`: Convert all the SPSS data files (*.sav*) to csv files.
    This conversion is needed because the maelstrom harmonization
    package does not read *.sav* data. This function can prevent
    repetitive work of converting *.sav* to *.csv* one by one.  
    More details please see description in `?sav_to_csv()`

-   `pretty_template`: Automatically create an ‘rmd’ folder, create &
    open an rmd file with a nice looking template. This facilitates the
    communication with researchers & tracking the records. By default it
    complies an *html* file.  
    More details please see description in `?pretty_template()`.  
    For more information about R markdown please see
    [here](https://rmarkdown.rstudio.com).

-   *To be continued….*

## Installation

You can install the development version of neartools from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Bolin-Wu/neartools")
```

## Example

``` r

# load the package
library(neartools)

# check function's documentation
?sav_to_csv()
?pretty_template()

# conver data files
sav_to_csv("original_data", "SNAC-K")

# initiate a rmd file 
pretty_template(name = "Reply to Prof XXX")
```
