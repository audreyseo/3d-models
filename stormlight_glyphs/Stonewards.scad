include <strings.scad>

radiant_order = "Stonewards";

//linear_extrude(height=8) {
//    import(str("/Users/audrey/Downloads/", radiant_order, "_glyph.svg"), 0, 0);
//}

difference() {
    scale([.5, .5, 1]) import(str("/Users/audrey/Personal/3d_models/stormlight_glyphs/", radiant_order, "_centered.stl"));
    translate([50, -50, -1]) cube([100, 100, 30]);
}

minkowski() {
    cylinder(h=5, r=55, $fn=100);
    sphere(1,$fn=40);
}

braille="⠎⠞⠕⠝⠑⠺⠁⠗⠙";

module mytext() {
    linear_extrude(height=1) {
        text(braille, size=10, halign="center", font="Apple Braille:style=Pinpoint 6 Dot");
    }
}

z_rot = 0;
radius = 57;

//braille_list = [for (i = [0:1:len(braille) - 1]) braille[i]];
n = len(braille);
for (i = [0:1:n-1]) {
    rot = z_rot + (i - ((n-1) * 0.5)) * 12;
    #translate([cos(rot - 90) * radius, sin(rot - 90) * radius, 5.4]) rotate([0, 0, rot])
        linear_extrude(height=2) {
            text(braille[i], size=12, halign="center", font="Braille CC0");
        }
       // sphere(0.2);
    //}
}
    
//echo(braille_list);

//#translate([0, -50, 5.4])  mytext();