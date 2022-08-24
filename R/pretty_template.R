#' @title pretty_template
#' @description Use the skeleton.Rmd for starting analysis. This function creates a new folder "rmd" at root of project and put the rmd file there.
#' @param name name of rmd file
#' @param open should the file be opened after being created
#' @param ... arguments to be passed to \link[usethis]{use_template}
#' @importFrom usethis use_template
#' @importFrom here here
#' @examples
#' \donttest{
#' if(interactive()){
#'   pretty_template()
#' }
#' }
#'
#' @example
#'
#' neartools::pretty_template()
#'
#' @export
pretty_template <-
  function(name = NULL,
           open = interactive(),
           ...) {

    if(is.null(name)){
      name <- "analysis.Rmd"
    }

    # create a folder for Rmd
    dir.create("rmd", showWarnings = FALSE)

    # usethis::use_package("usethis")

    usethis::use_template("skeleton.Rmd",
                          save_as=  paste0("rmd/", name),
                          data = list(),
                          package = "neartools", ..., open = open)
  }
