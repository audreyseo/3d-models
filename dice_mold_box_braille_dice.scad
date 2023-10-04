include <braille_dice.scad>

//rotate([9, 4.5, 0]) translate([-40, -40, 10]) d20();

module braille_dice() {
    rotate([10.5, 0.3, 0]) translate([4, 4, 5]) d20();

    translate([63, 0, 25]) rotate([-90, 0, 45]) d4();

    d6_width = 22.99;

    translate([9, 44, 12]) d6();

    translate([56, 57, 21]) rotate([35, 0, 0]) d8();

    d12w = 40;
    d12l = 40;
    d12h = 40;

    translate([77, 32, 11]) rotate([90, 0, 0]) d12();

    translate([90, 57, 21]) rotate([42.5, 0, 0]) rotate([0, 20, 0]) d10();
}

//d10x = 27.99;
//d10y = 29.15;
//d10z = 28.1;
//translate([d10x * -0.5, d10y * -0.5, d10z * -0.5]) d10();
//centeredCube(x=d10x, y=d10y, z=d10z) cube([d10x, d10y, d10z]);


braille_dice();

//d8width = 32.77;
//d8height = 23.53;
//
//translate([-d8height * 0.5, d8width * -0.5, d8height * -0.5]) d8();
//translate([-d8height * 0.5, d8width * -0.5, d8height * -0.5]) cube([d8height, d8width, d8height]);

//translate([d6_width * -0.5, d6_width * -0.5, d6_width * -0.5]) d6();
//cube(d6_width * 0.5);
//rotate([90, 180, 0]) cube(d6_width * 0.5);

function inch_to_mm(inches) = inches / 2 * 2.5 * 10;

//l = 6 / 2 * 2.5 * 10;
//w = 4 / 2 * 2.5 * 10;
//h = 2.5 / 2 * 2.5 * 10;

l = inch_to_mm(9);
w = inch_to_mm(6);
h = inch_to_mm(5.5);

echo(l);
echo(w);

thickness = 5; // 8mm = .8cm



echo(h);

module disc() {
    minkowski() {
        cylinder(h = thickness, r = w / 6);
        sphere(3);
    }
}
echo(w / 3);

module base_top_basic() {
    translate([thickness * -0.5, thickness * -0.5, 0.5 * thickness]) cube([l + thickness, w + thickness, 0.5 * thickness]);
}

module base_top() {
    difference() {
    base_top_basic();
    union() {
        translate([0, -1, 0]) rotate([60, 0, 0]) scale([1.1, 1, 1]) base_top_basic();
        translate([-1, 0, 0]) rotate([0, -60, 0]) scale([1, 1.1, 1]) base_top_basic();
        translate([l, 0, 2]) rotate([0, 60, 0]) scale([1, 1.1, 1]) base_top_basic();
        translate([0, w, 2]) rotate([-60, 0, 0]) scale([1.1, 1, 1]) base_top_basic();
    }
    }
}

module base() {
    union() {
        cube([l, w, thickness]);
        base_top();
        proportions = [0.175, 0.5, 0.825];
        w_proportion = 0.25;
        for (i=proportions){
            portion = i; // * 0.25;
            translate([l * portion, w * w_proportion, 3]) disc();
            translate([l * portion, w * (1 - w_proportion), 3]) disc();
        }
        for (i=[0, 1]) {
            x_coord = proportions[i] + 0.5 * (proportions[i + 1] - proportions[i]);
            translate([l * x_coord, w - thickness, thickness]) cube(thickness);
            translate([l * x_coord, 0, thickness]) cube(thickness);
        }
    }
}

//base();

module side() {
    difference() {
        union() {
            // long side
            translate([-thickness, -thickness, 0]) cube([l + 2 * thickness, thickness, h]);
            // short side
            translate([-thickness, -thickness, 0]) cube([thickness, w * 0.5 + thickness, h]);
            // far short side
            translate([l, -thickness, 0]) cube([thickness, w * 0.5 + thickness, h]);
            // the bits that stick out to clamp onto
            // this controls the length
            sealer_x = 3 * thickness;
            translate([-sealer_x, w * 0.5 - thickness * 0.5, 0]) cube([sealer_x, thickness * 0.5, h]);
            translate([l, w * 0.5 - thickness * 0.5, 0]) cube([sealer_x, thickness * 0.5, h]);
            // this is the bit of the puzzle piece that sticks out
            translate([-thickness * 0.7, w * 0.5, 0]) cube([thickness * 0.7, thickness * 0.5, h]);
        }
        union() {
            // inset place for the base to go
            base_top();
            // this is the bit of the puzzle piece that is fit into
            scale([1, 1, 1.1]) translate([l - thickness * 0.1, w * 0.5 - thickness * 0.5, -1]) cube([thickness * 0.8, thickness * 0.6, h]);
        }
    }
}





side();
translate([l, w + 1, 0]) rotate([0, 0, 180]) side();

//translate([l * 0.25, w * 0.33, 0]) disc();

