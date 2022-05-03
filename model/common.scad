include <constants.scad>

module copy_rot(n) {
    for(i = [0: n-1])
    rotate([0, 0, 360/n*i])
    children();
}

module copy_z(n, d) {
    for(i = [0: n-1])
    translate([0, 0, d*i])
    children();
}

module cylinder_outer(r, h)
{
   fudge = 1/cos(180/$fn);
   cylinder(h=h,r=r*fudge);
}

module ring(r, t, h) 
{
    difference() {
        cylinder(r=r,h=h);
        translate([0,0,-$eps])
        cylinder_outer(r=r-t,h=h+$eps2);
    }
}

module radial(r, n, h, t) {
    // theta = asin(t/2/r);
    // l = cos(theta) * r;

    for(i = [0 : n - 1]) {
        rotate([0,0,360/n*i])
        translate([0,-t/2, 0])
        cube(size=[r, 1, h]);
    }

    // cylinder(r=1/2, h=10);
}