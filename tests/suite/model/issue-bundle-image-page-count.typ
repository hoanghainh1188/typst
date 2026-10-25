--- issue-bundle-image-page-count bundle ---
// The image document only fits on a single page once introspection has
// converged. In the first iteration, it has two pages, which must not raise an
// error.
#document("a.png")[
  #set page(height: 100pt)
  #metadata(none) <issue-bundle-image-page-count-marker>
  #context if query(<issue-bundle-image-page-count-marker>).len() == 0 {
    rect(height: 100pt)
    rect(height: 100pt)
  } else {
    rect(height: 20pt)
  }
]

// An unrelated error that is only reported after the last iteration, so that
// the test does not produce reference output.
// Error: 21-42 label `<issue-bundle-missing>` does not exist in the document
#document("b.pdf", [@issue-bundle-missing])
