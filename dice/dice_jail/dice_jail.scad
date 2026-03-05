include <dice_mold_base_generator.scad>;



function posmod(n, m) = ((n % m) + m) % m;

function mod_between(a, b, m, x) =
    ((a <= b) ? a <= x : ((a > x) ? a - m <= x : a <= x)) && ((a <= b) ? x < b : ((a <= x) ? x < b + m : x < b));

function polar_point_slope_r(b, m, theta) = -b / (m * cos(theta) - sin(theta));

function generate_indices(angles_around, angles,indices=[], fuel=10, i=0, n=0) = 
    (i == len(angles_around)) ? 
        indices : 
        (   
            (mod_between(angles[n], angles[posmod(n+1, len(angles))], 360, angles_around[i])) ?
//            (angles_around[i] < angles[posmod(n+1, len(angles))] && angles_around[i] >= angles[n]) ? 
                generate_indices(angles_around, angles, indices=concat(indices, [[i, n, angles_around[i], angles[n], angles[posmod(n+1, len(angles))]]]), i=i + 1,  n=n) : 
//                ((angles_around[i] >= angles[n] || angles_around[i] < angles[posmod(n-1, len(angles))]) ? 
//                    generate_indices(angles_around, angles, indices, i, posmod(n + 1, len(angles))) : 
                    generate_indices(angles_around, angles, indices=concat(indices, [[i, posmod(n + 1, len(angles)), angles_around[i], angles[posmod(n+1, len(angles))], angles[posmod(n+2, len(angles))], "b"]]), i=i + 1, n=posmod(n + 1, len(angles)))
//                )
        );


module generate_points_around_regular_polygon(n=3, s=10, r=9, h=5, delta_theta=15, theta0=90) {
    // Idea: create partial linear functions around the shape
    // for n sided shape, with vertices at angles theta1, theta2, theta3, ..., thetan, linear functions will be
    // 1. (cos(theta2) - cos(theta1)) 
    incenter_angle = 360 / n;
    end = n - 1;
    angles = [for (i = [0:end]) posmod((theta0 + incenter_angle * i), 360)];
    angles_sum = 180 + (n - 3) * 180;
    vertex_angle = angles_sum / n;
    outer_r = 0.5 * r / cos(vertex_angle / 2);
    points = [for (i = angles) [cos(i) * outer_r, sin(i) * outer_r]];
    inner_ys = [for (i = angles) (sin(i) * r)];
    line_points = [for (i = [0:len(points)-1]) [points[i], points[(i + 1)%len(points)]]];
        
    slopes = [for (p = line_points) if (p[1][0] - p[0][0] == 0) (0/0) else (p[1][1] - p[0][1]) / (p[1][0] - p[0][0])];
    intercepts = [for (i = [0:len(line_points)-1]) (line_points[i][0][1] - (slopes[i] * line_points[i][0][0]))];
    
    num_points_around = 360 / delta_theta;
    angles_around = [for (i=[0:num_points_around-1]) ((theta0 + i * delta_theta) % 360)];
    echo(angles_around, angles);
    
    indices_around = generate_indices(angles_around, angles, i=0, n=0);
    echo(indices_around);
    slope_intercept_index = 0;
//    for (i = [1:end]) {
//        echo(angles[i], angles[posmod(i+1, len(angles))], theta0, slope_intercept_index);
//        if (angles[i-1] < theta0 && theta0 <= angles[posmod(i+1, len(angles))]) {
//            slope_intercept_index = i;
//            echo("changed", slope_intercept_index);
//        }
//    }
    
    for (j=[0:num_points_around-1]) {
//        if (angles_around[j] > angles[posmod(slope_intercept_index + 1, len(angles))]) {
//            echo("changed");
//            echo(len(angles));
//            echo(posmod(slope_intercept_index + 1, len(angles)));
//            slope_intercept_index = posmod(slope_intercept_index + 1, len(angles));
//        }
        i = indices_around[j];
        
        r_point_slope = (slopes[i[1]] != slopes[i[1]] && (angles_around[j] != 90 && angles_around[j] != 270)) ? line_points[i[1]][1][0] * (1 / cos(angles_around[j])) : polar_point_slope_r(intercepts[i[1]], slopes[i[1]], angles_around[j]);
        echo(slopes[i[1]] != slopes[i[1]], line_points[i[1]][1][0], r_point_slope, slope_intercept_index, angles_around[j], slopes[i[1]], i[1], angles[posmod(i[1]+1, len(angles))]);
//        translate([r * cos(angles_around[j]), r * sin(angles_around[j])]) children();
        
        translate([r_point_slope * cos(angles_around[j]), r_point_slope * sin(angles_around[j])]) children();
    }
    
//    bigger_r = r + (cos(slope) * (h / sin(slope)));
//    bigger_points = [for (i = angles) [cos(i) * bigger_r, sin(i) * bigger_r]];
        
//    polygon(points);
    
//    polygon(bigger_points);
    
//    points3d = [for (i = [0:end]) [points[i][0], points[i][1], h]];
//    bigger_points3d = [for (i = [0:end]) [bigger_points[i][0], bigger_points[i][1], 0]];
//    
//    all_points = concat(points3d, bigger_points3d);
//    points = concat(points, [points[0]]);
//    bigger_points = concat(bigger_points, [bigger_points[0]]);
    
//    num_points = len(points3d);
//    faces = concat([for (i=[0:end]) [i, (i + 1) % n, num_points + (i + 1) % n, num_points + i]], [[for (i = [0:end]) num_points - 1 - i]], [[for (i = [0:end]) num_points + i ]]);
}


