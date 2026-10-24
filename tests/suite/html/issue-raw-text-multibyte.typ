--- issue-raw-text-multibyte-closing-tag html ---
// Error: 2-32 HTML raw text element cannot contain its own closing tag
// Hint: 2-32 the sequence `</style` appears in the raw text
#html.style("</abcd− </style>")
