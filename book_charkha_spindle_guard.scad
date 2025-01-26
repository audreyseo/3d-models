diameter = 25;
height = 3;


module import_book_charkha_file(name) {
    import(str("Book_Charkha_centered", "/", name));
}
function inch_to_mm(inches) = inches * 25.4;

module base() {
    cylinder(h = height * 0.5, d = 25, $fn = 100);

    translate([0, 0, height * 0.5]) cylinder(h = height * 0.5, d = diameter - 2 * 9, $fn=100);
}

//#import_book_charkha_file("Spindle_Guard.stl");

difference() {
    base();
    cylinder(h= height, d = inch_to_mm(3 / 32), $fn=100);
}

