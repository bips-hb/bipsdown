#' BIPS beamer presentation format
#'
#' Wrapper around [rmarkdown::beamer_presentation()] with BIPS theme defaults.
#' All assets (theme .sty, logo, fonts, pandoc template) are bundled in the
#' package and found automatically via TEXINPUTS — no need to copy files to
#' the working directory.
#'
#' @param themeoptions Character vector of theme options passed to
#'   `\\usetheme[options]{BIPS}`. Common options: `"fira"` (Fira fonts,
#'   requires xelatex), `"german"` (German labels).
#' @param aspectratio Aspect ratio for slides. Use `169` for 16:9 (default)
#'   or `43` for 4:3.
#' @param latex_engine LaTeX engine to use. Defaults to `"xelatex"` which is
#'   required for the `fira` theme option.
#' @param thankstext Text for the closing "thank you" slide. Set to `NULL` or
#'   `FALSE` to omit.
#' @param ... Additional arguments passed to [rmarkdown::beamer_presentation()].
#' @export
bips_beamer <- function(
  themeoptions = "fira",
  aspectratio = 169,
  latex_engine = "xelatex",
  thankstext = "Thank you for your attention!",
  ...
) {
  skeleton_dir <- system.file(
    "rmarkdown", "templates", "beamer", "skeleton",
    package = "bipsdown", mustWork = TRUE
  )

  template <- file.path(skeleton_dir, "template.tex")

  # Set TEXINPUTS so LaTeX finds beamerthemeBIPS.sty, bips-logo.png, and fonts
  texinputs <- Sys.getenv("TEXINPUTS", "")
  fonts_dir <- file.path(skeleton_dir, "fonts")
  new_texinputs <- paste(
    skeleton_dir, fonts_dir, texinputs,
    sep = .Platform$path.sep
  )

  fmt <- rmarkdown::beamer_presentation(
    template = template,
    latex_engine = latex_engine,
    ...
  )

  # Inject TEXINPUTS into the pre_processor
  original_pre <- fmt$pre_processor
  fmt$pre_processor <- function(metadata, input_file, runtime, knit_meta,
                                files_dir, output_dir) {
    Sys.setenv(TEXINPUTS = new_texinputs)
    if (is.function(original_pre)) {
      original_pre(metadata, input_file, runtime, knit_meta,
                   files_dir, output_dir)
    }
  }

  # Clean up TEXINPUTS after rendering
  original_post <- fmt$post_processor
  fmt$post_processor <- function(metadata, input_file, output_file, clean,
                                 verbose) {
    Sys.setenv(TEXINPUTS = texinputs)
    if (is.function(original_post)) {
      original_post(metadata, input_file, output_file, clean, verbose)
    } else {
      output_file
    }
  }

  # Inject default pandoc variables for aspectratio and themeoptions
  fmt$pandoc$args <- c(
    fmt$pandoc$args,
    rmarkdown::pandoc_variable_arg("aspectratio", aspectratio)
  )

  if (!is.null(themeoptions)) {
    for (opt in themeoptions) {
      fmt$pandoc$args <- c(
        fmt$pandoc$args,
        rmarkdown::pandoc_variable_arg("themeoptions", opt)
      )
    }
  }

  if (!is.null(thankstext) && !identical(thankstext, FALSE)) {
    fmt$pandoc$args <- c(
      fmt$pandoc$args,
      rmarkdown::pandoc_variable_arg("thankstext", thankstext)
    )
  }

  fmt
}
