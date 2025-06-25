#' Insert Manifestation Header (smart, with config + prompt)
#'
#' @param script_name Optional name of the script
#' @param purpose Script purpose
#' @param author Author name
#' @param email Contact email
#' @param citation Preferred citation
#' @param notes Additional notes
#' @param save_profile Logical. If TRUE, saves the inputs to ~/.manifest_profile.R
#' @export
insert_manifestation <- function(
    script_name = NULL,
    purpose = NULL,
    author = NULL,
    email = NULL,
    citation = NULL,
    notes = NULL,
    save_profile = FALSE
) {
  if (!rstudioapi::hasFun("insertText")) {
    stop("This function requires RStudio.")
  }

  # Load ~/.manifest_profile.R if it exists
  profile_path <- path.expand("~/.manifest_profile.R")
  if (file.exists(profile_path)) {
    source(profile_path, local = TRUE)
  }

  get_default <- function(key, fallback = NULL) {
    if (exists("manifest_profile") && key %in% names(manifest_profile)) {
      manifest_profile[[key]]
    } else fallback
  }

  # Use arguments > config file > prompt
  if (is.null(script_name)) {
    ctx <- rstudioapi::getActiveDocumentContext()
    script_name <- if (nzchar(ctx$path)) basename(ctx$path) else rstudioapi::showPrompt("Script name", "Script file name:")
  }

  if (is.null(purpose)) {
    purpose <- rstudioapi::showPrompt("Purpose", "What does this script do?")
  }

  author   <- author   %||% get_default("author")   %||% rstudioapi::showPrompt("Author", "Your name:")
  email    <- email    %||% get_default("email")    %||% rstudioapi::showPrompt("Email", "Your contact email:")
  citation <- citation %||% get_default("citation") %||% rstudioapi::showPrompt("Citation", "How to cite this script:")
  notes    <- notes    %||% rstudioapi::showPrompt("Notes", "Any additional notes?")

  date <- format(Sys.Date(), "%Y-%m-%d")

  block <- c(
    "# Author details",
    paste0("## Script name: ", script_name),
    paste0("## Purpose of the script: ", purpose),
    paste0("## Author(s): ", author),
    paste0("## Date Created: ", date),
    paste0("## Date Last Modified: ", date),
    paste0("## Copyright statement: ", get_default("copyright", "All rights reserved")),
    paste0("## Contact information: ", email),
    paste0("## Please cite: ", citation),
    paste0("## Notes: ", notes)
  )

  rstudioapi::insertText(paste(block, collapse = "\n"))

  # Save profile if requested
  if (isTRUE(save_profile)) {
    manifest_profile <- list(
      author = author,
      email = email,
      citation = citation,
      copyright = get_default("copyright", "All rights reserved")
    )
    dput(manifest_profile, file = profile_path)
    message("✔ Manifestation profile saved to ~/.manifest_profile.R")
  }
}

# helper: fallback logic (R >= 3.5 compatible)
`%||%` <- function(a, b) if (!is.null(a)) a else b
