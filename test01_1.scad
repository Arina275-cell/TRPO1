use <akkum18650.scad>

echo("Работа Арины Ивановой");


d_akkum = 18;
h_akkium = 65;


thickness_frame = 4;
thickness_walls = 2;
thickness_bottom = 2;

w_back = 70;
h_back = 45;
thickness_back = 1;
h_walls = 4;
gap_backlight = 1.5;

//rotate([90, 0, 0])
//translate([0,0,4])
//backlight();
//kit_frame();
//akkum18650();
build_frame();

module build_frame(){
    translate([0, 0, h_back/2+2*gap_backlight])
    rotate([90, 0, 0])
    kit_frame();
    translate([0, 0, d_akkum/2+thickness_back, d_akkum/2])
    rotate([0,90,0])
    akkum18650();
    }

module kit_frame(){
    bottom();
    translate([0,0,h_walls/2+thickness_bottom/2])
    walls();
}
module walls(){
    difference(){
        cube([w_back+2*thickness_walls+gap_backlight, h_back+2*thickness_walls+gap_backlight, h_walls], center = true);
        color("red")
        cube([w_back+gap_backlight, h_back+gap_backlight, h_walls+1], center = true);
    }
}
module backlight(){
    color("lightgreen")
    cube([w_back, h_back, thickness_back], center = true);
}



module bottom(){
    cube([w_back+2*thickness_walls+gap_backlight, h_back+2*thickness_walls, thickness_bottom], center = true);
}
