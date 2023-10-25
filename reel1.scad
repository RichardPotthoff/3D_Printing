module reel(diameter,height,hole_diameter,flat,threaddepth,threadpitch,threadlength){
union(){
difference(){
union(){
translate(v=[0,0,-height/2])
cylinder(r=diameter/2,h=height-threadlength,$fn=60);
translate(v=[0,0,height/2-threadlength*1.01])
//cylinder(r=(diameter-threaddepth)/2,h=threadlength*1.01,$fn=60);
linear_extrude(height = threadlength*1.01, convexity = 10, twist = -360*threadlength*1.01/threadpitch,$fn=60)
translate([threaddepth/2, 0, 0])
circle(r = (diameter-threaddepth)/2);
}
cylinder(r=hole_diameter/2,h=height*2,center=true,$fn=30);
}
translate(v=[hole_diameter/2,0,0]){
cube(size=[flat*2,hole_diameter,height],center=true);
}
}
}
module setscrew(diameter,length,hexsize,hexlength){
union(){
cylinder(r=diameter/2,h=length,$fn=30);
cylinder(r=hexsize/sqrt(0.75)/2,h=hexlength,$fn=6);
}
}
difference(){
difference(){
reel(diameter=20,height=30,hole_diameter=5,flat=0.5,threaddepth=0.5,threadlength=20,threadpitch=1.25);
translate(v=[-15,0,-10]){
rotate(a=90,v=[0,1,0])rotate(a=90,v=[0,0,1,0]){
setscrew(diameter=3,length=30,hexsize=5.5,hexlength=15+5/2+2.5);}
}
}
translate(v=[10,0,5])
rotate(a=50,v=[1,0,0])
rotate_extrude(convexity = 10, $fn = 60)
translate([15, 0, 0])
circle(r = 1.5, $fn = 16);
}