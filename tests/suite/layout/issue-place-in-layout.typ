--- issue-place-in-layout paged empty ---
// Vertical alignment and relative `dy` of `place` must be resolved against
// the full container size inside of `layout`.
#place(box(width: 50pt, height: 50pt, layout(_ => {
  place(bottom, [#metadata(none) <b>])
  place(top, dy: 100%, [#metadata(none) <c>])
  place(horizon, [#metadata(none) <d>])
})))

#context {
  test(locate(<b>).position().y, 60pt)
  test(locate(<c>).position().y, 60pt)
  test(locate(<d>).position().y, 35pt)
}
