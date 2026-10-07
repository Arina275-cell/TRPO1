use <frame.scad>
use <akkum18650.scad>

d_akkum = 18;
h_akkum = 65;

gap_backlight = 1.5;
thickness_bottom = 2;

w_back = 70;
h_back = 45;

echo("Работа Арины Ивановой");
build_frame();

module build_frame() {
    translate([0, 0, h_back/2+2*gap_backlight])
    rotate([90, 0, 0])
    kit_frame();
    translate([0, d_akkum/2+thickness_bottom+d_akkum/2+3, 0])
    //rotate([0, 90, 0])
    //akkum18650();
    twoAcc();
}
