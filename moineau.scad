module screw(d,e,h){translate(v=[e/2,0,0])linear_extrude(height=h,twist=720,slices=100,convexity=3)translate(v=[e/2,0,0])circle(d/2,$fn=120);
}
module case(d,e,h){linear_extrude(height=h,twist=360,slices=100,convexity=3
)hull(){translate(v=[e,0,0])circle(d/2,$fn=120);translate(v=[-e,0,0])circle(d/2,$fn=120);}}
//difference(){translate([0,0,0.05])case(20,7,39.9);screw(20.2,7,40);}
//translate(v=[40,0,0])screw(20,7,40);
//translate(v=[-40,0,0])case(20,7,40);
//translate(v=[0,40,0])difference(){translate([0,0,0.05])case(22,7,39.9);case(20,7,40);}
//difference(){translate(v=[-3.5/2,0,0])screw(10,3.5,20);cylinder(r=1.25,h=41,center=true,$fn=36);}
translate(v=[0,40,0])difference(){case(14,3.5,20);case(10,3.5,20);}
