--- issue-enum-gap-page-break paged ---
// Labels in enum numbers must not cause gaps when the enum breaks across
// pages. The final panic only ensures that the test has no reference output;
// a failing assertion would replace it with a different error.
#set page(width: 6in, height: 9in, margin: 1in)
#box[]<k1-source>
#box[]<k2-source>
#box[]<k3-source>
#box[]<k4-source>
#box[]<k5-source>
#let counts = (8, 90, 15, 230, 120)
#enum(
  number-align: top + end,
  indent: 17pt,
  spacing: 0pt,
  numbering: n => [#let k = "k" + str(n);#link(label(k + "-source"), [x])#label(k)],
  ..counts
    .enumerate()
    .map(((i, n)) => enum.item[
      #box[]#label("s" + str(i + 1))#par(lorem(n))#box[]#label("e" + str(i + 1))
    ]),
)

#let check() = {
  for i in range(1, counts.len()) {
    let end = locate(label("e" + str(i))).position()
    let start = locate(label("s" + str(i + 1))).position()
    if end.page == start.page {
      assert(
        start.y - end.y < 2em.to-absolute(),
        message: "gap between items " + str(i) + " and " + str(i + 1)
          + ": " + repr(start.y - end.y),
      )
    } else {
      assert(
        start.y < 1in + 2em.to-absolute(),
        message: "item " + str(i + 1) + " starts too low: " + repr(start.y),
      )
    }
  }
}

// Error: 20-31 panicked with: ok
#context {check(); panic("ok")}
