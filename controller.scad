w_back = 70;
h_back = 45;
w_controller = 20;
thickness_bottom = 2;

thickness_walls = 2;
h_walls = 4;
gap_backlight = 1.5;

//controller();
//walls();
debug_controller

module debug_controller() {
  difference() {
    kit_controller();
    translate([-w_controller/2, 0, h_walls/2])
      cube([w_controller, h_back+2*thickness_walls+gap_backlight+1, 2*h_walls], center=true);
  }
}

module kit_controller(){
    controller();
    translate([0, 0, h_walls/2])
    walls();
}
module walls(){
    difference(){
        cube([w_controller+2*thickness_walls, h_back+2*thickness_walls, thickness_bottom+h_walls], center=true);
        color("red")
        cube([w_controller+gap_backlight, h_back+gap_backlight, thickness_bottom+h_walls+1], center=true);
    }
}

module controller(){
    cube([w_controller, h_back, thickness_bottom], center=true);
}
