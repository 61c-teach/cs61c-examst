#import "/lib.typ": *
#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge, shapes

= Five diviSion Machine

Implement an FSM that returns 1 if the input bits so far, interpreted as an unsigned binary number, are divisible by 5. You may assume that the most significant bit is the first bit passed in.

_Reminder:_ $0$ is divisible by $5$.

_Hint 1:_ States `0`, `1`, `2`, `3`, `4` represent the current number having a remainder of $0$, $1$, $2$, $3$, and $4$ when divided by $5$, respectively.

_Hint 2:_ If you have a binary number $a = #raw("0bXXX")$, then $#raw("0bXXX1") = 2a + 1$ and $#raw("0bXXX0") = 2a$.


// #set text(11pt)
#align(center)[
  #show ref: it => scale(qref-raw(it.target), 80%)
  // #show raw: it => scale(it, 80%)
  #let (a0, a1, a2, a3, a4) = (
    (0, 0),
    (5, 0),
    (2.5, 1.5),
    (5, 3),
    (0, 3),
  )
  #diagram(
    node-stroke: .1em,
    edge-stroke: .1em,
    spacing: 2.5em,
    node(a0, `0`, radius: 2em),
    edge(a0, a0, `0/1`, "-|>", bend: 130deg),
    edge(a0, a1, `1/0`, "-|>", bend: 20deg),
    edge(a0, a2, [@fsm-arrow-1], "-|>", bend: -20deg),

    node(a1, `1`, radius: 2em),
    edge(a1, a2, [@fsm-arrow-2], "-|>", bend: 20deg),
    edge(a1, a3, `1/0`, "-|>", bend: 30deg),

    node(a2, `2`, radius: 2em),
    edge(a2, a0, [@fsm-arrow-3], "-|>", bend: -20deg),
    edge(a2, a1, [@fsm-arrow-4], "-|>", bend: 20deg),
    edge(a2, a3, [@fsm-arrow-5], "-|>", bend: -20deg),
    edge(a2, a4, [@fsm-arrow-6], "-|>", bend: 20deg),

    node(a3, `3`, radius: 2em),
    edge(a3, a1, `0/0`, "-|>", label-side: left, bend: 0deg),
    edge(a3, a2, [@fsm-arrow-7], "-|>", bend: -20deg),
    edge(a3, a4, [@fsm-arrow-8], "-|>", bend: 20deg),

    node(a4, `4`, radius: 2em),
    edge(a4, a2, [@fsm-arrow-9], "-|>", bend: 20deg),
    edge(a4, a3, [@fsm-arrow-10], "-|>", bend: 0deg),
    edge(a4, a4, `0/1`, "-|>", bend: -130deg),
  )
]
#v(-1.5em)
#align(center)[
  #table(
    columns: 2,
    [*Example Input*], [#hide(" ")`01010101`#hide(" ")],
    [*Example Output*], [#hide(" ")`10011001`#hide(" ")],
  )
]
For the above example, the following table summarizes the computations performed by the FSM.

#align(center)[
  #table(
    columns: 3,
    align: left,
    [*Input bits so far*], [*Value of input bits in decimal*], [*FSM Output*],
    [`0`#hide(" ")], [$0$], [`1`#hide(" ")],
    [`01`#hide(" ")], [$1$], [`0`#hide(" ")],
    [`010`#hide(" ")], [$2$], [`0`#hide(" ")],
    [`0101`#hide(" ")], [$5$], [`1`#hide(" ")],
    [`01010`#hide(" ")], [$10$], [`1`#hide(" ")],
    [`010101`#hide(" ")], [$21$], [`0`#hide(" ")],
    [`0101010`#hide(" ")], [$42$], [`0`#hide(" ")],
    [`01010101`#hide(" ")], [$85$], [`1`#hide(" ")],
  )
]

#pagebreak()

Fill out the transitions below. For any unused transitions, select N/A.

#let fsm-mc-spec = (
  ([`0` #sym.arrow.r `2` <fsm-arrow-1>], [N/A]),
  ([`1` #sym.arrow.r `2` <fsm-arrow-2>], [`0/0`]),
  ([`2` #sym.arrow.r `0` <fsm-arrow-3>], [`1/1`]),
  ([`2` #sym.arrow.r `1` <fsm-arrow-4>], [N/A]),
  ([`2` #sym.arrow.r `3` <fsm-arrow-5>], [N/A]),
  ([`2` #sym.arrow.r `4` <fsm-arrow-6>], [`0/0`]),
  ([`3` #sym.arrow.r `2` <fsm-arrow-7>], [`1/0`]),
  ([`3` #sym.arrow.r `4` <fsm-arrow-8>], [N/A]),
  ([`4` #sym.arrow.r `2` <fsm-arrow-9>], [N/A]),
  ([`4` #sym.arrow.r `3` <fsm-arrow-10>], [0/0]),
)

#let choices = ([`0/0`], [`0/1`], [`1/0`], [`1/1`], [N/A])

#let fsm-mc-q(label, ans) = {
  part(points: 1)[
    Transition #label
    #multi-choice(
      cols: 5,
      ..choices.map(it => if it == ans { correct(it) } else { it }),
    )
  ]
}

#for spec in fsm-mc-spec {
  fsm-mc-q(..spec)
}
