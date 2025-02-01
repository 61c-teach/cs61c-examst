#import "/lib.typ": *

= Virtually Valid
For @start_vm -- @end_vm, suppose we have a system with 4 GiB of virtual memory, 1 GiB of physical memory, 4 KiB pages, and 4B page table entries.

#part(points: 2)[
  How many bits are in the Virtual Page Number (VPN), Physical Page Number (PPN), and Page Offset? <start_vm>

  #stack(
    dir: ltr,
    spacing: 1em,
    answer-box(width: 33% - 0.33em, pre: "VPN: ", post: " bit(s)")[20],
    answer-box(width: 33% - 0.33em, pre: "PPN: ", post: " bit(s)")[18],
    answer-box(width: 33% - 0.33em, pre: "Offset: ", post: " bit(s)")[12],
  )
]

#part(points: 1)[
  How many entries are in the page table? You may express your answer as a power of 2.
  #answer-box(width: 30%)[$2^(20)$]
]

#part(points: 2)[
  How many physical pages are needed to store the page table? You may express your answer as a power of 2.

  Reminder: Page table entries are 4 bytes each. <end_vm>
  #answer-box(width: 30%)[$2^(10)$]
]

#pagebreak()

For the remaining parts, assume we have 16-bit VPNs, 12-bit PPNs, 8-bit page offsets, and 32-bit page table entries. The TLB and the first six entries of the page table are shown below.

The next available free page has PPN `0x42D`.

#grid(
  columns: (1fr, 1fr),
  align: center,
  [#table(
      columns: 1,
      align: center,
      [*Page Table*],
      [`0xB61C 0483`],
      [`0xFB83 A61C`],
      [`0x8483 3F01`],
      [`0x7ABC 4103`],
      [`0xC012 F7CB`],
      [`0x15DA C203`],
      [`...`],
    )],
  [#table(
      columns: 3, align: center,
      table.cell(colspan: 3)[*TLB*],
      [*Valid*], [*VPN*], [*PPN*],
      [`1`], [`0x0000`], [`0x483`],
      [`1`], [`0x0001`], [`0x61C`],
      [`0`], [`0x0002`], [`0xB83`],
      [`0`], [`0x0005`], [`0x483`],
    )],
)

Each page table entry (PTE) is formatted as:

#align(center)[
  #box(
    width: 80%,
    table(
      columns: (5fr, 16fr, 10fr),
      align: center,
      [1 Valid Bit], [19 Status Bits], [12 PPN Bits],
    ),
  )]



For each of the following virtual addresses, translate it to its corresponding physical address and answer whether accessing it will result in a TLB hit, TLB miss and page table hit, or a page fault. Assume each access occurs independently, not sequentially.

// #part(points: 2)[
//   `0x000483`
//   #grid(columns: (1fr, 1fr),
//     [
//       #v(1.8em)
//       #answer-box(width: 100%, pre: `0x`)[`0x7CB83`]
//     ],
//     multi-choice(
//       cols: 1,
//       [TLB Hit], correct()[TLB Miss and Page Table Hit], [Page Fault]
//     )
//   )
// ]

#part(points: 2)[
  `0x000529`

  #grid(
    columns: (1fr, 1fr),
    [
      #v(1.8em)
      #answer-box(width: 100%, pre: `0x`)[`42D29`]
    ],
    multi-choice(
      cols: 1,
      [TLB Hit],
      [TLB Miss and Page Table Hit],
      correct()[Page Fault],
    ),
  )
]

#part(points: 2)[
  `0x00018D`
  #grid(
    columns: (1fr, 1fr),
    [
      #v(1.8em)
      #answer-box(width: 100%, pre: `0x`)[`61C8D`]
    ],
    multi-choice(
      cols: 1,
      correct()[TLB Hit],
      [TLB Miss and Page Table Hit],
      [Page Fault],
    ),
  )
]

#part(points: 2)[
  `0x002045`
  #grid(
    columns: (1fr, 1fr),
    [
      #v(1.8em)
      #answer-box(width: 100%, pre: `0x`)[`F0145`]
    ],
    multi-choice(
      cols: 1,
      [TLB Hit],
      correct()[TLB Miss and Page Table Hit],
      [Page Fault],
    ),
  )
]
