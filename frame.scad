use <akkum_18650.scad>
use <contorller.scad>

echo("Работа Ивановой Арины!");

thickness_frame = 4;
thickness_walls = 2;
thickness_bottom = 2;
thickness_top = 2;
width_frame_window = 3;

w_controller = 20;

w_back = 70;
h_back = 45;

thickness_back = 1;
h_walls = 4;
d_wires = 1.2;

d_akkum = 18;
h_akkum = 65;

gap_backlight = 1.5;

kit_frame();
translate([w_back/2+w_controller/2+2*thickness_walls, 0, 0])
kit_controller();
//frame_debug();
//translate([0, 0, thickness_bottom/2+thickness_top/2])
//window_frame();
walls();

module window_frame(){
    difference(){
        color("green")
        cube([w_back, h_back, thickness_top], center = true);
        color("red")
        cube([w_back-width_frame_window*2, h_back-width_frame_window*2, thickness_top+1], center = true);
    }
}

module frame_debug(){
    difference(){
    kit_frame();
    translate([w_back/2, 0, h_walls-thickness_bottom])
    cube([w_back, h_back+2*thickness_walls+2, h_walls*2], center = true);
    }
}

module kit_frame(){
    bottom();
    translate([0,0,h_walls/2+thickness_bottom/2])
    walls();
    wires();
    translate([0, 0, thickness_bottom/2+thickness_top/2])
    window_frame();
}

module wires() {
    translate([w_back/2, -h_back/2+6, h_walls/2+0.5])
    rotate([0, 90, 0])
    color("red")
    cylinder(d=d_wires, h=25, center=true, $fn=25);
    
    translate([w_back/2, -h_back/2+2, h_walls/2+0.5])
    rotate([0, 90, 0])
    color("black")
    cylinder(d=d_wires, h=25, center=true, $fn=25);
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
    cube([w_back+2*thickness_walls+gap_backlight, h_back+2*thickness_walls+gap_backlight, thickness_bottom], center = true);
}
