$fa=1; $fs=0.4;

module Hook() {
  translate([-3, -23, 12])
  rotate([0, 90, 0])
  linear_extrude(6)
  offset(2) difference() { circle(10); translate([0, 0.1]) circle(10); }
}

linear_extrude(4) offset(5) hull() {
  translate([-50, 0]) rotate(360/16) circle(20, $fn=8);
  translate([50, 0]) rotate(360/16) circle(20, $fn=8);
}

for (x=[-50:25:50]) translate([x, 0, 0]) Hook();
