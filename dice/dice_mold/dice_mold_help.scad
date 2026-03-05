use <dice_mold_box_braille_dice.scad>;

module side() {
    import("dice_mold_box_braille_dice_side.stl");
}

module side2() {
    import("dice_mold_box_braille_dice_side_second_try.stl");
}


function inch_to_mm(inches) = inches / 2 * 2.5 * 10;

//l = 6 / 2 * 2.5 * 10;
//w = 4 / 2 * 2.5 * 10;
//h = 2.5 / 2 * 2.5 * 10;

l = inch_to_mm(9);
w = inch_to_mm(6);
h = inch_to_mm(5.5);

import("dice_mold_box_base_1.stl");

#translate([0, -.001, 0]) import("dice_mold_box_braille_dice_side.stl");

translate([0, .1, 0]) translate([l, w, 0]) rotate([0, 0, 180]) side2();
