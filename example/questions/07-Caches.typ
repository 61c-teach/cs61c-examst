#import "/lib.typ": *

= Caches

#part(points: 2)[
  What is the tag-index-offset breakdown of a 256B, fully-associative cache with a 32B block size on a 16-bit system?


  #stack(
    dir: ltr,
    spacing: 1em,
    answer-box(width: 33% - 0.33em, pre: "Tag: ", post: " bit(s)")[11],
    answer-box(width: 33% - 0.33em, pre: "Index: ", post: " bit(s)")[0],
    answer-box(width: 33% - 0.33em, pre: "Offset: ", post: " bit(s)")[5],
  )
]

For @start_cache -- @end_cache, assume we are using a 2-way set-associative cache with a First-In-First-Out (FIFO) replacement policy, and each address has 9 tag bits, 3 index bits, and 4 offset bits.

You may assume the following:
- The cache starts out empty.
- In expressions of the form `a += b`, `a` is read first, then `b` is read, and then `a` is written.

```
int32_t arr[32 * 32]; // arr starts at address 0x0100
for (register int32_t i = 0; i < 32 ; i++) {
  for (register int32_t j = 1; j < 32; j++) {
    arr[i] += arr[32 * j + i];
  }
}
```

#part(points: 2)[
  Which address is accessed on the first compulsory miss? <start_cache>

  #answer-box(width: 50%, pre: `0x`)[`0100`]
]

#part(points: 2)[
  How many cache hit(s) occur on the first execution of the innermost statement?
  #v(-0.5em)
  (`i = 0`, `j = 1`)

  #multi-choice(
    cols: 4,
    correct()[0 hits],
    [1 hit],
    [2 hits],
    [3 hits],
  )
]

#part(points: 2)[
  How many cache hit(s) occur on the second execution of the innermost statement? <end_cache>
  #v(-0.5em)
  (`i = 0`, `j = 2`)

  #multi-choice(
    cols: 4,
    correct()[0 hits],
    [1 hit],
    [2 hits],
    [3 hits],
  )
]

// #part(points: 2)[
//   Now suppose we have a 4-way set associative cache with the same parameters: 9 tag bits, 3 index bits, 4 offset bits, and FIFO replacement policy. The overall hit rate… <end_cache>

//   #multi-choice(
//     cols: 3,
//     correct()[increases], [remains the same], [decreases]
//   )
// ]

#v(1fr)
#pagebreak()
For Q7.6 -- Q7.9, complete the code below to be more cache-efficient while maintaining the same behavior as above. You may assume the original cache parameters: 2-way set-associative cache with 9 tag bits, 3 index bits, 4 offset bits, and FIFO replacement policy.

```
int32_t array[32 * 32]; // arr starts at address 0x0100
for (register int32_t i = @|Q7.6|@{6}; i < 32; i++) {
  for (register int32_t j = [@|Q7.7|@{6}]; j < 32; j++) {
    array[@|Q7.8|@{6}] += array[@|Q7.9|@{6}];
  }
}
```

#states.part-num.update(it => 5)

#part(points: 1, noprompt: true)[
  #multi-choice(
    cols: 4,
    correct()[`1`],
    [`0`],
    [`31`],
    [`32 * 32`],
  )
]

#part(points: 1, noprompt: true)[
  #multi-choice(
    cols: 4,
    [`1`],
    correct()[`0`],
    [`31`],
    [`32 * 32`],
  )
]

#part(points: 1, noprompt: true)[
  #multi-choice(
    cols: 4,
    [`i`],
    correct()[`j`],
    [`32 * i`],
    [`32 * j`],
  )
]

#part(points: 1, noprompt: true)[
  #multi-choice(
    cols: 4,
    [`32 * i`],
    [`32 * j`],
    [`32 * j + i`],
    correct()[`32 * i + j`],
  )
]

#part(points: 2)[
  Consider the two below memory systems:
  //You currently have a single cache memory system consisting of an L1 cache and DRAM. The hit times and hit rates are listed below:

  #align(center)[
    #grid(
      columns: 2,
      column-gutter: 4em,
      table(
        columns: 3,
        // table.cell(colspan: 3)[Old Memory System],
        [], [*Hit Time*], [*Hit Rate*],
        [L1 Cache], [10ns], [60%],
        // [L2 Cache], [70ns], [?],
        [DRAM], [100ns], [100%],
      ),
      table(
        columns: 3,
        // table.cell(colspan: 3)[New Memory System],
        [], [*Hit Time*], [*Hit Rate*],
        [L1 Cache], [10ns], [60%],
        [L2 Cache], [70ns], [?],
        [DRAM], [100ns], [100%],
      ),
    )

  ]

  If the AMAT (average memory access times) of the two systems are equal, what is the local hit rate of the L2 Cache in the right system?

  #answer-box(pre: "Hit Rate: ", post: "%")[70]

]

#v(1fr)
