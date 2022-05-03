include <constants.scad>
use <common.scad>

tripod_three = 3;
tripod_thick = 2;
tripod_radius = 35;
tripod_height = 90;

tripod_footer_width = 10;
tripod_footer_height = 80;
tripod_footer_max_angle = 45;
tripod_footer_max_angle_height = 45;

module pole(rotate=0)
{
    w = tripod_footer_width;
    t = tripod_thick;
    h = tripod_footer_height;

    translate([tripod_radius-w/2, 0, 0])
    rotate([0,-rotate,0])
    translate([
        0,
        0,
        0,//(w/2-1.5+$gap_large)/sin(tripod_footer_max_angle)
    ])
    union()
    {
        difference(){//切出两端斜面
            translate([0,0,-h])
            difference(){//中空
                intersection(){//切出外圆的轮廓线
                    //主结构
                    translate([-w/2, -w/2, 0])
                    cube(size=[w, w, h+15]);
                    //切出外圆的轮廓线
                    translate([-tripod_radius+w/2,0,0])
                    cylinder(r=tripod_radius, h=h+15);
                }
                //中空
                translate([-w/2+t, -w/2+t, -$eps])
                cube(size=[w-t*2, w-t*2, h+50]);
            }
            //切出顶端斜面
            rotate([0, -(90-tripod_footer_max_angle), 0])
            translate([-50,-50,1.5])
            cube(size=[100,100,100]);

            //切出底端斜面
            translate([0,0,-h+w/2])
            rotate([0, tripod_footer_max_angle, 0])
            translate([-50,-50,-100])
            cube(size=[100,100,100]);
        }

        //顶端滑槽钉
        rotate([90,0,0])
        cylinder(r=1.5, h=w+6, center=true);

        
    }
    
    
}

module tripod() {

    difference(){
        union(){
            ring(tripod_radius, tripod_thick, tripod_height);
            copy_rot(tripod_three)
            intersection(){
                union(){
                    
                    translate([
                        tripod_radius-12.5, 
                        -(tripod_footer_width + 2 * $gap_large+10)/2, 
                        0
                    ])
                    //滑槽基材
                    cube(size=[
                        100, 
                        tripod_footer_width + 2 * $gap_large+10, 
                        tripod_height
                    ]);
                }
                cylinder(r=tripod_radius, h=tripod_height);
            }
            
        }

        //脚储槽
        copy_rot(tripod_three)
        translate([tripod_radius-tripod_footer_width-$gap_large, -tripod_footer_width/2-$gap_large, -$eps])
        cube(size=[tripod_footer_width+2*$gap_large, tripod_footer_width+2*$gap_large, tripod_height+$eps2]);


        //脚上方滑槽
        copy_rot(tripod_three)
        color([0.5,1,0.5])
        translate([
            tripod_radius-5-3/2-$gap_loose, 
            -(tripod_footer_width + 2 * $gap_large+6)/2, 
            tripod_footer_max_angle_height-20
        ])
        cube(size=[
            3+$gap_loose*2, 
            tripod_footer_width + 2 * $gap_large+6,
            tripod_height-tripod_footer_max_angle_height+20+$eps
        ]);

        //脚斜滑槽
        copy_rot(tripod_three)
        copy_z(3, -10)
        color([0.5,1,0.5])
        translate([
            tripod_radius-5, 
            0, 
            tripod_footer_max_angle_height
        ])
        rotate([0,-tripod_footer_max_angle,0])
        translate([
            -3/2-$gap_loose, 
            -(tripod_footer_width + 2 * $gap_large+6)/2, 
            0
        ])
        cube(size=[
            3+$gap_loose*2, 
            tripod_footer_width + 2 * $gap_large+6,
            20
        ]);

        //滑槽底部转角
        copy_rot(tripod_three)
        color([0.5,1,0.5])
        translate([
            tripod_radius-5, 
            0, 
            tripod_footer_max_angle_height-20
        ])
        rotate([90,0,0])
        translate([0,0,-(tripod_footer_width + 2 * $gap_large+6)/2])
        cylinder(r=1.5+$gap_loose, h=tripod_footer_width + 2 * $gap_large+6);
    }

    //滑槽内壁
    copy_rot(tripod_three)
    translate([
        tripod_radius-tripod_footer_width-$gap_large-tripod_thick, 
        -(tripod_footer_width + 2 * $gap_large+6)/2, 
        0
    ])
    cube(size=[
        2,
        tripod_footer_width + 2 * $gap_large+6, 
        tripod_height
    ]);

    copy_rot(tripod_three)
    color([0.5,0.5,1])
    translate([0,0,tripod_footer_max_angle_height])
    // translate([0,0,tripod_footer_height])
    // pole(0);
    pole(tripod_footer_max_angle);
// translate([30,0,0])
// pole(r=5, h=10, t=1);

}

difference() {
    tripod();
    if ($preview)
    color([0.2,0.2,0.2])
    translate([-500, -100, -500])
    cube([1000, 100, 1000]);
}

