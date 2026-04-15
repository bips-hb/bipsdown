# `{bipsdown}`: BIPS themes for RMarkdown presentations

> [!TIP]
> This package provides presentation templates for RMarkdown.
> The original LaTeX template is available at [bips-hb/bips-beamer](https://github.com/bips-hb/bips-beamer).
> A [quarto](https://quarto.org/) extension is available at [bips-hb/bips-quarto](https://github.com/bips-hb/bips-quarto), which bundles the beamer theme and an experimental reveal.js theme.
> A [typst](https://typst.app) wrapper is available as a [typst package](https://typst.app/universe/package/bypst) and from [bips-hb/bips-typst](https://github.com/bips-hb/bips-typst).

The goal of `{bipsdown}` is to provide easy to use RMarkdown output formats consistent with the BIPS house styles. All theme assets (LaTeX .sty, logo, fonts, CSS) are bundled in the package — no files need to be copied to your working directory.

## Installation

You can install the current version of `{bipsdown}` from GitHub with `pak` or `remotes`:

``` r
pak::pak("bips-hb/bipsdown")

remotes::install_github("bips-hb/bipsdown")
```

## Beamer Slides (PDF)

Use `bipsdown::bips_beamer` as the output format. All assets are bundled — no need to copy template files.

```yaml
---
title: "Presentation Title"
subtitle: "Subtitle"
author: "Author Name"
contactauthor: "Author Name"
email: "username@leibniz-bips.de"
occasion: "Conference Name"
date: "`r Sys.Date()`"
output:
  bipsdown::bips_beamer:
    keep_tex: false
---
```

### Defaults

- **16:9 aspect ratio** (set `aspectratio: 43` for 4:3)
- **Fira Sans/Mono fonts** via xelatex (set `themeoptions: NULL` to use Helvetica with pdflatex)
- **Thanks slide** with contact information (set `thankstext: NULL` to disable)

### Customization

```yaml
output:
  bipsdown::bips_beamer:
    # Override defaults
    aspectratio: 43
    themeoptions:
      - fira
      - german
    thankstext: "Vielen Dank für Ihre Aufmerksamkeit!"
    latex_engine: xelatex
```

### Custom YAML Fields

- `contactauthor`: Name shown on the closing slide (defaults to first author)
- `email`: Email address shown on the closing slide
- `occasion`: Conference or event name shown on the title and closing slides

### Special Frames

Custom frame commands usable via raw LaTeX:

- `\sectionframe{Title}`: Section divider slide (no logo, centered text)
- `\thanksframe{Thank you!}`: Closing slide with contact information and BIPS logo
- `\begin{emptyframe}...\end{emptyframe}`: Blank slide without logo or page number

### Color Commands

- `\blue{text}` — BIPS Blue
- `\orange{text}` — BIPS Orange
- `\green{text}` — BIPS Green
- `\gray{text}` — BIPS Text Gray


## `{xaringan}` Slides (HTML) <small>(experimental)</small>

> [!NOTE]
> The xaringan template is experimental. Consider using the [quarto extension](https://github.com/bips-hb/bips-quarto) for HTML presentations instead.

Use `bipsdown::bips_xaringan` as the output format:

```yaml
---
title: "Presentation Title"
subtitle: "Subtitle"
author: "Author Name"
date: "`r Sys.Date()`"
output:
  bipsdown::bips_xaringan: default
---
```

The format wraps `xaringan::moon_reader()` with BIPS defaults (16:9 ratio, Fira fonts, GitHub syntax highlighting).

### Theme-Specifics

The following additional CSS classes are available:

- `nologo`: Hide the BIPS logo
- `unnumbered`: Hide the slide number

### Further Reading

- [{xaringan} in the RMarkdown book](https://bookdown.org/yihui/rmarkdown/xaringan.html)
- [{xaringan} documentation presentation](http://slides.yihui.name/xaringan/)
- [{xaringanExtra}](https://pkg.garrickadenbuie.com/xaringanExtra/)


## Credits & License

- The `{xaringan}` theme was mostly created with the help of [{xaringanthemer}](https://pkg.garrickadenbuie.com/xaringanthemer/).
- The `beamer` theme was [implemented by Louis Dijkstra](https://github.com/bips-hb/bips-beamer) and further adapted with a pandoc template to be used with RMarkdown.

> A special thanks to Márton Marczell. I used his implementation of various styles
> as a guide. You can find the code here: https://bitbucket.org/marczellm/beamerports.
> Since Marczell's work is published under the Creative Commons License (version:
> [CC-BY-SA](http://creativecommons.org/licenses/by-sa/3.0)), the BIPS beamer style is too.

## Related

The BIPS presentation theme zoo for "I don't want to use PowerPoint" folks:

| Markup format | Intermediate format | Output format | Based on | Repo / Package | Status |
|---|---|---|---|---|---|
| LaTeX | --- | PDF | | [bips-beamer](https://github.com/bips-hb/bips-beamer) | Stable |
| [RMarkdown](https://rmarkdown.rstudio.com/) | LaTeX | PDF | bips-beamer | [bipsdown](https://github.com/bips-hb/bipsdown) | Stable |
| [RMarkdown](https://rmarkdown.rstudio.com/) | [xaringan](http://slides.yihui.name/xaringan/) | HTML | | [bipsdown](https://github.com/bips-hb/bipsdown) | Experimental |
| [Quarto](https://quarto.org/) | LaTeX | PDF | bips-beamer | [bips-quarto](https://github.com/bips-hb/bips-quarto) | Stable |
| [Quarto](https://quarto.org/) | reveal.js | HTML | | [bips-quarto](https://github.com/bips-hb/bips-quarto) | Experimental |
| [typst](https://typst.app/) | --- | PDF | | [bips-typst](https://github.com/bips-hb/bips-typst) / [bypst](https://typst.app/universe/package/bypst) | Stable |
