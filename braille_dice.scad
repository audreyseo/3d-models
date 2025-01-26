module d4() {
    import("/Users/audrey/Downloads/Braille_Polyhedral_Dice_-_March_2018_version_2836494/files/d4.STL", center = true);
}

module d6() {
    import("/Users/audrey/Downloads/Braille_Polyhedral_Dice_-_March_2018_version_2836494/files/d6C.STL", center = true);
}

module d8() {
    d8width = 32.77;
    d8height = 23.53;

    translate([-d8height * 0.5, d8width * -0.5, d8height * -0.5]) import("/Users/audrey/Downloads/Braille_Polyhedral_Dice_-_March_2018_version_2836494/files/d8.STL", center = true);
}

module d10() {
    d10x = 27.99;
    d10y = 29.15;
    d10z = 28.1;
    translate([d10x * -0.5, d10y * -0.5, d10z * -0.5]) import("/Users/audrey/Downloads/Braille_Polyhedral_Dice_-_March_2018_version_2836494/files/d10.STL", center = true);
}

module d12() {
    import("/Users/audrey/Downloads/Braille_Polyhedral_Dice_-_March_2018_version_2836494/files/d12.STL", center = true);
}

module d20() {
    import("/Users/audrey/Downloads/Braille_Polyhedral_Dice_-_March_2018_version_2836494/files/d20_corrected.STL", center = true);
}

module centeredCube(x=10, y=10, z=10) {
    translate([x * -0.5, y * -0.5, z * -0.5]) cube([x, y, z]);
}

module centered(x=10, y=10, z=10) {
    translate([x * -0.5, y * -0.5, z * -0.5]) children();
}

include <dotSCAD/Polyhedra/dodecahedron.SCAD>

module centeredD20() {
    size = 37.8;
    d20w = size;
    d20l = size;
    d20h = size;
    translate([2.9, 0, -0.2]) rotate([32, 32, 18]) 
    centered(x=d20w, y=d20l, z=d20h) d20();
}

module centeredD4() {
    d4w = 15;
    d4h = 34.9;

    rotate([90, 0, 0]) centered(x=d4w, y=d4w, z=d4h) d4();
}

module centeredD6() {
    w = 22.9;
    l = w;
    h = w;

    centered(x=w, y=l, z=h) d6();
}

module centeredD12() {
        w = 30.57;
    l = w;
    h = w;

    translate([.2, 3.05, 0.96]) centered(x=w, y=l, z=h) d12();
}


modelPlace = "/Users/audrey/Personal/3d_models/braille_dice_flat/";

module importFlat(myname){
    import(str(modelPlace, myname, ".stl"), center=true);
}

module flatD4() {
    importFlat("d4");
}

module flatD6() {
    intersection() {
        importFlat("d6");
        translate([-13, -13, 0]) cube(26);
    }
}

module flatD8() {
    importFlat("d8");
}

module flatD10() {
    importFlat("d10");
}

module flatD12() {
    importFlat("d12");
}

module flatD20() {
    importFlat("d20");
}

//flatD4();
//    flatD6();
//flatD8();
//flatD10();
//flatD12();
//flatD20();
    

//rotate([0, -58, 18]) icosahedron(radius=d20w * 0.5);
//
//w = 30.57;
//l = w;
//h = w;
//
//rotate([0, 0, -58]) dodecahedron(radius=w * 0.5);
//
////translate([0.05, 0.05, 0.05]) centeredCube(x=w, y=l, z=h);
//
//translate([.2, 3.05, 0.96]) centered(x=w, y=l, z=h) d12();

//intersection() {
//    rotate([0, -58, 0]) icosahedron(radius=15);
//    
//}



