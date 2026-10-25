--- issue-raw-text-multibyte-after-closing-sequence html ---
// Error: 2-39 HTML raw text element cannot contain its own closing tag
// Hint: 2-39 the sequence `</style` appears in the raw text
#html.style("</abcd\u{2212} </style>")
