radiant_order = "Elsecallers";


scale([.5, .5, 1]) import(str("", radiant_order, "_centered.stl"));

minkowski() {
    cylinder(h=5, r=55, $fn=100);
    sphere(1);
}
module mytext() {
    linear_extrude(height=1) {
        text("⠑⠇⠎⠑⠉⠁⠇⠇⠑⠗", size=5, halign="center", font="Apple Braille:style=Pinpoint 6 Dot");
    }
}

z_rot = -45;
radius = 48;

#translate([cos(z_rot - 90) * radius, sin(z_rot - 90) * radius, 5.4]) rotate([0, 0, z_rot]) mytext();