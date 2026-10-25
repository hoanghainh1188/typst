--- issue-position-html-frame html ---
// Positions inside of an `html.frame` are well-defined. The deliberate panic
// prevents HTML output (which would need a reference file) while keeping the
// delayed assertion meaningful.
#html.frame(box(width: 300pt, height: 120pt, {
  place(top + left, dx: 90pt, dy: 55pt, [#metadata(none)<a>A])
}))

#context {
  test(locate(<a>).position(), (page: 1, x: 90pt, y: 55pt))
  // Error: 3-16 panicked with: done
  panic("done")
}
