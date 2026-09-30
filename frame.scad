use <akkum_18650.scad>

echo("Работа Арины Ивановой!");

thickness_frame = 4;
thickness_walls = 2;
thickness_bottom = 2;

w_back = 70;
h_back = 45;
thickness_back = 1;
h_walls = 4;

d_akkum = 18;
h_akkum = 65;

gap_backlight = 1.5;

d_wires = 2;

frame_debug();

module frame_debug(){
    kit_frame();
}

module kit_frame(){
    bottom();
    walls();
}

module wires() {
    translate([w_back/2, -h_back/2 + 6, h_walls/2 + 0.5])
        rotate([0, 90, 0])
        color("red")
        cylinder(d=d_wires, h=25, center=true, $fn=25);

    translate([w_back/2, -h_back/2 + 2, h_walls/2 + 0.5])
        rotate([0, 90, 0])
        color("black")
        cylinder(d=d_wires, h=25, center=true, $fn=25);
}

module walls(){
    total_w = w_back + 2*thickness_walls + gap_backlight;
    total_h = h_back + 2*thickness_walls + gap_backlight;

   
    color("red")
    translate([0, total_h/2 - thickness_walls/2, h_walls/2 + thickness_bottom/2])
        cube([total_w, thickness_walls, h_walls], center=true);

    color("green")
    translate([0, -total_h/2 + thickness_walls/2, h_walls/2 + thickness_bottom/2])
        cube([total_w, thickness_walls, h_walls], center=true);

    color("red")
    translate([total_w/2 - thickness_walls/2, 0, h_walls/2 + thickness_bottom/2])
        cube([thickness_walls, total_h, h_walls], center=true);

    color("green")
    translate([-total_w/2 + thickness_walls/2, 0, h_walls/2 + thickness_bottom/2])
        cube([thickness_walls, total_h, h_walls], center=true);
}

module backlight(){
    color("lightgreen")
    cube([w_back, h_back, thickness_back], center=true);
}

module bottom(){
    color("yellow")
    cube([w_back + 2*thickness_walls + gap_backlight,
          h_back + 2*thickness_walls + gap_backlight,
          thickness_bottom], center=true);
}