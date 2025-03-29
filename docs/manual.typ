#import "@preview/mantys:1.0.0": *
#import "@preview/cs61c-examst:0.1.0": *

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

  examples-scope: (
    scope: (
      answer-box: answer-box,
      titled-question: titled-question,
      multi-choice: multi-choice,
      multi-select: multi-select,
      correct: correct,
      print-answers: print-answers,
    ),
  ),

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
  arg("semester"),
  arg("exam"),
  arg("time"),
  arg("print-answers", false),
  arg("coverpage", none),
  arg("header"),
  arg("footer"),
  arg("last-edited"),
  barg("body"),
)[
  #argument("class", types: ("content", "string"))[
    The title of the class. This will be displayed on the cover page, as well as in the default footer.
  ]

  #argument("instructors", types: ("array", "string", "content"))[
    Either an array of strings or contents, or a single string / content representing the instructors of the class. This will be displayed on the cover page.
  ]

  #argument("semester", types: ("string", "content"))[
    The name of the semester. This will be displayed on the cover page, as well as in the default footer.
  ]

  #argument("exam", types: ("string", "content"))[
    The name of the exam. This will be displayed on the cover page, as well as in the default footer.
  ]

  #argument("time", types: ("string", "content"))[
    The amount of time allotted for the exam. This will be displayed on the cover page.
  ]

  #argument("print-answers", types: ("bool",))[
    Whether or not to print the answers to the exam. Setting this to `true` will generate the solutions to the exam, and setting this to `false` will generate a blank exam intended for printing.
  ]

  #argument("coverpage", types: ("string", "function"))[
    Either a filepath to a coverpage to use instead of the default provided with the exam template, or a function that takes in the arguments provided to `exam` (except `coverpage`) and returns content.

    If not provided, the default coverpage of the template will be used.
  ]

  #argument("header", types: ("function", "content"))[
    Either a function that takes in `class, semester, exam` and returns content, or content to be shown as the header for the entire exam.

    If not provided, the default header of the template will be used.
  ]

  #argument("footer", types: ("function", "content"))[
    Either a function that takes in `class, semester, exam` and returns content, or content to be shown as the footer for the entire exam.

    If not provided, the default footer of the template will be used.
  ]

  #argument("last-edited", types: "datetime")[
    The last time the exam was edited. This will be displayed only on the solutions manual. Defaults to today's date.
  ]
]

= Utility Functions

In addition to templating the exam, this package also provides a number of utility functions for typesetting exams.

== Titled Questions

The default question unit is the titled question, which displays at the top of the page with the point total for that question. In the template, top level headers automatically denote titled questions, and for headings within questions, subheadings should be used.

Titled questions can also be created using the @cmd:titled-question command:

#command(
  "titled-question",
  arg("title"),
)[
  #argument("title", types: ("string", "content"))[
    The title of the question.
  ]
]

== Parts

Within questions, subparts are automatically numbered, and the point total for each part is displayed next to the part. Subparts can be created using the @cmd:part command.

#command(
  "part",
  arg("points", none),
  arg("noprompt", false),
  barg("body"),
)

The `points` argument specifies the number of points for the part, and the the `noprompt` argument is used for questions without prompts, e.g. one question with multiple multiple choice answers spread across different parts.

Points indicated here are automatically added to the point table on the front page, as well as the points for the titled question the part is under.

== Question Types

Currently, multiple choice questions, free response questions with an answer blank, and coding questions are supported with the template.

The implementation of these rely on other functions in the package, and the interface is designed to be easy to use if you decide to implement your own form of question format.

=== Multiple Choice Questions

Multiple choice questions can be created using the @cmd:multi-choice or @cmd:multi-select commands:

#command(
  "multi-choice",
  arg("cols", 1),
  arg("none-above", false),
  sarg("body"),
)[
  #argument("cols", types: "int")[]
  #argument("none-above", types: "bool")[]
  #argument("body", types: "any")[]
]

#side-by-side[```typ
  #multi-choice(cols: 1,
    [Answer 1],
    correct()[Answer 2],
    [Answer 3],
    [Answer 4],
  )
  ```
]

When printing answers is enabled, the correct answer will be automatically filled in.
#side-by-side[```typ
  #print-answers.update(it => true)
  #multi-choice(cols: 1,
    [Answer 1],
    correct()[Answer 2],
    [Answer 3],
    [Answer 4],
  )
  ```
]

#command(
  "multi-select",
  arg("cols", 1),
  arg("none-above", false),
  sarg("body"),
)[]
=== Free Reponse Blanks

#command(
  "answer-box",
  arg((width: 50%)),
  arg((height: 2.25 * 16pt)),
  arg(fontsize: auto),
  arg(pre: ""),
  arg(post: ""),
  barg("answer"),
)[
  #print-answers.update(it => true)
  #side-by-side[```typ
    #answer-box()[asdf]
    ```]
]

=== Code Blocks
=== Specifications

== Solutions
== Other Functions

=== Adding points outside of parts
=== Blankpages
=== Selectively hiding and showing content
=== Getting contextual information
=== TODOs
