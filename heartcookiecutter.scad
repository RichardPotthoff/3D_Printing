module template()union(){translate([2,0,0])scale(10){translate([1,1,0])circle(sqrt(2),$fn=120);polygon([[0,2],[2,0],[0,-2],[0,2]]);}}
module template2()difference(){union(){template();mirror()template();square([4,40],center=true);translate([0,-20+2,0])circle(2*sqrt(2),$fn=40);}translate([0,20+2,0])circle(2*sqrt(2),$fn=40);}
linear_extrude(height=15)scale(1.5)template2();
