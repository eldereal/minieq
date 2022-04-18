include <constants.scad>
use <common.scad>
use <cycloidalGear.scad>
use <sla.scad>
use <stepper.scad>

n_inner_lobes = 10;
lobe_diff = 1;
thickness = 4;
r_gen = 2;
r_offset = 3;
r_pins = 5;
r_holes = r_pins + lobe_diff*r_gen;
n_holes = 4;
r_hole_center = 10;
r_rotor_shaft = 25/2;
r_rotor_shaft_inner = 20/2;
r_bolts = 2;
driven_shaft_od = 50;
r_drive_shaft = 4;
square_side = 10;
alpha =  2*360*$t;


// ===== 3.stl =====
// translate([lobe_diff*r_gen*cos(alpha), lobe_diff* r_gen*sin(alpha), 4])
// rotate([0,0,-lobe_diff*alpha/n_inner_lobes])
// color([0.5, 0.3, 0.5])
// inside_rotor(n_inner_lobes-1, 
// 				r_gen,
// 				r_offset-0.3,
// 				r_holes,
// 				n_holes,
// 				r_hole_center,
// 				r_rotor_shaft,
// 				5+$eps);

// SLA_Shrink_Bottom()
// translate([lobe_diff*r_gen*cos(alpha), lobe_diff* r_gen*sin(alpha), 0])
// rotate([0,0,-lobe_diff*alpha/n_inner_lobes])
// color([0.5, 0.5, 0.3])
// inside_rotor(
//     n_inner_lobes, 
//     r_gen,
//     r_offset-0.3,
//     r_holes,
//     n_holes,
//     r_hole_center,
//     r_rotor_shaft,
//     4
// );


// color([1, 0, 1])
// translate([0, 0, 10])
// rotate([180, 0, 0])
// // ===== 2.stl =====
// SLA_Shrink_Bottom()
// translate([0, 0, 5.9])
// rotate([180, 0, 0])
// {
//     outside_rotor(
//         n_inner_lobes + lobe_diff - 1, 
//         r_gen,
//         r_offset,
//         r_bolts,
//         driven_shaft_od,
//         5.9,
//         2
//     );
//     ring(26, 25, 0.9);

//     translate([0,0,4.9]) {
//         ring(4.6, 2.6, 1);

//         for (i = [0:n_inner_lobes] ) {
//             rotate([0, 0, 360/n_inner_lobes*(i+0.5)])
//             translate([3.6, -1, 0])
//             cube(size=[23-3.6, 2, 1]);
//         }
//     }
// }


// ===== 4.stl =====
module axis() {
    translate([0,0,0])
    difference() {
        union(){

            translate([lobe_diff*r_gen, 0, 5])
		    cylinder(r=10, h=8);

            translate([0,0,5])
            cylinder(r=8, h=15);

            translate([0,0,4])
            cylinder(r=12.5, h=1);

            translate([0,0,0])
            cylinder(r=10, h=4);
        }
        // translate([0,0,-0+$eps])
        // cylinder(r=5.1, h=4+$eps2, $fn=4);
        translate([0,0,-50])
        cylinder_outer(r=6, h=100);
    }
}

// ===== 5.stl =====
// SLA_Shrink_Bottom() {
//     cylinder(r=5,h=1.9,$fn=4);
//     cylinder(r=2.5, h=12);
// }



// color([0.3,0.3,0.3])
// translate([0,0,5])
// ring(65/2, 50/2, 7+$eps);


module static_box() {
    color([0.5,0.75,1])
    translate([0,0,0]) {
        // ring(65/2+2,65/2+$gap_tight, 12);

        // outside_rotor(
        //     n_inner_lobes + lobe_diff, 
        //     r_gen,
        //     r_offset,
        //     r_bolts,
        //     driven_shaft_od,
        //     4,
        //     2
        // );

        // for (i = [0:n_inner_lobes+1] ) {
        //     rotate([0, 0, 360/(n_inner_lobes+1)*i]) {
        //         translate([27-1,-1,0])
        //         cube(size=[65/2+1-27+1, 2, 4]);

        //         translate([27+1,-1,0])
        //         cube(size=[65/2-27, 2, 5]);
        //     }
        // }

        // color([128/255, 128/255, 255/255])
        ring(65/2+2, 25/2, 1);

        ring(25/2+2, 25/2, 4);
    }
}

SLA_Shrink_Bottom()
static_box();

axis();

// stepper();