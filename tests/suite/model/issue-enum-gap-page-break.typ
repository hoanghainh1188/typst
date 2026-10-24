--- issue-enum-gap-page-break paged ---
#let note(content) = content
#set page(width: 200pt, height: 100pt, margin: 10pt)
#set text(size: 10pt)
#let body(n, words) = enum.item(note(par({
  [#metadata(none)#label("s" + str(n))]
  "Lorem ipsum dolor sit amet " * words
  [#metadata(none)#label("e" + str(n))]
})))
#box[]<k1-source>
#box[]<k2-source>
#box[]<k3-source>
#box[]<k4-source>
#box[]<k5-source>
#enum(
  number-align: top + end,
  indent: 17pt,
  spacing: 0pt,
  numbering: n => {
    let k = "k" + str(n)
    [#link(label(k + "-source"), [x])#label(k)]
  },
  body(1, 1),
  body(2, 25),
  body(3, 1),
  body(4, 40),
  body(5, 1),
)

#context {
  for n in range(1, 5) {
    let end = locate(label("e" + str(n))).position()
    let start = locate(label("s" + str(n + 1))).position()
    if end.page == start.page {
      assert(start.y - end.y < 15pt, message: "gap before item " + str(n + 1))
    } else {
      assert(start.y < 25pt, message: "gap at top before item " + str(n + 1))
    }
  }
}

// The checks above run during layout. Fail the layout on purpose afterwards
// so that this test needs no reference output.
// Error: 10-26 panicked with: checked
#context panic("checked")
