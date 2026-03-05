module d4() {
    import("/Users/audrey/Downloads/Braille_Polyhedral_Dice_-_March_2018_version_2836494/files/d4.STL", center = true);
}

module rotatedD4() {
    rotate([0, 0, 45]) d4();
}

module mycut() {
    translate([-25, 11, 0]) cube([50, 50, 50]);
}

module mycut2() {
    translate([-25, -39, 0]) cube([50, 50, 50]);
}

//translate([-25, -39, 0]) cube([50, 50, 50]);


difference() {
    rotatedD4();
    mycut2();
//    mycut();
}

//difference() {
//    rotatedD4();
//    mycut();
//}

//
//cube([2, 3, 4]);
//translate([3, 0, 0]) {
//    cube([2, 3, 4]);
//}
//
//color([1,0,0]) cube([2,3,4]);
//translate([3,0,0])
//color([0,1,0]) cube([2,3,4]);
//translate([6,0,0])
//color([0,0,1]) cube([2,3,4]);
//include<ub.scad>;
//
//Caliper(l=45, , center=false);
//Pivot([-3, 1]);