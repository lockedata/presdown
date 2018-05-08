#' Look for library calls in a directory of Rmds, install
#' any packages you don't have, then add packages to a
#' DESCRIPTION
#'
#' @param path Directory of files to scan
#' @param install Should installs happen
#'
#' @return Currently a lot of gunk!
#' @export
#'
#' @examples
#' catalogue_dependencies(install=FALSE)
catalogue_dependencies <- function(path="./presentations",
                                   install=TRUE){

  files<- list.files(path, "*.Rmd", full.names = TRUE)
  contents<-lapply(files,readLines)
  library_calls<-unique(
    as.vector(
      grep("library\\((.*)\\)",
           contents, value = TRUE)
      ))

  # Gonna need to do something cleverer here to
  # account for remotes
  if(install){
    install.packages(
      setdiff(library_calls,
          installed.packages()[,"Package"])
    )
  }

  lapply(library_calls, devtools::use_package)

}
