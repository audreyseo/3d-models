radiant_order = "Dustbringers";

//linear_extrude(height=8) {
//    import(str("/Users/audrey/Downloads/", radiant_order, "_glyph.svg"), 0, 0);
//}

scale([.5, .5, 1]) import(str("/Users/audrey/Personal/3d_models/stormlight_glyphs/", radiant_order, "_centered.stl"));

minkowski() {
    cylinder(h=5, r=55, $fn=100);
    sphere(1);
}

module mytext() {
    linear_extrude(height=1) {
        text("⠙⠥⠎⠞⠃⠗⠊⠝⠛⠑⠗", size=4, halign="center", font="Apple Braille:style=Pinpoint 6 Dot");
    }
}

#translate([0, -50, 5.4])  mytext();