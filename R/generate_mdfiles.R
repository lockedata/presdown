#' Take a directory of rmarkdown files and render to
#' markdown any files not previously rendered, or with
#' last modifed dates greater than the markdown output
#'
#' @param path Directory of Rmds
#' @param dest Directory of mds
#'
#' @return Render outputs
#' @export
#'
#' @examples
#' \dontrun{
#' generate_mdfiles()
#' }
generate_mdfiles<-function(path="./presentations/",
                           dest="./content/"){

  rmds<-list.files(path, pattern="\\.Rmd")
  mds<-list.files(dest, pattern="\\.md")

  to_build<-setdiff(
    tools::file_path_sans_ext(rmds),
    tools::file_path_sans_ext(mds)
  )

  to_rebuild<-setequal(
    tools::file_path_sans_ext(rmds),
    tools::file_path_sans_ext(mds)
    )
  rmd_mod<-file.mtime(file.path(
    path,paste0(to_rebuild,".Rmd")))
  md_mod<-file.mtime(file.path(
    dest,paste0(to_rebuild,".md")))
  to_rebuild<-to_rebuild[rmd_mod>md_mod]


  for(b in union(to_build, to_rebuild)) {
    rmd = file.path(path, paste0(b, ".Rmd"))
    rmarkdown::render(
      rmd,
      rmarkdown::md_document(variant = "markdown_github",
                             preserve_yaml = TRUE)
    )
  }
}
