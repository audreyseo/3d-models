//#import("Solid_Egg_Centered.stl", center=true);

// First style
h = 4;
h1 = 10 - h;
//translate([0, 0, -h]) cylinder(h=h, r1=2, r2 = 3.7, $fn=200);
//translate([0, 0, -h - h1]) cylinder(h=h1, r1 = 5, r2 = 2, $fn=200);


difference() {
   cylinder(h=10, r1=10, r2=5, $fn=3);
   cylinder(h=10, r1=8, r2=3, $fn=3);
}

// second style
//h = 4;
//h1 = 10 - h;
h2 = 5;
//translate([0, 0, -h2]) cylinder(h=h2, r1=8, r2 = 3.7, $fn=200);
//translate([0, 0, -h - h1]) cylinder(h=h1, r1 = 5, r2 = 2, $fn=200);