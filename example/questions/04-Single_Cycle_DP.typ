#import "/lib.typ": *
// = JISC-V Datapath
= Datapath Jadditions

For this question, assume we are working with the single cycle datapath.

A `jaddi` instruction in RISC-V is a new instruction described as follows:

`jaddi rd rs1 imm`
```
rd = rs1 + imm
PC = rs1 + imm
```

For each of the control signals, indicate the value it should always have for `jaddi`. You may assume that we only jump to word-aligned addresses.

#part(points: 1)[
  `PCSel`
  #multi-choice(
    cols: 3,
    [`PC + 4`],
    correct()[ALU output],
    [Doesn't matter],
  )
]

#part(points: 1)[
  `ASel`
  #multi-choice(
    cols: 3,
    correct()[RegReadData1],
    [`PC`],
    [Doesn't matter],
  )
]
#part(points: 1)[
  `BSel`
  #multi-choice(
    cols: 3,
    [RegReadData2],
    correct()[ImmGen output],
    [Doesn't matter],
  )
]
#part(points: 1)[
  `ALUSel`
  #multi-choice(
    cols: 3,
    correct()[`add`],
    [`sub`],
    [`and`],
    [`or`],
    [Doesn't matter],
  )
]

#part(points: 1)[
  `MemRW`
  #multi-choice(
    cols: 3,
    correct()[Memory read],
    [Memory write],
    [Doesn't matter],
  )
]

#part(points: 1)[
  `WBSel`
  #multi-choice(
    cols: 3,
    [Mem],
    [`PC + 4`],
    correct()[ALU output],
    [Doesn't matter],
  )
]
#part(points: 1)[
  `RegWEn`
  #multi-choice(
    cols: 3,
    [Write enabled],
    correct()[Write disabled],
    [Doesn't matter],
  )
]

#v(1fr)
#pagebreak()
Consider the new instruction `jalm` below.

`jalm rd imm(rs1)`

#v(-25em)
```c
rd = PC + 4
PC = 4 bytes of memory starting at address (rs1 + imm)
```
#v(-0.5em)

#part(points: 3)[
  What additional changes, if any, would we need to make to our single-cycle datapath in order for us to implement `jalm` (with as few changes as possible)? Select all that apply. <start_jalm>

  #multi-select(
    correct()[Create a new instruction type and update the ImmGen.],
    [Add a new read input to the RegFile for a third register value.],
    [Add a new WriteData and WriteIndex input to the RegFile.],
    [Add a third possible value for `ASel` and update the corresponding MUX/control logic.],
    [Add a third possible value for `BSel` and update the corresponding MUX/control logic.],
    [Add a new ALU operation and update any relevant selector/control logic.],
    correct()[Add a third possible value for `PCSel` and update the corresponding MUX/control logic.],
    [Allow the DMEM to be able to read and write at the same clock cycle and update any relevant selector/control logic.],
    [Add a new read input to DMEM for a second memory read output.],
    [Add a fourth possible value for `WBSel` and update the corresponding MUX/control logic.],
    none-above: true,
  )
]

// #part(points: 2)[
//   Regardless of your answer to the previous subpart, if the `jalm` instruction has a 15-bit immediate (no implicit 0), what are the minimum and maximum possible values of the immediate for this instruction format? You may express your answer in terms of powers of two. <end_jalm>

//   #stack(dir: ltr, spacing: 1em,
//       answer-box(pre: "Min: ", width: 50% - 0.5em)[],
//       answer-box(pre: "Max: ", width: 50% - 0.5em)[]
//     )
// ]

// #part(points: 1)[
//   Suppose your branch comparator outputs a `BrGt` (branch greater than) signal instead of a `BrEq` signal. Using `BrLt` and `BrGt`, write a simplified Boolean expression for the `BrEq` signal using `BrLt` and `BrGt`.

//   #align(center)[
//   #table(
//     columns: 6,
//     align: center + horizon,
//     [NOT], [OR], [AND], [Constants], [Parentheses], [Variables],
//     [`!`], [`+`], [`*`],[`0`, `1`], [`()`], [`BrGt`, `BrLt`]
//   )
// ]
//   #answer-box(width: 80%)[]
// ]


// *1. How many cycles is the single cycle datapath?* (15000 points)

// (a) 0
// (b) 1
// (c) 2
// (d) 3

// *2. Which of the following is in the path (lowercase)? Choose all that apply.* (80000 points)

// (a) data
// (b) C:/Users/Andrew/bin
// (c) shortest
// (d) None of the above

// *3. Which of the following is a valid boolean algebra value?* (2000000 points)

// (a) 1/True
// (b) 2/Trueist
// (c) 0.5/Maybe
// (d) 0.1/Kinda
