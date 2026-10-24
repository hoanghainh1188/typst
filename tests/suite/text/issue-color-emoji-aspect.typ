--- issue-color-emoji-aspect paged empty ---
// Smoke test: a Noto Color Emoji glyph lays out with a nonzero width. The
// aspect ratio of bitmap (CBDT) glyph images is only visible in exported
// output and cannot be asserted from Typst code.
#let emoji = text(5em, font: "Noto Color Emoji", fallback: false)[✅]
#context assert(measure(emoji).width > 0pt)
