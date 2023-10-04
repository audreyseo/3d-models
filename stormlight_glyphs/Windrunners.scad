//linear_extrude(height=20) {
//    import("/Users/audrey/Downloads/Windrunners_glyph.svg", 0, 0);
//}

scale([.5, .5, 0.4]) import("/Users/audrey/Personal/3d_models/stormlight_glyphs/PI3MK3M_Windrunners.stl");

minkowski() {
    cylinder(h=5, r=55);
    sphere(1);
}

//module drawLedgeRing()
//{
//    difference()
//    {
//        cylinder(4,10,10);
//
//        translate([0,0,-1])
//        cylinder(4,6,6);
//
//        translate([0,0,2])
//        cylinder(4,8,8);
//    }
//}
////sphere(.25);
////
//minkowski()
//{
//    drawLedgeRing();
//    sphere(1);
//}
//
////drawLedgeRing();