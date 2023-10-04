radiant_order = "Truthwatchers";

//linear_extrude(height=8) {
//    import(str("/Users/audrey/Downloads/", radiant_order, "_glyph.svg"), 0, 0);
//}

scale([.5, .5, 1]) import(str("/Users/audrey/Personal/3d_models/stormlight_glyphs/", radiant_order, "_centered.stl"));

translate([0, 2, 0]) minkowski() {
    cylinder(h=5, r=55);
    sphere(1);
}