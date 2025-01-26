//linear_extrude(height=8) {
//    import("/Users/audrey/Downloads/Lightweavers_glyph.svg", 0, 0);
//}
include <braille_helpers.scad>;

#translate([0, -2, 0]) scale([.5, .5, 1]) import("/Users/audrey/Personal/3d_models/stormlight_glyphs/Lightweavers_centered.stl");


make_coin_disc();
//translate([0, 0, 0]) minkowski() {
//    cylinder(h=5, r=55, $fn=100);
//    sphere(1);
//}

make_braille("⠇⠊⠛⠓⠞", center_angle=-90-45, angle_delta=14.9, more_rotation=-45);
make_braille("⠺⠑⠁⠧⠑⠗", center_angle=-45, more_rotation=45);
//make_braille("⠺⠑⠁⠧⠑⠗", center_angle=-90-45, more_rotation=-45);


//module mytext() {
//    linear_extrude(height=1) {
//        text("⠇⠊⠛⠓⠞⠺⠑⠁⠧⠑⠗", size=5, halign="center", font="Apple Braille:style=Pinpoint 6 Dot");
//    }
//}
//
//z_rot = -45;
//radius = 48;
//
//#translate([cos(z_rot - 90) * radius, sin(z_rot - 90) * radius, 5.4]) rotate([0, 0, z_rot]) mytext();