#import "/lib.typ": *

= 61Crossword
These questions will not be assigned credit; feel free to leave them blank.

#part(points: 0)[
  Fill out the 61Crossword!

  #let cw-counter = counter("crossword")
  #let cw-size = 1em

  #let _______ = table.cell([
    #box(width: cw-size, height: cw-size)
  ])
  #let bb = table.cell(fill: black, stroke: 1pt, _______)

  #let bx(body) = table.cell(
    stroke: 1pt,
    [
      #box(width: cw-size, height: cw-size)
      #place(
        horizon + center,
        context [
          #upper(if states.print-answers.get() {
            body
          })],
      )
    ],
  )

  #let bn(body) = table.cell(
    stroke: 1pt,
    [
      #cw-counter.step()
      #set align(left)
      #context {
        place(top + left, dy: -3pt, dx: -3pt)[
          #scale(raw(str(cw-counter.get().at(0))), 70%)
        ]

        place(horizon + center)[#upper(if states.print-answers.get() { body })]
      }
    ],
  )

  #grid(
    columns: (2fr, 1fr),
    column-gutter: 1em,
    [
      #align(center)[
        // #show regex("\w"): it => bx(it)
        #table(
          columns: 15,
          stroke: 0pt,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          bn("c"),
          bx("h"),
          bx("i"),
          bn("p"),
          bx("m"),
          bx("u"),
          bx("n"),
          bx("k"),

          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          bx("i"),
          _______,
          _______,
          _______,
          _______,

          _______,
          _______,
          _______,
          _______,
          _______,
          bn("m"),
          _______,
          _______,
          _______,
          _______,
          bx("p"),
          _______,
          _______,
          _______,
          _______,

          _______,
          _______,
          _______,
          _______,
          _______,
          bx("o"),
          _______,
          bn("s"),
          _______,
          _______,
          bx("e"),
          _______,
          _______,
          _______,
          _______,

          _______,
          _______,
          bn("s"),
          _______,
          _______,
          bn("o"),
          bx("v"),
          bx("e"),
          bx("r"),
          bx("f"),
          bx("l"),
          bx("o"),
          bx("w"),
          _______,
          _______,

          _______,
          _______,
          bx("n"),
          _______,
          _______,
          bx("r"),
          bb,
          bx("g"),
          _______,
          _______,
          bx("i"),
          _______,
          _______,
          _______,
          _______,

          bn("d"),
          bx("e"),
          bx("a"),
          bx("d"),
          bx("b"),
          bx("e"),
          bx("e"),
          bx("f"),
          _______,
          _______,
          bx("n"),
          _______,
          _______,
          _______,
          _______,

          _______,
          _______,
          bx("k"),
          _______,
          _______,
          _______,
          _______,
          bx("a"),
          _______,
          _______,
          bx("i"),
          _______,
          _______,
          _______,
          _______,

          _______,
          bn("w"),
          bx("e"),
          bx("n"),
          _______,
          bn("c"),
          _______,
          bx("u"),
          _______,
          _______,
          bx("n"),
          _______,
          _______,
          _______,
          _______,

          _______,
          _______,
          _______,
          _______,
          bn("c"),
          bx("a"),
          bx("l"),
          bx("l"),
          _______,
          _______,
          bx("g"),
          _______,
          _______,
          _______,
          _______,

          _______,
          _______,
          _______,
          _______,
          _______,
          bx("c"),
          _______,
          bx("t"),
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,

          _______,
          _______,
          _______,
          _______,
          _______,
          bx("h"),
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,

          _______,
          _______,
          _______,
          _______,
          _______,
          bx("e"),
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,

          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
          _______,
        )
      ]
    ],
    [
      #block(width: 100%)[
        *Across*
        1. CS61C Fall 2024's mascot 🐿️, perhaps a pun on the class logo?
        6. 0xFFFFFFFF + 0x00000001 causes?
        7. 💀🥩?
        8. a control signal, or a certain staff member?
        10. \_ \_ \_ \_ me maybe?
        *Down*
        2. makes doing laundry faster (and the CPU)
        3. \_ \_ \_ \_ \_'s law of transistor scaling?
        4. memory access errors, taken care of by a certain fairy?
        5. animal featured in Project 1, rhyming with cake? 🎂
        9. 💸?
      ]
    ],
  )
]

#part(points: 0)[
  If there's anything else you want us to know, or you feel like there was an ambiguity in the exam, please put it in the box below.

  For ambiguities, you must qualify your answer and provide an answer for both interpretations. For example, "if the question is asking about A, then my answer is X, but if the question is asking about B, then my answer is Y". You will only receive credit if it is a genuine ambiguity and both of your answers are correct. We will only look at ambiguities if you request a regrade.

  #block(height: auto, width: 100%, stroke: 0.5pt)[#v(15em)]
]
