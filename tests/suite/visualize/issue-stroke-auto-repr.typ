--- issue-stroke-auto-repr eval ---
#assert.eq(eval(repr(stroke())), stroke())
#assert.ne(repr(stroke()), "1pt + black")
