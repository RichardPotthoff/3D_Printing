module tube_square(r,w,fill=false)
scale([sqrt(2),sqrt(2),1])intersection(){
union(){
rotate([0,90,0])cylinder(r1=r+w,r2=0,h=w+r,$fn=60);
rotate([0,-90,0])cylinder(r1=r+w,r2=0,h=w+r,$fn=60);}
union(){rotate_extrude($fn=4,convexity=4)translate([w,0,0])circle(r=r,$fn=60);
if (fill) rotate(45)cube([sqrt(2)*w,sqrt(2)*w,2*r],center=true);}}

color("white")tube_square(10,1,fill=true);
color("black")tube_square(10,22);
color("white")tube_square(10,43);
color("blue")tube_square(10,64
);