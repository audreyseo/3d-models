
// Print bed size: 250mm x, 210mm y
//cube([250, 210, 1]);

//module import_book_charkha_file(name) {
//    import(str("Book_Charkha_centered", "/", name));
//}

function inch_to_mm(inches) = inches * 25.4;

// Teeny dimensions
x = inch_to_mm(3);
y = inch_to_mm((7 / 8.2) * 3);

//x = inch_to_mm(8.2);
//y = inch_to_mm(7);
thickness = 3;
height = inch_to_mm(1) + thickness;

hinge_true_length = y / 8;

hinge_length = hinge_true_length - 1;
//total_hinge_length = 2 * hinge_length;
hinge_radius = (inch_to_mm(3/32) + thickness) / 2;
hinge_inner_radius = inch_to_mm(3/32) / 2;


hinge_y1 = y - (5 * hinge_true_length);

hinge_half_length = hinge_length / 2;

hinge_height_diff = 0.25;

latcher_attacher_points = [
    [cos(225) * hinge_radius,    -hinge_half_length, sin(225) * hinge_radius],                 // 0
    [cos(225) * hinge_radius,    hinge_half_length,  sin(225) * hinge_radius],                 // 1
    [cos(-45) * hinge_radius, -hinge_half_length, sin(-45) * hinge_radius],
    [cos(-45) * hinge_radius, hinge_half_length, sin(-45) * hinge_radius],
    [hinge_radius, hinge_half_length, -hinge_height_diff], // 2 -> 4
    [hinge_radius, -hinge_half_length, -hinge_height_diff], // 3 -> 5
    [hinge_radius + 1, hinge_half_length,  -hinge_height_diff],                 // 4 -> 6
    [hinge_radius + 1, -hinge_half_length, -hinge_height_diff],                 // 5 -> 7
    [hinge_radius + 1, -hinge_half_length, -2 * hinge_radius - 1], // 6 -> 8
    [hinge_radius + 1, hinge_half_length, -2 * hinge_radius - 1]   // 7 -> 9
];

latcher_attacher_faces = [
    [0, 1, 3, 2],
    [2, 3, 4, 5],
    [5, 4, 6, 7],
    [7, 6, 9, 8],
    [1, 0, 8, 9],
    [0, 2, 5, 7, 8],
    [1, 9, 6, 4, 3]
];


module latcher(){
//        union() {
    difference() {
        rotate([90, 0, 0]) cylinder(h=hinge_length, r=hinge_radius, center=true, $fn=32);
        rotate([90, 0, 0]) cylinder(h=hinge_length, r=hinge_inner_radius, center=true, $fn=32);
    }
    
                
//            difference() {
    polyhedron(points=latcher_attacher_points, faces=latcher_attacher_faces);
//                rotate([90, 0, 0]) cylinder(h=hinge_length, r=hinge_inner_radius, center=true, $fn=32);
//            }
//        }
        

}


lip_thickness = 0.5 * thickness;
lip_height = 0.66 * lip_thickness;
module lip(thickness_scale=1.0) {
    lt = lip_thickness * thickness_scale;
    lh = lip_height * thickness_scale;
    inset = thickness - lt;
    translate([inset, inset, height - lh]) cube([x - 2 * lt, lt, 2 * lh]);
    translate([inset, inset, height - lh]) cube([lt, y - 2 * lt, 2 * lh]);
    translate([x - thickness, inset, height - lh]) cube([lt, y - 2 * lt, 2 * lh]);
    translate([inset, y - thickness, height - lh]) cube([x - 2 * lt, lt, 2 * lh]);
}

module box_half(){
    cube([x, y, thickness]);
    

    // long side 1
    cube([x, thickness, height]);
    // long side 2
    translate([0, y - thickness, 0]) cube([x, thickness, height]);

    // short side 1
    cube([thickness, y, height]);
    // short side 2
    translate([x - thickness, 0, 0]) cube([thickness, y, height]);
}

latch_height = height + hinge_height_diff;

