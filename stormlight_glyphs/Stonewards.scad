radiant_order = "Stonewards";

//linear_extrude(height=8) {
//    import(str("/Users/audrey/Downloads/", radiant_order, "_glyph.svg"), 0, 0);
//}

difference() {
    scale([.5, .5, 1]) import(str("/Users/audrey/Personal/3d_models/stormlight_glyphs/", radiant_order, "_centered.stl"));
    translate([50, -50, -1]) cube([100, 100, 30]);
}

minkowski() {
    cylinder(h=5, r=55);
    sphere(1);
}