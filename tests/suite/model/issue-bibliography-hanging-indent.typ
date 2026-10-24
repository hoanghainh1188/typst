--- issue-2639-bibliography-par-hanging-indent paged empty ---
// The `hanging-indent` of `par` should be respected by bibliography styles
// that use a hanging indent (e.g. APA and MLA).
#set par(hanging-indent: 200pt)
#show heading: none
#show bibliography: hide
#show "Zebra": it => [#metadata(none)<zebra>] + it

#let src = ```yaml
zebra:
  type: Book
  title: Zebra Zebra Zebra Zebra Zebra Zebra Zebra Zebra Zebra Zebra Zebra Zebra
  author: Zebra, Zebra
  date: 2020
```

#place(block(width: 300pt, bibliography(
  bytes(src.text),
  full: true,
  style: "mla",
)))

#context {
  let positions = query(<zebra>).map(m => m.location().position())
  // The first "Zebra" starts the first line.
  let start = positions.first()
  let rest = positions.filter(p => p.y > start.y)
  test(rest.len() > 0, true)
  test(rest.all(p => p.x - start.x >= 200pt), true)
}
