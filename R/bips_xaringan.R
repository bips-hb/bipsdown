bips_xaringan <- function(
  css = c("bips", "default"),
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

  pkg_resource("xaringan", "bips.css")

  xaringan::moon_reader(
    css = css, self_contained = self_contained,
    seal = seal, yolo = yolo, chakra = chakra,
    nature = nature, anchor_sections = anchor_sections
  )
}

pkg_resource <- function(template,...) {
  system.file("rmarkdown", "templates", template, "resources",
              ..., package = "bipsdown", mustWork = TRUE)
}
