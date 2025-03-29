#import "../states.typ"

#let _correct() = context [
  #let fill = white

  #if states.print-answers.get() {
    fill = black
  }

  #square(size: 10pt, fill: fill, stroke: black)
]

#let _bad() = [
  #let check-stroke = stroke(
    thickness: 2.3pt,
    paint: luma(50%),
    cap: "round",
  )

  #place(
    center + horizon,
    dx: -1.5pt,
    dy: 1.5pt,
    [ #line(length: 4pt, angle: 55deg, stroke: check-stroke) ],
  )

  #place(
    center + horizon,
    dx: 2pt,
    dy: 3.1pt,
    [ #line(length: 8pt, angle: -60deg, stroke: check-stroke) ],
  )

  #square(size: 10pt, stroke: black)
]

#let _choice() = [
  #square(size: 10pt, stroke: black)
]

#let correct(body) = {
  (
    "selection": _correct,
    "body": [#body],
  )
}

#let bad(body) = {
  (
    "selection": _bad,
    "body": [#body],
  )
}

#let choice(selection, body) = {
  grid(
    columns: 3,
    column-gutter: 5pt,
    align: horizon,
    [#h(6pt)], selection(), [#body],
  )
}


#let multi-select(cols: 1, none-above: none, ..body) = {
  let num-items = body.pos().len() + if type(none-above) != none { 1 }
  let items-per-col = num-items / cols
  let rem = calc.rem(num-items, cols)
  let col-counter = 0
  let last-break = 0
  columns(cols)[
    #for (i, b) in body.pos().enumerate() {
      if type(b) == dictionary { choice(b.selection, b.body) }
      if type(b) == content { choice(_choice, b) }
      if cols == 1 { continue }
      if (
        (
          calc.rem(i + 1, calc.ceil(items-per-col)) == 0 and (i + 1) / calc.ceil(items-per-col) <= rem
        )
          or (
            calc.rem(i + 1, calc.floor(items-per-col)) == 0 and (i + 1) / calc.ceil(items-per-col) > rem
          )
            and i + 1 != num-items
      ) [ #colbreak() ]
    }
    #{
      show square: it => circle(radius: it.width.length / 2, fill: it.fill, stroke: it.stroke)
      if type(none-above) == bool {
        if none-above {
          choice(_choice, [None of the above])
        }
      } else if type(none-above) == type(auto) {
        if body.pos()
              .filter(it => type(it) == dictionary)
              .filter(it => it.selection == _correct)
              .len() == 0 {
                choice(_correct, [None of the above])
              } else {
                choice(_choice, [None of the above])
              }
      } else if type(none-above) == function {
        choice(none-above, [None of the above])
      }
    }
  ]
}

#let multi-choice(cols, none-above, ..body) = {
  show square: it => circle(radius: it.width.length / 2, fill: it.fill, stroke: it.stroke)

  multi-select(cols, none-above, ..body)
}
