#' Insert Manifestation Header
#' @param filename Optional script name (default uses current file)
#' @export
insert_manifestation <- function(filename = NULL) {
  if (!rstudioapi::hasFun("getActiveDocumentContext")) {
    stop("This function requires RStudio.")
  }

  ctx <- rstudioapi::getActiveDocumentContext()

  # If filename not provided, infer from the open document path
  if (is.null(filename)) {
    filename <- basename(ctx$path)
    if (filename == "") filename <- "new_script.R"
  }

  date <- format(Sys.Date(), "%Y-%m-%d")

  block <- c(
    "# Author details",
    paste0("## Script name: ", filename),
    "## Purpose of the script: ",
    "## Author(s): Jyotirmoy Das, Ph.D.",
    paste("## Date Created:", date),
    paste("## Date Last Modified:", date),
    "## Copyright statement: GNU3 open license",
    "## Contact information: jyotirmoy.das@liu.se",
    "## Please cite:",
    "## @article{}",
    "## Notes:",
    "## Please read the manual/tutorial file for the sample preparation of the analysis.",
    ""
  )

  rstudioapi::insertText(paste(block, collapse = "\n"))
}
