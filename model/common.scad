include <constants.scad>

module cylinder_outer(r, h)
{
   fudge = 1/cos(180/$fn);
   cylinder(h=h,r=r*fudge);
}

module ring(r1, r2, h) 
{
    difference() {
        cylinder(r=r1,h=h);
        translate([0,0,-$eps])
        cylinder_outer(r=r2,h=h+$eps2);
    }
}