$fn=100;

module stepper(){
translate([0, 7, 0]) {
    //机体
    color("silver")
    translate([0, 0, -19])
    cylinder(r=12, h=19);
    
    //电线盒
    color("silver")
    translate([-9, 0, -16])
    cube(size=[18, 16.5, 16]);
    
    //电线
    color("silver", 0.25)
    translate([0, 16, -2])
    rotate([-90, 0, 0]){
        for (i=[-2:2]) {
            translate([i, 0, 0]) cylinder(r=0.5, h=10);
        }
    }

    //输出轴
    color("gold")
    translate([0, -7, 0])
    union(){
        cylinder(r=4, h=1, center=false);
        intersection(){
            cylinder(r=2.5, h=10);
            translate([0, 0, 5])
            cube(size=[5, 3, 10], center=true);
        }
        cylinder(r=2.5, h=4);
    }

    //法兰
    color("silver")
    translate([0, 0, -1])
    difference(){
        union(){
            translate([15.5, 0, 0])
            cylinder(r=3, h=1);
            translate([-15.5, 0, 0])
            cylinder(r=3, h=1);
            translate([-15.5, -3, 0])
            cube(size=[31, 6, 1]);
        }
        translate([15.5, 0, -0.5])
        cylinder(r=2, h=2);
        translate([-15.5, 0, -0.5])
        cylinder(r=2, h=2);
    }
}
}


stepper();

module connector(){
translate([0,0,0])
    difference(){
        cylinder(r=4, h=10);
        
        translate([0,0,5.1])
        intersection(){
            translate([0, 0, -0.1])
            cylinder(r=2.5, h=5.1);
            translate([-2.5, -1.5, -0.1])
            cube(size=[5, 3, 5.1]);
        }

        intersection(){
            translate([0, 0, -0.1])
            cylinder(r=1.5, h=5.2);
            translate([-1.5, -1, -0.1])
            cube(size=[3, 2.5, 5.2]);
        }

    }
    
}

// translate([0, 0, 22])
// rotate([0, 180, 0])
// connector();