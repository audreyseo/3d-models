holder_length = 70;
holder_diameter = 8;

wa_height = 60;
wa_depth = 3;
wa_width = 30;

// Mostly just a prototype for now...

translate([-0.5 * wa_width, 0, 0]) difference() {
cube([wa_width, wa_depth, wa_height]);
translate([wa_width * 0.1, 0, wa_height * 0.25]) cube([wa_width * 0.8, wa_depth, wa_height * 0.7]);
}

difference() {
    translate([0, 3, 5]) rotate([60, 0, 0])
    minkowski() {
        cylinder(h=holder_length, r1=holder_diameter * 0.5, r2=holder_diameter*0.2, $fn=100);
        sphere(1, $fn=50);
    }
translate([-0.5 * wa_width, wa_depth, 0]) cube([wa_width, 2* wa_depth, wa_height]);
}