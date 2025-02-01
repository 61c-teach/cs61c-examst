#import "/lib.typ": *

= MixC Mystery

Consider the `mystery` function, which takes in one argument in `a0`, and returns one output in `a0`.

#v(-0.5em)
```
mystery:
  lbu t0 0(a0)
  li a0 0
loop:
  andi t1 t0 1
  add a0 a0 t1
  srai t0 t0 1
  bne t0 x0 loop
  ret
```

#part(points: 1)[
  What does the `mystery` function return?

  #multi-choice(
    cols: 1,
    rows: 3,
    // [Index of the most],
    [Bitwise `and` of `0x01` and the byte pointed to by `a0`],
    correct()[Number of binary `1`s in the byte pointed to by `a0`],
    [Always returns `8`],
  )
]

For @start_mystery -- @end_mystery, suppose we replaced the `lbu` on line 2 with `lb`, which introduces a bug. The buggy `mystery` and the original `mystery` now behave differently. To help find the difference between their behaviors, we use the C function defined below:
```
void mysterytest(uint8_t n) {
  printf("%d\n", mystery(&n));
}
```


#part(points: 3)[
  Complete the following sentence:

  If the value of `n` is `0x91`, the original `mystery` printed the decimal value... <start_mystery>

  #answer-box()[1]
  however, the buggy `mystery` instead...
  #multi-choice(
    cols: 4,
    rows: 1,
    [prints 0],
    [prints 27],
    [segfaults],
    correct()[infinitely loops],
  )
]

#part(points: 2)[
  What is the smallest 8-bit value of `n` that results in the buggy behavior?

  #answer-box(pre: `0x`)[`80`]
]

#part(points: 1)[
  Which section of memory does the symbol `n` live in? <end_mystery>
  #multi-choice(
    cols: 4,
    rows: 1,
    [Code],
    [Static],
    [Heap],
    correct()[Stack],
  )
]
#v(1fr)
