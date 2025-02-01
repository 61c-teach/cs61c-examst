#import "/lib.typ": *

= Separate Timings

In this question, assume that:
- All registers are initialized to 0.
- The 32-bit tunnels `In`, `Out1`, and `Out2` are directly connected to registers.
- The select bit of the MUX is wired to bit 31 of `In` via the splitter.
- The NOT gate outputs the bitwise `not` of its input (e.g. `not(0b01010) == 0b10101`).

#align(center)[
  #block(height: auto)[
    #image(width: 100%, "images/sds-diagram.png")
  ]
]
$
  &t_"clk-to-q" = 10"ns" && wide t_"setup" = 5"ns" && wide t_"not" = 30"ns" \
  &t_"mux" = 15"ns" && wide t_"adder" = 10"ns" && wide t_"subtractor" = 20"ns" \
$


#part(points: 2)[
  What is the *minimum clock period* for this circuit to function properly, in nanoseconds?

  #answer-box(post: " ns")[90]
]

#part(points: 2)[
  What is the *maximum hold time* for this circuit to function properly, in nanoseconds?

  #answer-box(post: " ns")[30]
]

#part(points: 2)[
  If we pass $#raw("In") = -6$ to the circuit as a 32-bit two's complement integer, what will the output at `Out1` be, in decimal?

  #answer-box()[6]
]

#pagebreak()
We want to improve the performance of this circuit by adding a *single* pipeline register to create a *two-stage* pipeline. Three possible separations between the stages are drawn on the circuit diagram below.


#align(center)[
  #image(width: 100%, "images/sds-diagram-pipe.png")
]
The delays are repeated for your convenience:
$
  &t_"clk-to-q" = 10"ns" && wide t_"setup" = 5"ns" && wide t_"not" = 30"ns" \
  &t_"mux" = 15"ns" && wide t_"adder" = 10"ns" && wide t_"subtractor" = 20"ns" \
$

// #part(points: 2)[
//   Select each separation that would allow for a strictly higher maximum clock frequency compared to the unpipelined circuit. Consider each separation independently.

//   #multi-select(
//     cols: 3,
//     correct()[Separation `A`], correct()[Separation `B`], [Separation `C`]
//   )
// ]

#part(points: 2)[
  Which separation allows for the highest possible clock frequency? Explain in ten words or fewer.

  #multi-choice(
    cols: 3,
    correct()[Separation A],
    [Separation B],
    [Separation C],
  )

  #answer-box(width: 100%)[Has the lowest critical path]
]