base_height=12;
bar_height = 50;
base_size = 50;

slice_height=3;
slices = 5;
size=0.96 * base_size;

module dice_jail_bar() {
    cylinder(bar_height, 3, 3, $fn=30);
}

module dice_jail_bars_setup() {
    translate([0, 0, 0.5 * base_height]) generate_points_around_regular_polygon(n=6, r=base_size-10, delta_theta=20, s=base_size) {
        children();
    }
}

module dice_jail_base() {
    difference() {
        difference() {
            union() {
        //        translate([0, 0, 20]) rotate([180, 0, 0]) polygon_centered_at_incenter(s=90, n=6, h=10, slope=60);
        //        translate([0, 0, 10]) polygon_centered_at_incenter(s=90, n=6, h=10, slope=-60);
                polygon_centered_at_incenter(s=base_size, n=6, h=base_height, slope=90);
        //        translate([0, 0, -10]) polygon_centered_at_incenter(s=90, n=6, h=10, slope=60);
            }
        //    union() {
        //        translate([0, 0, 20]) rotate([180, 0, 0]) polygon_centered_at_incenter(s=90, n=6, h=10, slope=60);
        ////        translate([0, 0, 10]) polygon_centered_at_incenter(s=90, n=6, h=10, slope=-60);
        //        polygon_centered_at_incenter(s=90, n=6, h=10, slope=90);
        //        translate([0, 0, -10]) polygon_centered_at_incenter(s=90, n=6, h=10, slope=60);
        //    }
            rad = base_size * 1;
            translate([0, 0, rad + 2]) sphere(rad, $fn=120);
        }

        num_bars=10;


        dice_jail_bars_setup() {
            scale([1.05, 1.05, 1.05]) dice_jail_bar();
        }
    //    translate([0, 0, 0.5 * base_height]) generate_points_around_regular_polygon(n=6, r=base_size-10, delta_theta=20, s=base_size) {
    //        scale([1.05, 1.05, 1.05]) dice_jail_bar();
    //    }
    }
}

module dice_jail_top() {
    difference() {
        translate([0, 0, 0.5 * base_height + bar_height + slice_height]) difference() {
            union() {
                translate([0, 0, slice_height*2]) polygon_centered_at_incenter(s=size+2, n=6, h=slice_height, slope=90);
                translate([0, 0, slice_height*2]) rotate([180, 0, 0]) polygon_centered_at_incenter(s=size, n=6, h=slice_height, slope=60);
        //        translate([0, 0, 10]) polygon_centered_at_incenter(s=0.9 * base_size, n=6, h=10, slope=-60);
                polygon_centered_at_incenter(s=size, n=6, h=slice_height, slope=90);
                translate([0, 0, -slice_height]) polygon_centered_at_incenter(s=size, n=6, h=slice_height, slope=60);
                translate([0, 0, -slice_height * 2]) polygon_centered_at_incenter(s=size+2, n=6, h=slice_height, slope=90);
            }
            translate([0, 0, -slice_height * 2]) polygon_centered_at_incenter(s=0.7 * size, n=6, h=slice_height * slices, slope=90);
        }

        dice_jail_bars_setup() {
            scale([1.05, 1.05, 1.05]) dice_jail_bar();
        }
//translate([0, 0, 0.5 * base_height]) generate_points_around_regular_polygon(n=6, r=base_size-10, delta_theta=20, s=base_size) {
//        scale([1.05, 1.05, 1.05]) cylinder(bar_height, 3, 3, $fn=30);
//    }
    }
}

dice_jail_base();

//dice_jail_bar();

//dice_jail_bars_setup() {
//    dice_jail_bar();
//}

//dice_jail_top();

//translate([0, 0, 0.5 * base_height]) generate_points_around_regular_polygon(n=6, r=base_size-10, delta_theta=20, s=base_size) {
//        cylinder(bar_height, 3, 3, $fn=30);
//    }

//cylinder(bar_height, 3, 3, $fn=30);
