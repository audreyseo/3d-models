//x^2 + x^2 = 15
//2x^2 = 15

s1 = 17;


rounding = 3;
cube_size = 12 - 2 * rounding;
half_size = cube_size * 0.5;

s2 = 12 - (rounding * 1.4);

height = 4;

//translate([0, 0, height]) translate([0, 0, rounding]) #minkowski() {
//    rotate([0, 0, 45]) translate([-half_size, -half_size, 0]) cube(cube_size);
//    sphere(rounding, $fn=100);
//}
//larger_cube_size = 14;
//larger_half_size = larger_cube_size * 0.5;
//translate([0, 0, 5]) rotate([0, 0, 45]) translate([-larger_half_size, -larger_half_size, 0]) cube(larger_cube_size);

cylinder(h=height, r1=sqrt(s1 * s1 + s1 * s1) / 2,  r2=sqrt(2 * s2 * s2) / 2, $fn=4);