module reel(diameter,height,hole_diameter,flat,threaddepth,threadpitch,threadlength,capheight){
union(){
difference(){
union(){
translate(v=[0,0,-height/2])
cylinder(r=diameter/2,h=height-threadlength,$fn=60);
translate(v=[0,0,height/2-threadlength*1.01])
//cylinder(r=(diameter-threaddepth)/2,h=threadlength*1.01,$fn=60);
rotate(a=20,v=[0,0,1])
linear_extrude(height = threadlength*1.01, convexity = 10, twist = -360*threadlength*1.01/threadpitch,$fn=60)
hull(){
translate([threaddepth*2/2, 0, 0])
circle(r = (diameter-threaddepth*1.1*2)/2);
translate([threaddepth/2.5/2,0,0])
circle(r=(diameter-threaddepth*(2-1/2.5))/2);
}
translate(v=[0,0,height/2-0.05])
cylinder(r=diameter/2,h=capheight+0.05,$fn=60);
}
cylinder(r=hole_diameter/2,h=height*2,center=true,$fn=30);
}//difference
rotate(a=90,v=[0,0,1])
translate(v=[hole_diameter/2,0,capheight/2])
cube(size=[flat*2,hole_diameter,height+capheight],center=true);
}//union
}
module setscrew(diameter,length,hexsize,hexlength,countersink_diameter,countersink_depth){
union(){
cylinder(r=diameter/2,h=length,$fn=30);
cylinder(r=hexsize/sqrt(0.75)/2,h=hexlength,$fn=6);
translate(v=[0,0,length-countersink_depth])cylinder(r=countersink_diameter/2,h=countersink_depth,$fn=30);
}
}
module lead_in(){
intersection(){
rotate_extrude(convexity=10,fn=30)
translate([7.65, 0, 0])
circle(r = 0.5, $fn = 16);
translate(v=[0,0,-5])intersection(){
rotate(a=0,v=[0,0,1])cube(size=[10,10,10]);
rotate(a=-10,v=[0,0,1])cube(size=[10,10,10]);
}
}
}

module capstan() difference(){
reel(diameter=20,height=20,hole_diameter=5,flat=0.5,threaddepth=0.5,threadlength=10,threadpitch=1.25,capheight=3);
rotate(a=90,v=[0,0,1])translate(v=[-15,0,-5])
rotate(a=90,v=[0,1,0])rotate(a=0,v=[0,0,1])
intersection(){
translate([-10,-10,15-1.15])cube(20);
setscrew(diameter=3.1,length=30,hexsize=5.6,hexlength=15+5/2+2.1,countersink_diameter=5.9,countersink_depth=5+3.1);
}
translate([-2.8,-1.1,-10-10+5])cube([5.6,2.4,10]);
rotate(a=90,v=[0,0,1])
translate(v=[6,0,5.1])
rotate(a=32,v=[1,0,0])
rotate_extrude(convexity = 10, $fn = 60)
translate([10, 0, 0])
circle(r = 1, $fn = 16);


rotate(a=104,v=[0,0,1])
translate(v=[2.3,0,9.5])
lead_in();
rotate(a=78,v=[0,0,1])
translate(v=[2.3,0,0.6])
mirror([0,1,0])
lead_in();

translate(v=[0,0,-10-0.5])cylinder(r1=4,r2=0,h=4,$fn=30);
translate(v=[0,0,13+0.5-4])cylinder(r1=0,r2=4,h=4,$fn=30);

}
capstan();