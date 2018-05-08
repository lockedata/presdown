#' Grab files needed to use a presentation library
#'
#' @param tmp_dir Specific directory to download stuff to
#' @param pres_lib_dest The directory name to deploy js library to
#' @param pres_lib_loc The source of the js library
#' @param pres_lib_template The relevant template for converting md to html
#'
#' @return Lots of gunk right now
#' @export
#'
#' @examples
#' \dontrun{
#' install_presentationjs()
#' }
install_presentationjs<-function(tmp_dir=tempdir(),
  pres_lib_dest="./static/revealjs",
  pres_lib_loc="https://github.com/hakimel/reveal.js/archive/3.6.0.zip",
  pres_lib_template="https://raw.githubusercontent.com/jgm/pandoc-templates/master/default.revealjs"){

  if(!dir.exists(tmp_dir)) dir.create(tmp_dir)
  if(!dir.exists(pres_lib_dest)) dir.create(pres_lib_dest)
  # Will assume zip for now
  download.file(pres_lib_loc,destfile = file.path(tmp_dir,"tmp.zip"))
  # Will need to make this grab the name from the url
  download.file(pres_lib_template, "default.revealjs")
  utils::unzip(file.path(tmp_dir,"tmp.zip"),
               exdir = pres_lib_dest)
  # need to cleanup tempdir()
}
