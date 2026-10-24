--- issue-html-frame-position html ---
// Inside of `html.frame`, the position is known and relative to the frame.
// The panic is there to observe the value without a reference output.
#html.frame(box(width: 300pt, height: 120pt, {
  place(top + left, dx: 90pt, dy: 55pt, [#metadata(none)<a>A])
}))

// Error: 10-39 panicked with: (page: 1, x: 90pt, y: 55pt)
#context panic(locate(<a>).position())
