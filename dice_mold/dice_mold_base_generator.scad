module triangle_centered_at_incenter(s=13.76, h=0) {
    b = s / sqrt(2);
    points = [for (i = [90, 90 + 120, 90-120]) [cos(i) * b, sin(i) * b]];
    polygon(points);
}



module polygon_centered_at_incenter(s=13.76, n=3, h=5, slope=30) {
    incenter_angle = 360 / n;
    end = n - 1;
    angles = [for (i = [0:end]) (90 + incenter_angle * i)];
    angles_sum = 180 + (n - 3) * 180;
    vertex_angle = angles_sum / n;
    r = 0.5 * s / cos(vertex_angle / 2);
    points = [for (i = angles) [cos(i) * r, sin(i) * r]];
    bigger_r = r + (cos(slope) * (h / sin(slope)));
    bigger_points = [for (i = angles) [cos(i) * bigger_r, sin(i) * bigger_r]];
        
//    polygon(points);
    
//    polygon(bigger_points);
    
    points3d = [for (i = [0:end]) [points[i][0], points[i][1], h]];
    bigger_points3d = [for (i = [0:end]) [bigger_points[i][0], bigger_points[i][1], 0]];
    
    all_points = concat(points3d, bigger_points3d);
//    points = concat(points, [points[0]]);
//    bigger_points = concat(bigger_points, [bigger_points[0]]);
    
    num_points = len(points3d);
    faces = concat([for (i=[0:end]) [i, (i + 1) % n, num_points + (i + 1) % n, num_points + i]], [[for (i = [0:end]) num_points - 1 - i]], [[for (i = [0:end]) num_points + i ]]);
//    echo(points3d);
//    echo(bigger_points3d);
//    echo(all_points);
//    echo(faces);
        
    polyhedron(points=all_points, faces=faces);
}

module generate_d10(bottom_diff=3.8, diameter=17.37, height=29.03) {
    radius = 0.5 * diameter;
    center_angle = 36;
    angles1 = [for (i = [0:4]) (90 + center_angle * i * 2)];
    angles2 = [for (i = angles1) (i + center_angle)];
//    points = [for (i = [0
    points1 = [for (i = angles1) [cos(i) * radius, sin(i) * radius]];
    points2 = [for (i = angles2) [cos(i) * radius, sin(i) * radius]];
    
//    polygon(points1);
//    #polygon(points2);
    
    diff = bottom_diff * 0.5;
    points1_3d = [for (p = points1) [p[0], p[1], diff]];
    points2_3d = [for (p = points2) [p[0], p[1], -diff]];
    
    h2 = height * 0.5;
    top_point = [0, 0, h2];
    bottom_point = [0, 0, -h2];
    all_points = concat(points1_3d, points2_3d, [top_point], [bottom_point]);
    lall = len(all_points);
    t = lall - 2;
    b = lall - 1;
    
    plen = len(points1_3d);
    faces1 = [for (i = [0:plen - 1]) [t, i, plen + i, (i + 1) % plen]];
    faces2 = [for (i = [0:plen-1]) [b, plen + (i + 1) % plen, (i + 1) % plen, plen + i]];
    echo(faces1[2]);
    echo(all_points);
    
    polyhedron(points=all_points, faces=[for (i = [2:2]) faces1[i]]);
//    polyhedron(points=all_points, faces=concat(faces1, faces2));
}

function polar_x(r=5, theta=0) = cos(theta) * r;
function polar_y(r=5, theta=0) = sin(theta) * r;
function oval_x(r1, a, theta) = cos(theta) * (r1 + a * abs(cos(theta)));
function oval_y(r1, a, theta) = sin(theta) * (r1 + a * abs(cos(theta)));
module d10_base(s1=16, s2=6.5, l=18.4, h=5, slope=35) {
    p = (s1 + s2 + l) / 2;
    s3 = 2 * sqrt(p * (p - s1) * (p - s2) * (p - l)) / l;
    h1 = sqrt(s1 * s1 - s3 * s3);
    h2 = sqrt(s2 * s2 - s3 * s3);
    l_half = l / 2;
    above = l_half - h1;
//    diamond = [[0, l_half], [-s3, above], [0, -l_half], [s3, above]];
    
