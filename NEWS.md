# bipsdown 2.2

## Changes for beamer theme

- Add `allowframebreaks` option to bibliography slide to ensure all references are visible.


# bipsdown 2.1

- Fix missing city on last slide in template Rmd
- Add `macros.js`, with macros from [here](https://gist.github.com/albertotb/a47025149ed550a3a3c3525b2da37ee2), see [documentation on macros here](https://bookdown.org/yihui/rmarkdown/some-tips.html#macros).

# bipsdown 0.2.0

## Changes for xaringan theme

- Increase default font size from 20px to 25px for better readability
- Slightly decrease the code font size from 0.9rem to 0.8rem
- Show slide number on `.inverse` slides with inverted text color (i.e. white)
- Allow hiding the slide number with `class: unnumbered`
- Allow hiding the logo with `class: nologo` (Note that this sets `background-image: none`, so if you want to show a background image, the logo is hidden anyway)
- Also add dividing line under `h2` elements (e.g. `## My Level 2 Heading`) as was done for `h1`
- Add helper classes from [xaringan-metropolis](https://github.com/pat-s/xaringan-metropolis/blob/master/mtheme.css)

# bipsdown 0.1.1

* Merged upstream changes from [`bips-beamer`](https://github.com/bips-hb/bips-beamer/commit/d9ddcc3da2016449d902cd2f26a7288a3f0eed94)

# bipsdown 0.1.0

* Added `bips-beamer` for Beamer/PDF presentations. Adapted from [bips-beamer by Louis](https://github.com/bips-hb/bips-beamer).
* Added `bips-xaringan` template for HTML presentations.
* Added a `NEWS.md` file to track changes to the package.
