--- issue-bibliography-full-numbering paged empty ---
// Test that a full bibliography without any citations still advances the
// numbering offset of the following bibliography in the same group.
#let style = ```csl
  <?xml version="1.0" encoding="utf-8"?>
  <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0">
    <info>
      <title>Test</title>
      <id>test</id>
    </info>
    <citation collapse="citation-number">
      <layout>
        <text variable="citation-number"/>
      </layout>
    </citation>
    <bibliography>
      <layout>
        <text variable="citation-number"/>
      </layout>
    </bibliography>
  </style>
```

#let bib-a = ```bib
  @article{entry1,
    title={Title 1},
    author={Author 1},
    year={2021},
  }
  @article{entry2,
    title={Title 2},
    author={Author 2},
    year={2022},
  }
```

#let bib-b = ```bib
  @article{entry3,
    title={Title 3},
    author={Author 3},
    year={2023},
  }
```

#let nums = state("nums", ())
#show regex("\d+"): it => {
  nums.update(a => a + (it.text,))
  it
}

#place(hide[
  #bibliography(bytes(bib-a.text), style: bytes(style.text), title: none, full: true)
  #bibliography(bytes(bib-b.text), style: bytes(style.text), title: none, full: true)
])

#context assert.eq(nums.final(), ("1", "2", "3"))
