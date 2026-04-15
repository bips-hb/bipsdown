#' BIPS xaringan presentation format
#'
#' Wrapper around [xaringan::moon_reader()] with BIPS styling defaults.
#'
#' @inheritParams xaringan::moon_reader
#' @param css CSS files to use. Defaults to BIPS theme and xaringan defaults.
#' @param ... Additional arguments passed to [xaringan::moon_reader()].
#' @export
bips_xaringan <- function(
  css = NULL,
  self_contained = FALSE,
  seal = TRUE, yolo = FALSE,
  chakra = "https://remarkjs.com/downloads/remark-latest.min.js",
  nature = list(
    highlightStyle = "github",
    highlightLines = TRUE,
    countIncrementalSlides = FALSE,
    slideNumberFormat = "%current%",
    ratio = "16:9"
  ),
  anchor_sections = FALSE, ...
) {

  bips_css <- pkg_resource("xaringan", "bips.css")
  bips_logo <- pkg_resource("xaringan", "bips-logo.png")

  if (is.null(css)) {
    css <- c(bips_css, "default")
  }

  fmt <- xaringan::moon_reader(
    css = css, self_contained = self_contained,
    seal = seal, yolo = yolo, chakra = chakra,
    nature = nature, anchor_sections = anchor_sections,
    ...
  )

  # xaringan embeds absolute paths for custom CSS files, which breaks on

  # CI / deployed sites. Post-process the output to copy BIPS assets into
  # the lib directory and rewrite the <link> href to a relative path.
  original_post <- fmt$post_processor
  fmt$post_processor <- function(metadata, input_file, output_file, clean,
                                 verbose) {
    lib_dir <- paste0(tools::file_path_sans_ext(output_file), "_files")
    bips_lib <- file.path(lib_dir, "bips-theme")
    dir.create(bips_lib, recursive = TRUE, showWarnings = FALSE)
    file.copy(bips_css, bips_lib, overwrite = TRUE)
    file.copy(bips_logo, bips_lib, overwrite = TRUE)

    # Rewrite absolute CSS path to relative
    rel_css <- file.path(basename(lib_dir), "bips-theme", "bips.css")
    html <- readLines(output_file)
    html <- sub(bips_css, rel_css, html, fixed = TRUE)
    writeLines(html, output_file)

    if (is.function(original_post)) {
      original_post(metadata, input_file, output_file, clean, verbose)
    } else {
      output_file
    }
  }

  fmt
}

pkg_resource <- function(template, ...) {
  system.file("rmarkdown", "templates", template, "resources",
              ..., package = "bipsdown", mustWork = TRUE)
}
