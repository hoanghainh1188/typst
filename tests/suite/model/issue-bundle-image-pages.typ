--- issue-bundle-image-pages-iteration bundle ---
// The first iteration lays out more than one page because the marker is not
// yet found by the introspector. This must not be an error as the final
// iteration results in a single page. The unrelated error below makes sure
// that the only reported error is the expected one.
#document("a.png")[
  #context if query(<issue-bundle-marker>).len() == 0 {
    pagebreak()
  }
  #metadata(none) <issue-bundle-marker>
]

#document("b.svg")[
  #context if query(<issue-bundle-marker-2>).len() == 0 {
    pagebreak()
  }
  #metadata(none) <issue-bundle-marker-2>
]

// Error: 2-21 unknown document format
// Hint: 2-21 try specifying the `format` explicitly
#document("c.txt")[]