    base_diff = (cos(slope) * (h / sin(slope)));
    
    th1 = atan2(above, s3);
    th2 = atan2(above, -s3);
    small_r = sqrt(s3 * s3 + above * above);
    base_r = small_r + base_diff;
    top_r = l_half;
    angles = [90, th2, 270, th1];
    a_top = (small_r - top_r) / abs(cos(th1));
    base_small_r = sqrt(pow(cos(th2) * base_r, 2) + pow(sin(th2) * base_r, 2));
    a_bot = (base_small_r - (l_half + base_diff)) / abs(cos(th1));
    diamond = [for (t = angles) [oval_x(top_r, a_top, t), oval_y(top_r, a_top, t)]];
    base_points = [for (t = angles) [oval_x(base_r, a_bot, t), oval_y(base_r, a_bot, t)]];
//    polygon(points=diamond);
//    #polygon(points=diamond);
    
    
    
//    base_points = [[0, l_half + base_diff], [cos(th2) * base_r, sin(th2) * base_r], [0, -l_half - base_diff], [cos(th1) * base_r, sin(th1) * base_r]];
//    polygon(points=base_points);
//    base_points = [[0, l_half + base_diff], [-s3 - base_diff, above], [0, -l_half - base_diff], [s3 + base_diff, above]];
//    polygon(points=diamond);
    
    diamond_points3d = [for (i = diamond) [i[0], i[1], 5]];
    base_points3d = [for (i = base_points) [i[0], i[1], 0]];
    all_points = concat(diamond_points3d, base_points3d);
    
    faces = concat([for (i=[0:3]) [i, (i + 1)% 4, 4 + (i + 1)% 4, 4 + i]],
                   [[0, 3, 2, 1]],
                   [[4, 5, 6, 7]]);
    echo("Points", all_points);
    echo("Faces", faces);
    polyhedron(points=all_points, faces=faces); //[for (i=[0:3]) [i, (i + 1)% 4, 4 + (i + 1)% 4, 4 + i]]);
    
//    #polygon(points=base_points);
}


//intersection() {
//translate([0, 0, -5]) rotate([0, 0, 18]) cylinder(h=10, r1=10, r2=0, $fn=5);
//rotate([0, 0, 36 + 18]) translate([0, 0, 5]) rotate([180, 0, 0]) cylinder(h=10, r1=10, r2=0, $fn=5);
//}

////generate_d10(bottom_diff=3.8, diameter=25);

//polyhedron(points=[
//    [0, 12.5, 1.9], // 0
//    [-11.8882, 3.86271, 1.9], // 1
//    [-7.34732, -10.1127, 1.9], // 2
//    [7.34732, -10.1127, 1.9], // 3
//    [11.8882, 3.86271, 1.9], // 4
//    [-7.34732, 10.1127, -1.9], // 5
//    [-11.8882, -3.86271, -1.9], // 6
//    [0, -12.5, -1.9], // 7
//    [11.8882, -3.86271, -1.9], // 8
//    [7.34732, 10.1127, -1.9], // 9
//    [0, 0, 14.515], // 10
//    [0, 0, -14.515]], // 11
//    faces=[[10, 2, 7, 3]]);
//    

//polygon_centered_at_incenter(s=10, n=5, h=5);

// For D4
//translate([-50, 0, 0]) polygon_centered_at_incenter(s=21, n=3, h=5, slope=35);

// For D6
//translate([-30, 20, 0]) polygon_centered_at_incenter(s=13, n=4, h=5, slope=35);

// For D8
//translate([50, 0, 0]) polygon_centered_at_incenter(s=15, n=3, h=5, slope=35);

// For D10
//d10_base();
//translate([0, 0, 0]) polygon_centered_at_incenter(s=15, n=3, h=5, slope=35);

// For D12
//translate([0, -40, 0]) polygon_centered_at_incenter(s=6.5, n=5, h=5, slope=35);

// For D20
//translate([20, 20, 0]) polygon_centered_at_incenter(s=8.7, n=3, h=5, slope=35);

//#triangle_centered_at_incenter();