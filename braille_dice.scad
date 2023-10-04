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