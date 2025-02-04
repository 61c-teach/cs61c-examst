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

  // theme: themes.modern,
)

= Quickstart
You can quickstart using the template with `typst init`:

#codesnippet[```bash
  typst init "@preview/cs61c-examst" exam
  ```]

This will create the following project structure:

#codesnippet(inset: 1.5pt)[```
  exam
  ├── questions
  │   └── 01-sample.typ
  └── main.typ
  ```]

While you are able to write the entire exam in `main.typ`, I recommend that you write each question in its own file in the `questions` directory, and then import each question separately in `main.typ`.

Fill in each of the arguments in the

= Usage

To start, import the package as follows:

#codesnippet[```typst
  #import "@preview/cs61c-examst:0.1.0": *
  ```]

== Template

The template for the exam is initialized by applying a show rule with the `exam` command:

#command(
  "exam",

  arg("class"),
  arg("instructors"),
  arg("exam"),
  arg("time"),
  arg("print-answers"),
  arg("coverpage"),
  arg("header"),
  arg("footer"),
  arg("last-edited"),
  barg("body"),
)[
  #argument("class", types: ("content", "string"))[
    The title of the class. This will be displayed on the cover page, as well as in the default footer.
  ]

  #argument("instructors", types: ("content", "string"))[
    The title of the class. This will be displayed on the cover page, as well as in the default footer.
  ]
]

= Utility Functions
== Answer Boxes
== Code Blocks
== Multiple Choice Questions
== Parts
== Solutions
== Specifications
== Titled Questions
== Other Functions
