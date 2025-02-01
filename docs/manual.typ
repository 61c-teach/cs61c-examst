#import "@preview/mantys:1.0.0": *

// Some fancy logos
// credits go to discord user @adriandelgado
#let TeX = context {
  set text(font: "New Computer Modern")
  let e = measure("E")
  let T = "T"
  let E = text(1em, baseline: e.height * 0.31, "E")
  let X = "X"
  box(T + h(-0.15em) + E + h(-0.125em) + X)
}

#let LaTeX = context {
  set text(font: "New Computer Modern")
  let a-size = 0.66em
  let l = measure("L")
  let a = measure(text(a-size, "A"))
  let L = "L"
  let A = box(scale(x: 110%, text(a-size, baseline: a.height - l.height, "A")))
  box(L + h(-a.width * 0.67) + A + h(-a.width * 0.25) + TeX)
}

#show "LaTeX": LaTeX

#show: mantys(
  ..toml("../typst.toml"),

  title: "61c-examst",
  date: datetime.today(),

  abstract: [
    This package is used to typeset exams for the course CS61C at UC Berkeley. It is inspired by our previous exam template written in LaTeX, and contains both a template for exams, as well as various utility functions for creating exams.
  ],

  theme: themes.modern,
  examples-scope: (dictionary(61c-examst)),
)

= Usage

To start, import the package as follows:

```typ
import @preview/61c-examst:0.1.0: *
```
