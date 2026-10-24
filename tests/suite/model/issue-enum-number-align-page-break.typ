--- issue-enum-number-align-gap-after-page-break paged ---
// When an enum item with explicit vertical number alignment breaks across
// pages, its continuation must not be stretched to the height of the marker
// (which spans the item's first frame). Otherwise, a large gap appears before
// the next item.
#set page(width: 100pt, height: 100pt, margin: 10pt)
#enum(
  number-align: top,
  spacing: 0pt,
  [
    #block(height: 60pt, breakable: false)
    #block(height: 30pt, breakable: false)
  ],
  [#metadata(none)<next-item>B],
)

#context {
  let found = query(<next-item>)
  if found.len() == 0 { return }
  let pos = found.first().location().position()
  // Error: 3-32 panicked with: 2, true
  panic(pos.page, pos.y < 50pt)
}