module box_bottom() {
    translate([hinge_radius + 1, 0, 0]) {
//        difference() {
            box_half();
            lip();
//        }
    }
    translate([0, hinge_y1 - 2 * hinge_true_length, latch_height]) latcher();
    translate([0, hinge_y1, latch_height]) latcher();
    translate([0, hinge_y1 + 2 * hinge_true_length, latch_height]) latcher();
    translate([0, hinge_y1 + 4 * hinge_true_length, latch_height]) latcher();
}

module box_top() {
    translate([hinge_radius + 1, 0, 0]) {
        difference() {
            box_half();
            lip(thickness_scale=1.1);
        }
//        lip();
    }
    translate([0, hinge_y1 - hinge_true_length, latch_height]) latcher();
    translate([0, hinge_y1 + 1 * hinge_true_length, latch_height]) latcher();
    translate([0, hinge_y1 + 3 * hinge_true_length, latch_height]) latcher();
}

module open_box_top() {
    translate([-x * 0.5, y * 0.5, height * 0.5]) rotate([0, 0, 180]) translate([-x * 0.5, -y * 0.5, -height * 0.5]) box_top();
}

module bearing_block() {
    import_book_charkha_file("Bearing_Block_3mm_hole.stl");
}

module large_pulley() {
    bearing_block();
    translate([0, 0, 18.4]) import_book_charkha_file("Large_Pulley_2_with_3.5mm_hole.stl");
}

module small_pulley() {
    bearing_block();
    translate([0, 0, 24 +  18.4]) rotate([180, 0, 0]) import_book_charkha_file("Small_pulley_2_3.5mm_hole.stl");
}

module spindle_holder_bottom() {
    import_book_charkha_file("Spindle_Holder_Bottom_Mark_IV.stl");
}

module spindle_holder_top() {
    import_book_charkha_file("Spindle_Holder_mark_v_3.stl");
}

//bearing_block();

// Spinning components
#translate([142, 109, 0]) large_pulley();
#translate([51, 49, 0]) small_pulley();
#translate([-120, 120, 0]) spindle_holder_bottom();
translate([-120, 147.5, 6.9]) translate([0, 0, 47.19 * 0.5]) rotate([0, 270, 90]) spindle_holder_top();
    
//
//latcher();
//import("hinged_box_hinge.stl");
//union() {
//            rotate([90, 0, 0]) cylinder(h=hinge_length, r=hinge_radius, center=true, $fn=32);
//            polyhedron(points=latcher_attacher_points, faces=latcher_attacher_faces);
//        }

//polyhedron(points=latcher_attacher_points, faces=latcher_attacher_faces, convexity=4);




//polygon(points=[[0, -hinge_half_length], [0, hinge_half_length], [hinge_radius + 1, hinge_half_length], [hinge_radius + 1, -hinge_half_length]]);
//polyhedron(faces=[[0, -hinge_half_length, 0], [0, hinge_half_length, 0], [hinge_radius + 1, hinge_half_length, 0], [hinge_radius + 1, -hinge_half_length, 0]]);

//intersection() {
//    box_bottom();
//    translate([-3, 0, height * 0.7]) cube([10, 50, height * 0.5]);
//}

module openableBoxTop(open_angle=0) {
    translate([0, 0, height]) rotate([0, -open_angle, 0]) translate([x * 0.5, y * 0.5, height * 0.5]) rotate([180, 0, 0]) translate([-x * 0.5, -y * 0.5, -height * 0.5]) box_top();
}

translate([0, 0, -thickness]) #openableBoxTop(open_angle=70);


//#translate([x * 0.5, y * 0.5, height * 1.5]) rotate([180, 0, 0]) translate([-x * 0.5, -y * 0.5, -height * 0.5]) box_top();

//#translate([0, 0, 2 * height]) rotate([0, 0, 180]) translate([0, 0, -height]) box_top();

translate([0, 0, -thickness]) 
box_bottom();

translate([0, 0, -thickness]) 
open_box_top();

//translate([-x * 0.5, y * 0.5, height * 0.5]) rotate([0, 0, 180]) translate([-x * 0.5, -y * 0.5, -height * 0.5]) box_top();




//translate([hinge_radius + 1, 0, 0]) box_half();
////
////
//////hinge
//translate([0, hinge_y1, height]) latcher();
//translate([0, hinge_y1 + 2 * hinge_length, height]) latcher();
