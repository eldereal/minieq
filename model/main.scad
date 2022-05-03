include <constants.scad>
include <BOSL2/std.scad>

use <common.scad>
use <cycloidalGear.scad>
use <sla.scad>
use <stepper.scad>
use <bearing.scad>
use <motor10.scad>
use <gear.scad>

//厚度
t = 2 - $gap_tight;
//外径
r = 65/2 + t;
//底边距离斜劈的高度
h_bottom = 10;

// ring(35/2, 20/2, 10);
// rotate([0, -45, 0])
// rotate([0, 0, 40])//旋转
// rotate([0, 45, 0])//旋转轴对齐Z轴
// translate([0,0,20+25])//中心对到原点
// rotate([0,180,0])//上下翻转
// difference(){
//     ring(r=50/2, t=25, h=50+20);

//     translate([-50/2, 0, 20])
//     rotate([0, -45, 0])
//     translate([0, -25, 0])
//     cube([50*1.5, 50*1.01, 50*1.5]);
// }

//外壳
module bottom_shell(r, t, h_bottom) {
    color([0.5, 0.5, 0.75])
    // translate([0,0,-20-25])
    difference(){
        ring(r=r, t=t, h=r*2 + h_bottom);

        translate([-r, 0, h_bottom])
        rotate([0, -45, 0])
        translate([0, -r*1.01, 0])
        cube([r*3, r*2.02, r*3]);
    }

    color([0.5, 0.5, 0.75])
    translate([0,0,-2])
    ring(r=r, t=5, h=2);
}

// bottom_shell(r = r, t = t, h_bottom = h_bottom);


color([0.5,0.75,0.5])
difference(){
    union(){
        
        difference(){
            union(){
                ring(r=10, t=5, h=7);
                
                translate([0,0,-2])
                ring(r=27, t=22, h=2);
            }
            translate([0,0,-1])
            cylinder(r=(13.5/2+$gap_tight)/cos(30), h=10, $fn=6);
        }

        ring_gear(modul=1, tooth_number=43, width=7, rim_width=2.5-$gap_tight);
    }

    #cylinder(r=0.8, h=20);
}

translate([(45-12)/2,0,0])
spur_gear(modul=1, tooth_number=10, width=8, bore=3);

//轴承
// translate([0,0,$gap_loose])
// bearing65();

//8/3螺母
translate([0, 0, -1])
color([0.5,0.5,0.5])
difference() {
    cylinder(r=13.5/2/cos(30), h=8.3, $fn=6);
    translate([0,0,-$eps])
    cylinder(r=9.5/2, h=8.3+$eps2);
}

// translate([0,0,2.5+5])
// spur_gear(pitch=2, teeth=60, thickness=5, shaft_diam=35+$gap_tight*2);

translate([(45-12)/2, 0, 10])
rotate([180, 0, 90])
motor10();