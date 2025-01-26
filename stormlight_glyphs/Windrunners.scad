include <braille_helpers.scad>;

//linear_extrude(height=20) {
//    import("/Users/audrey/Downloads/Windrunners_glyph.svg", 0, 0);
//}


shrink = 0.99;
#translate([0, 4, 0]) scale([1, shrink * 0.9, 1]) scale([.5, .5, 0.4]) import("/Users/audrey/Personal/3d_models/stormlight_glyphs/PI3MK3M_Windrunners.stl");

make_coin_disc();

make_braille("⠺⠊⠝⠙⠗⠥⠝⠝⠑⠗");

//minkowski() {    cylinder(h=5, r=55, $fn=100);     sphere(1); }

//module mytext() {
//    linear_extrude(height=1) {
//        text("⠺⠊⠝⠙⠗⠥⠝⠝⠑⠗", size=4, halign="center", font="Apple Braille:style=Pinpoint 6 Dot");
//    }
//}
//
//z_rot = -24;
//radius = 51;
//
//#translate([cos(z_rot - 90) * radius, sin(z_rot - 90) * radius, 5.4]) rotate([0, 0, z_rot]) mytext();

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