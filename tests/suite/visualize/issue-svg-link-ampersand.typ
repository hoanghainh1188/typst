--- issue-svg-link-ampersand eval ---
// SVG escaping of `&` in link URLs is checked in
// `crates/typst-svg/tests/issue_svg_link_ampersand.rs`, since the suite cannot
// inspect exported SVG for new tests. Here we check the URL is kept verbatim.
#let url = "https://example.com/files?page=1&status=active"
#test(link(url).dest, url)
