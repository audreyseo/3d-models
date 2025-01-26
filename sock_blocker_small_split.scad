module sock() {
    import("/Users/audrey/Personal/3d_models/SockBlockerSmall/files/sockblocker_small.stl");
}
h = 4.76;
l1 = 85;
l2 = 28.5;
d = 95;
d1 = 4;
module other() {
    difference() {
        union() {
            
            translate([0, 0, -0.25]) cube([220, l1, h + 0.5]);
            translate([0, l1, -0.5]) cube([220, l2, h * 0.33 + 0.5]);
            translate([0, l1 + l2, -0.5]) cube([220, l2, h * 0.66 + 0.5]);
            translate([17, l1 + l2 + l2, -0.5]) cube([4, 4, h * 0.66 + 0.5]);
        }
        translate([d, l1 + l2 + l2 - d1, -0.5]) cube([4, d1, h * 0.66 + 0.5]);
    }
}

//translate([17, l1 + l2 + l2, -0.5]) cube([4, 4, h * 0.66 + 0.5]);
//#translate([d, l1 + l2 + l2 - d1, -0.5]) cube([4, d1, h * 0.66 + 0.5]);

//sock();
//
//other();
//
//translate([d, l1 + l2 + l2 - 50, -0.5]) cube([50, d1, h * 0.66 + 0.5]);

difference() {
    sock();
    other();
}

//intersection() {
//    sock();
//    other();
//}