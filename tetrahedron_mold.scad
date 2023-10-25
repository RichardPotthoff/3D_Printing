module m1()rotate([0,45,0])linear_extrude(100) translate([0,-2*sqrt(0),0])polygon(points=[[0,0],[10*sqrt(2),-10],[-10*sqrt(2),-10]],path=[1,2,3]);
difference(){cube(20,center=true); m1(); rotate(180) m1();
mirror([1,1,0]){m1();rotate(180)m1();}};
