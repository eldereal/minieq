
include <constants.scad>

use <common.scad>


module bearing65() {
    color([0.75, 0.75, 0.75])
    ring(r=65/2, t=2, h=7);

    color([0.25, 0.25, 0.25])
    ring(r=65/2-2, t=(65/2-2)-(50/2+2.5), h=7);

    color([0.75, 0.75, 0.75])
    ring(r=50/2+2.5, t=2.5, h=7);
}

bearing65();
