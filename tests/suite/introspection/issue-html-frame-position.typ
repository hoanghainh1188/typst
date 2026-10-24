--- issue-html-frame-position html ---
// Positions inside of an HTML frame are well-defined and should be reported.
// The error is used to observe the final position without producing output.
// Error: 10-39 panicked with: (page: 1, x: 90pt, y: 55pt)
#context panic(locate(<a>).position())

#html.frame(box(width: 300pt, height: 120pt, {
  place(top + left, dx: 90pt, dy: 55pt, [#metadata(none)<a>A])
}))
