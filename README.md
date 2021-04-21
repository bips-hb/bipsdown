
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{bipsdown}`: BIPS themes for RMarkdown presentations

The goal of `{bipsdown}` is to provide easy to use RMarkdown templates
consistent with the BIPS house styles.

## Installation

You can install the current version of `{bipsdown}` from GitHub with:

``` r
remotes::install_github("bips-hb/bipsdown")
```

Please not that while the repository is private, you need to have R
properly configured to access your GitHub account.

## `{xaringan}` Slides (HTML)

You can find a demo presentation
[here](https://bips-hb.github.io/bipsdown/bips-xaringan/).

To use the [`{xaringan}`](https://slides.yihui.org/xaringan/)
presentation template, create A new RMarkdown file from the RStudio
dropdown menu and select “From Template”, where you should find the BIPS
templates.

Your `.Rmd` will start with something like this:

``` yaml
---
title: "A {xaringan} template for BIPS presentations"
subtitle: "A scientific thing"
author: "Lukas Burk"
date: "2021-04-21"
output:
  xaringan::moon_reader:
    css: [bips.css, default]
    lib_dir: libs
    nature:
      highlightStyle: github
      highlightLines: true
      countIncrementalSlides: false
      slideNumberFormat: "%current%"
      ratio: "16:9"
---
```

You can knit & preview your slides as you usually would with RMarkdown,
but `{xaringan}` provides an RStudio Addin called “Infinite Moon Reader”
that renders your slides, displays them in the Viewer Pane, and
automatically updates them as you edit your slides.  
This is generally considered to be a nifty thing.

### Tips & Tricks

-   The [`{xaringan}`](https://slides.yihui.org/xaringan/) reference
    slides provide most of the functionality you’re likely to need to
    get started.
-   Sharing your slides:
    <https://www.garrickadenbuie.com/blog/sharing-xaringan-slides/>
-   [`{xaringanExtra}`](https://pkg.garrickadenbuie.com/xaringanExtra/)
    provides many useful add-ons.

## Beamer Slides (PDF)

You can find a demo presentation
[here](https://bips-hb.github.io/bipsdown/bips-beamer/bips-beamer.pdf).

## Credits & License

-   The `{xaringan}` theme was mostly created with the help of the
    wonderful
    [{xaringanthemer}](https://pkg.garrickadenbuie.com/xaringanthemer/)
    package.

-   The `beamer` theme was [implemented by Louis
    Dijkstra](https://github.com/bips-hb/bips-beamer) and further
    adapted with a pandoc template to be used with RMarkdown.

To quote Louis:

> A special thanks to Márton Marczell. I used his implementation of
> various styles as a guide. You can find the code here:
> <https://bitbucket.org/marczellm/beamerports>. Since Marczell’s work
> is published under the Creative Commons License (version:
> [CC-BY-SA](http://creativecommons.org/licenses/by-sa/3.0)), the BIPS
> beamer style is too.

        This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
