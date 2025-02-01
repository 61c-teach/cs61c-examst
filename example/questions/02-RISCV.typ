#import "/lib.typ": *

= LibraR(y)ISC-V

#v(-4em)

#add-points-hidden(12)
```c
typedef struct {
  uint32_t page_num;
  char *content;
  uint32_t is_read;   // 0 if unread, 1 if read
} page_t;

typedef struct {
  page_t *pages;     // array of pages
  page_t *bookmark;  // pointer to the first unread page
} book_t;
```
Implement `read_pages` to match the described behavior.

#spec(
  description: [`read_pages`: Sets `is_read` to `1` for the next `n` pages of a `book_t`, starting from the bookmark. `read_pages` updates the bookmark and pages *in place*.],
  args: (
    "a0": [A pointer to a `book_t` struct with at least `n` pages after the bookmark.],
    "a1": [`n`, the number of pages to mark as read.],
  ),
  ret: (
    "void": "",
  ),
)
Unfortunately, Anto has spilled apple juice on your compiler, so you need to fill in the `read_pages` function in RISC-V.

A struct stores only its members, with no metadata and no extra compiler padding. For example, if a `page_t` struct is located at address `0x1000`, its `page_num` is at `0x1000` and its `content` is at `0x1004`.

```
read_pages:
  <|lw|>{11} t3 <|4|>{12}(<|a0|>{12}) # bookmark
  li t1 1
loop:
  beq <|a1 x0 end|>{36}
  <|sw t1 8(t3)|>{40}
  addi t3 <|t3 12|>{32}
  addi a1 <|a1 -1|>{32}
  j loop
end:
  <|sw|>{11} t3 <|4|>{12}(<|a0|>{12})
  ret
```
