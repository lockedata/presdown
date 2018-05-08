#' Generate improtant directories according to a
#' stagtic site generators preferences.
#'
#' @param path Directory in which directories should be created
#' @param convention Static site generator conventions to use
#'
#' @return Boolean indicating success
#' @export
#'
#' @examples
#' setup_dir(convention="hugo")
setup_dir<-function(path=".", convention=c("hugo","jekyll")){
  invisible({
    if(convention=="hugo"){
    dir.create(file.path(path,"static"))
    dir.create(file.path(path,"public"))
    dir.create(file.path(path,"content"))
  }

  if(convention=="jekyll"){
    dir.create(file.path(path,"static"))
    dir.create(file.path(path,"docs"))
    dir.create(file.path(path,"content"))
  }

  dir.create(file.path(path,"presentations"))
  })

  message("Success!")
  return(TRUE)
}
