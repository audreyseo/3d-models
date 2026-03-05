module d4() {
    import("/Users/audrey/Downloads/Braille_Polyhedral_Dice_-_March_2018_version_2836494/files/d8.STL", center = true);
}

module rotatedD4() {
    translate([-12, 0, 0]) d4();
//    rotate([0, 0, 45]) d4();
}

module mycut() {
    translate([-25, 16, 0]) cube([50, 50, 50]);
}

module mycut2() {
    translate([-25, -34, 0]) cube([50, 50, 50]);
}

//translate([-25, -39, 0]) cube([50, 50, 50]);
//d4();

//difference() {
//    rotatedD4();
//    mycut2();
//    mycut();
//}

rotate([0, 0, 180]) difference() {
    rotatedD4();
    mycut();
}

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