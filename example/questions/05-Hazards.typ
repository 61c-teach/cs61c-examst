#import "/lib.typ": *

= Hazardous Ordering
In this question, use the five-stage pipeline on the reference card. Assume that:
- The RegFile can perform write-then-read on the same clock cycle (also called double pumping).
- There is no forwarding.
- We always predict that the branch is not taken.

For questions @start_hazards -- @end_hazards, identify the number of stalls needed and the hazard type between the indicated lines in the code block below. If you select None as the hazard type, write "N/A" in the box.

```c
addi t0 x0 1
lw t1 0(s0)
sw t1 4(s0)
```

#part(points: 2)[
  Between lines 1 and 2: <start_hazards>
  #grid(
    columns: (1fr, 1fr),
    align: top,
    [
      #v(0.6em)
      #answer-box(width: 100%, post: " stall(s)")[C, A, B, D]
    ],
    multi-choice(cols: 2, none-above: false, [Control], [Data], [Structural], [None]),
  )
]

// #part(points: 2)[
//   Between lines 3 and 4.
//   #grid(columns: (1fr, 1fr), align: top,
//   [
//     #v(0.6em)
//     #answer-box(width: 100%, post: "stalls")[C, A, B, D]
//   ],
//   multi-choice(cols: 2, none-above: false,
//   [Control], [Data/Structural], [None]
//   ))
// ]

#part(points: 2)[
  Between lines 2 and 3: <end_hazards>
  #grid(
    columns: (1fr, 1fr),
    align: top,
    [
      #v(0.6em)
      #answer-box(width: 100%, post: " stall(s)")[C, A, B, D]
    ],
    multi-choice(cols: 2, none-above: false, [Control], [Data], [Structural], [None]),
  )
]


#part(points: 2)[
  Rearrange the instructions below to minimize the number of stalls while maintaining the same behavior.
  ```c
  addi t0 x0 4  # Instruction A
  addi t1 t0 4  # Instruction B
  lw s0 0(s1)   # Instruction C
  add a0 s0 t1  # Instruction D
  ```
  Format your answer as a comma-separated list. For example, the instruction order in the code block above would be described as "A, B, C, D".

  #answer-box()[A, C, B, D]
]

#v(1fr)
