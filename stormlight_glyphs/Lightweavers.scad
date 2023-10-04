//linear_extrude(height=8) {
//    import("/Users/audrey/Downloads/Lightweavers_glyph.svg", 0, 0);
//}

scale([.5, .5, 1]) import("/Users/audrey/Personal/3d_models/stormlight_glyphs/Lightweavers_centered.stl");

translate([0, 2, 0]) minkowski() {
    cylinder(h=5, r=55);
    sphere(1);
}