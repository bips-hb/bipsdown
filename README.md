# bipsdown

<!-- badges: start -->
<!-- badges: end -->

The goal of bipsdown is to provide easy to use RMarkdown templates consistent with the BIPS house styles.

## Installation

You can install the released version of `{bipsdown}` from with:

``` r
remotes::install_github("bips-hb/bipsdown")
```

Please not that while the repository is private, you need to have R properly configured to access your GitHub account.

## Example

### `{xaringan}` Slides (HTML)

To use the `{xaringan}` presentation template, create A new RMarkdown file from the RStudio dropdown menu and select "From Template", where you should find the BIPS templates.

Your `.Rmd` file should start with something like this:

```yaml
---
title: "A {xaringan} template for BIPS presentations"
subtitle: "A scientific thing"
author: "Lukas Burk"
date: "`r Sys.Date()`"
output:
  xaringan::moon_reader:
    css: [bips.css, default]
    lib_dir: libs
    nature:
      highlightStyle: github
      highlightLines: true
      countIncrementalSlides: false
      slideNumberFormat: "%current%"
      # ratio: "16:9"
---
```

You can knit & preview your slides as you usually would with RMarkdown, but `{xaringan}` provides an RStudio Addin called "Infinite Moon Reader" that renders your slides, displays them in the Viewer Pane, and automatically updates them as you edit your slides.  
This is generally considered to be a nifty thing.

#### Tips & Tricks

- Sharing your slides: https://www.garrickadenbuie.com/blog/sharing-xaringan-slides/

## Credits & License

The `{xaringan}` theme was mostly created with the help of the wonderful [{xaringanthemer}](https://pkg.garrickadenbuie.com/xaringanthemer/) package.
