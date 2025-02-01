#import "/lib.typ": *

= `is_odd_and_parallel`

// Trying it out!
Taki is given a sequence of characters and needs to find the odd characters. An odd character is a character that appears an odd number of times in the sequence. Help Taki by implementing the below function.
// #v(-2em)
#spec(
  description: [`get_odd_characters`:],
  args: (
    "uint32_t *seq": [An array of characters. Each character is zero-extended to 32 bits and stored in a `uint32_t`.],
    "int size": [The number of characters in `seq`.],
  ),
  ret: (
    "uint32_t": [
      A bit array of the characters that are odd, stored in a `uint32_t`.
    ],
  ),
)

For example, given the characters `a c c h h h b`:
- The odd characters are `a h b`.
- `get_odd_characters` should return `0b0000 0000 0000 0000 0000 0000 1000 0011`, a bit array where each bit corresponds to a character, where bit 0 corresponds to `a`, and bit 25 corresponds to `z`. (Note that bits 26--31 are unused.)

// #todo("Ben")

Here is a correct implementation of `get_odd_characters.` Your answer should have the same behavior.
```
uint32_t get_odd_characters(uint32_t *seq, int size) {
  uint32_t res = 0;
  for (int i = 0; i < size, i++) {
    res ^= 1 << (seq[i] - 0x61);
  }
  return res;
}
```

You have access to the following SIMD operations. A `vector` is a 128-bit vector register capable of holding four 32-bit integers:
#par(justify: false)[
  - `vector vec_load(uint32_t *A)`: Loads four integers at memory address `A` into a vector.
  - `void   vec_store(uint32_t *dst, vector src)`: Stores `src` to `dst`.
  - `vector vec_setnum(uint32_t num)`: Creates a vector where every element is equal to `num`.
  - `vector vec_and(vector A, vector B)`: Returns the result of ANDing `A` and `B` element-wise.
  - `vector vec_or (vector A, vector B)`: Returns the result of ORing `A` and `B` element-wise.
  - `vector vec_xor(vector A, vector B)`: Returns the result of XORing `A` and `B` element-wise.
  - `vector vec_add(vector A, vector B)`: Returns the result of adding `A` and `B` element-wise.
  - `vector vec_sub(vector A, vector B)`: Returns the result of subtracting `B` from `A` element-wise.
  - `vector vec_sll(vector A, vector count)`: Returns the result of left-shifting each element in `A` by the number of bits specified in the corresponding element of `count`.
]

#v(1fr)
#pagebreak()

Implement `get_odd_characters` to match the described behavior using SIMD. You may use at most one SIMD instruction per line.
#add-points-hidden(14)
```c
uint32_t get_odd_characters(uint32_t* seq, int size) {
  uint32_t res = 0;
  vector res_vec = vec_setnum(0);
  vector ones = vec_setnum(1);
  vector offset = vec_setnum(0x61);
  for (int i = 0; i < <|size / 4 * 4|>{23}; <|i += 4|>{24}) {
    vector a = <|vec_load(seq + i)|>{63};
    vector b = <|vec_sub(a, offset)|>{63};
    vector c = <|vec_sll(ones, b)|>{63};
    res_vec = <|vec_xor(res_vec, c)|>{64};
  }
  uint32_t arr[4];
  vec_store(<|(vector *) arr, res_vec|>{65});
  <|res = arr[0] ^ arr[1] ^ arr[2] ^ arr[3]|>{76};

  for (int i = <|size / 4 * 4|>{41}; i < size; i++) {
    res ^= 1 << (seq[i] - 0x61);
  }
  return res;
}
```
#v(1fr)
