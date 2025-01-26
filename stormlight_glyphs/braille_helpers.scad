module make_braille(braille, angle_delta=12,more_rotation=0,center_angle=-90,font_size=12,radius=57) {
    z_rot = 0;
//    radius = ;

    //braille_list = [for (i = [0:1:len(braille) - 1]) braille[i]];
    n = len(braille);
    for (i = [0:1:n-1]) {
        rot = z_rot + (i - ((n-1) * 0.5)) * angle_delta;
        #translate([cos(rot + center_angle) * radius, sin(rot + center_angle) * radius, 5.4]) rotate([0, 0, rot + more_rotation])
            linear_extrude(height=2) {
                text(braille[i], size=12, halign="center", font="Braille CC0");
            }
           // sphere(0.2);
        //}
    }
}

module make_coin_disc(height=5, radius=55, rounding=1, disc_fidelity=100, sphere_fidelity=40) {
    minkowski() {
        cylinder(h=height, r=radius, $fn=disc_fidelity);
        sphere(rounding,$fn=sphere_fidelity);
    }
}