use typst_layout::Page;
use typst_library::foundations::{Content, Smart};
use typst_library::layout::{Abs, Frame, FrameItem, Point, Sides, Size};
use typst_library::model::{Destination, Url};
use typst_svg::SvgOptions;

#[test]
fn svg_link_url_with_ampersand_is_escaped() {
    let size = Size::new(Abs::pt(100.0), Abs::pt(20.0));
    let mut frame = Frame::soft(size);
    let url = Url::new("https://example.com/files?page=1&status=active<x>").unwrap();
    frame.push(Point::zero(), FrameItem::Link(Destination::Url(url), size));

    let page = Page {
        frame,
        bleed: Sides::splat(Abs::zero()),
        fill: Smart::Auto,
        numbering: None,
        supplement: Content::empty(),
        number: 1,
    };

    let svg = typst_svg::svg(&page, &SvgOptions::default());
    let escaped = "https://example.com/files?page=1&amp;status=active&lt;x&gt;";
    assert!(svg.contains(&format!("xlink:href=\"{escaped}\"")), "{svg}");
    assert!(svg.contains(&format!(" href=\"{escaped}\"")), "{svg}");
    assert!(!svg.contains("1&status"), "{svg}");
}
