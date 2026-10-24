--- issue-place-in-layout-alignment paged empty ---
// Vertical alignment of `place` inside of `layout` must be relative to the
// container, like it is without `layout`.
#place(box(width: 50pt, height: 50pt)[#layout(_ => {
  place(top + left, box(width: 10pt, height: 10pt)[#metadata(none) <o>])
  place(center + horizon, box(width: 10pt, height: 10pt)[#metadata(none) <a>])
  place(bottom + right, box(width: 10pt, height: 10pt)[#metadata(none) <b>])
})])

#context {
  let o = locate(<o>).position()
  let a = locate(<a>).position()
  let b = locate(<b>).position()
  test((a.x - o.x, a.y - o.y), (20pt, 20pt))
  test((b.x - o.x, b.y - o.y), (40pt, 40pt))
}

--- issue-place-in-layout-relative-dy paged empty ---
// Relative `dy` of `place` inside of `layout` must be relative to the
// container, like it is without `layout`.
#place(box(width: 50pt, height: 50pt)[#layout(_ => {
  place(top + left, box(width: 10pt, height: 10pt)[#metadata(none) <o>])
  place(top + left, dx: 50%, dy: 40%, box(width: 10pt, height: 10pt)[#metadata(none) <a>])
})])

#context {
  let o = locate(<o>).position()
  let a = locate(<a>).position()
  test((a.x - o.x, a.y - o.y), (25pt, 20pt))
}
