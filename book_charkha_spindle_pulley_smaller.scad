module import_book_charkha_file(name) {
    import(str("Book_Charkha_centered", "/", name));
}
function inch_to_mm(inches) = inches * 25.4;

//import_book_charkha_file("Spindle_Pulley.stl");

height = 6;
outer_radius = 5;

module basic_shape() {
    cylinder(h = height * 0.5, r1 = outer_radius, r2=0.5 * outer_radius, $fn=100);
//translate([0, 0, height * 0.5]) cylinder(h = height * 0.5, r1 = 0.5 * outer_radius, r2=outer_radius, $fn=100);
}


module improved_shape() {
    diff = 0.5;
    cylinder(h=diff, r=outer_radius, $fn=100);
    translate([0, 0, diff]) 
        basic_shape();
  
//    translate([0, 0, diff + height]) cylinder(h=diff, r = outer_radius, $fn=100);
}

module half_shape_with_hole() {
    difference() {
    improved_shape();
    cylinder(h=height + 2, d=inch_to_mm(3/32), $fn=100);
}
}


half_shape_with_hole();
