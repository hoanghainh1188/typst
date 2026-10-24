--- issue-html-frame-position-second-frame html ---
// Positions are relative to the frame that contains the element.
// The error is used to observe the final position without producing output.
// Error: 10-39 panicked with: (page: 1, x: 20pt, y: 10pt)
#context panic(locate(<b>).position())

#html.frame(box(width: 100pt, height: 100pt))

#html.frame(box(width: 100pt, height: 100pt, {
  place(top + left, dx: 20pt, dy: 10pt, [#metadata(none)<b>B])
}))
