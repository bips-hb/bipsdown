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

  if (is.null(css)) {
    css <- c(bips_css, "default")
  }

  xaringan::moon_reader(
    css = css, self_contained = self_contained,
    seal = seal, yolo = yolo, chakra = chakra,
    nature = nature, anchor_sections = anchor_sections,
    ...
  )
}

pkg_resource <- function(template, ...) {
  system.file("rmarkdown", "templates", template, "resources",
              ..., package = "bipsdown", mustWork = TRUE)
}
