include <constants.scad>
include <BOSL2/std.scad>
include <BOSL2/gears.scad>

use <common.scad>
use <cycloidalGear.scad>

module motor10(opacity = 1) {
    color([1, 0.8, 0, opacity])
    ring(r=2, t=0.5, h=0.8);

    difference(){
        color([0.6, 0.6, 0.6, opacity])
        cylinder(r=1.5, h=10);

        translate([1.5-0.6,-2, -$eps])
        color([0.6, 0.6, 0.6, opacity])
        cube(size=[4, 4, 10+$eps2]);
    }
    
    
        
    difference(){
        color([1, 0.8, 0, opacity])
        translate([-6, -5, -1])
        cube(size=[12, 10, 1]);

        color([1, 0.8, 0, opacity])
        translate([4.5,0,-1-$eps])
        cylinder(r=0.8, h=1+$eps2);

        color([1, 0.8, 0, opacity])
        translate([-4.5,0,-1-$eps])
        cylinder(r=0.8, h=1+$eps2);
    }

    color([1, 0.8, 0, opacity])
    translate([-6, -5, -6])
    cube(size=[12, 10, 1]);

    color([1, 0.8, 0, opacity])
    translate([-6, -5, -9])
    cube(size=[12, 10, 1]);
    
    color([1, 0.8, 0, opacity])
    translate([4,3,-9])
    cylinder(r=1.5, h=9);

    color([1, 0.8, 0, opacity])
    translate([-4,-3,-9])
    cylinder(r=1.5, h=9);

    color([0.6, 0.6, 0.6, opacity])
    translate([0,0,-9-10.6])
    cylinder(r=5, h=10.6);
}

motor10();
