--- issue-delimiter-alignment paged empty ---
// Delimiters on a row with an alignment point must not disturb alignment.
#hide(context {
  let fenced = measure($& x \ ( & x )$)
  let plain = measure($& x \ \( & x \)$)
  assert.eq(fenced.width, plain.width)
  let fenced = measure($& x \ { & x }$)
  let plain = measure($& x \ \{ & x \}$)
  assert.eq(fenced.width, plain.width)
})
