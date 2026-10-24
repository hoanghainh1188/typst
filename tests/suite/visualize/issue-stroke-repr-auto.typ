--- issue-stroke-repr-auto eval ---
#assert.eq(repr(stroke()), "stroke()")
#assert.eq(eval(repr(stroke())), stroke())
#assert.ne(stroke(), stroke(1pt + black))
