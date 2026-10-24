--- issue-8476-bibliography-full-offset paged ---
// A full bibliography without any citations must still advance the numbering
// offset for following bibliographies in the same group. The second
// bibliography's only entry must thus be numbered `[3]`, which triggers the
// expected panic below.
#let a = ```bib
  @article{a1, title={A1}, author={X}, year={2020}}
  @article{a2, title={A2}, author={X}, year={2020}}
```
#let b = ```bib
  @article{b1, title={B1}, author={Y}, year={2021}}
```

#bibliography(bytes(a.text), full: true)
// Error: 20-35 panicked with: offset
#show "[3]": it => panic("offset")
#bibliography(bytes(b.text), full: true)
