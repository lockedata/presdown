#' Take a directory of markdown files and render to
#' HTML any files not previously rendered, or with
#' last modifed dates greater than the HTML output
#'
#' @param path Directory of mds
#' @param dest Directory of html
#'
#' @return Render outputs
#' @export
#'
#' @examples
#' \dontrun{
#' generate_htmlfiles()
#' }
generate_htmlfiles<-function(path="./content/",
                           dest="./static/",
                           template="default.revealjs"){

  mds<-list.files(path, pattern="\\.md")
  htmls<-list.files(dest, pattern="\\.html")

  to_build<-setdiff(
    tools::file_path_sans_ext(mds),
    tools::file_path_sans_ext(htmls)
  )

  to_rebuild<-setequal(
    tools::file_path_sans_ext(mds),
    tools::file_path_sans_ext(htmls)
  )
  md_mod<-file.mtime(file.path(
    path,paste0(to_rebuild,".md")))
  html_mod<-file.mtime(file.path(
    dest,paste0(to_rebuild,".html")))
  to_rebuild<-to_rebuild[md_mod>html_mod]


  for(b in union(to_build, to_rebuild)) {
    md = file.path(path, paste0(b, ".md"))
    rmarkdown::pandoc_convert(md,to = template)
  }
}
