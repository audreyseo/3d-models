delta = 5;


cylinder_top = 37 - delta;
translate([0, 0, -delta]) {
    #difference() {
        translate([0, 0, delta]) cylinder(cylinder_top, 30, 30);

//module polar_cube() {
//    for 
//}


//# 144 * 2 = 12^2 + 12^2 = x^2
//# x^2 + x^2 = y^2
//# 144 * 4 = y^2

cube_size = 12.5;
    sy = sqrt(cube_size * cube_size) * 2;

hcs = cube_size * 0.5;

ry = atan(1 / sqrt(2));
//echo(ry);
//ry = 35.26;
        #translate([0, 0, delta + cylinder_top - hcs]) scale(1.1) translate([-hcs, -hcs, -hcs]) cube(cube_size);
//translate([0, 0, 1.5 * sy]) rotate([0, 0, 0]) rotate([0, ry, 0]) rotate([45, 0, 0]) scale(1.1)  translate([-7, -7, -7]) cube(14);
    }
}


//translate([0, 0, -delta]) #translate([0, 0, 30]) scale(1.1) translate([-7, -7, -7]) cube(14);