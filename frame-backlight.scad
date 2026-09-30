
len_bottom = 106;
depth_bottom = 58;
thickness_walls = 1.6;
// screen backlight panel
// height of frame without thickness bottom
height_frame = 4;
thickness_bottom = 1.4;
depth_pcb = 7; 

window_frame();

translate([0, 0, -5])
kit_frame();
// set_frame();
// frame_is_match();

module window_frame() {
  difference() {
    color("green")
    cube([len_bottom, depth_bottom, height_frame], true);
    cube([len_bottom-10, depth_bottom-4, height_frame+1], true);
    translate([len_bottom/2-1, 0, 0])
    cube([4, depth_bottom-4, height_frame+1], true);
    translate([-len_bottom/2+4, 0, 0])
    cube([4, depth_bottom-4, height_frame+1], true);
  }
}

module kit_frame() {
  difference() {
    set_frame();
    for(i=[1:6]){
      translate([len_bottom/2, -depth_bottom/2+3*i, 0.5])
      rotate([0, 90, 0])
      cylinder(d=1.8, h=5, center=true, $fn=32);
    }
    
  }  
}

module set_frame() {
  color("lime")
  translate([0, 0, -height_frame/2])
  bottom();
  frame();
  translate([len_bottom/2+depth_pcb/2+thickness_walls, 0, 0])
  set_frame_pcb();
}

module set_frame_pcb() {
  color("lime")
  translate([0, 0, -height_frame/2])
  bottom_pcb();
  frame_pcb();
}

module bottom_pcb() {
  cube([depth_pcb+2*thickness_walls, depth_bottom+2*thickness_walls, thickness_bottom], true);
}

module frame_pcb() {
  difference() {
    cube([depth_pcb+2*thickness_walls, depth_bottom+2*thickness_walls, thickness_bottom+height_frame], true);
    color("red")
    cube([depth_pcb, depth_bottom, thickness_bottom+height_frame+0.1], true);
  }
}

module bottom() {
  cube([len_bottom+2*thickness_walls, depth_bottom+2*thickness_walls, thickness_bottom], true);
}

module frame() {
  difference() {
    cube([len_bottom+2*thickness_walls, depth_bottom+2*thickness_walls, thickness_bottom+height_frame], true);
    color("red")
    cube([len_bottom, depth_bottom, thickness_bottom+height_frame+0.1], true);
  }
}

module frame_is_match() {
  difference() {
    set_frame();
    // cut is match
    translate([106/4, 0, 0])
    cube([106/2+4, 58+4, 4*2], true);
  }
  // is match wall
  translate([0, depth_bottom/2+thickness_walls/2, 0])
  cube([5, thickness_walls, thickness_bottom+height_frame], true);
  
  // is match bottom
  translate([0, depth_bottom/2-4, -height_frame/2])
  cube([5, 5, thickness_bottom], true);
}

