module hirth_tool(n,r){
rotate(a=asin(sqrt(3)*tan(90/n)),v=[0,1,0])translate([-0.1*r,0,0])rotate(a=90,v=[0,1,0])translate([-r*1,0,0])linear_extrude(height=r*1.2)circle(r=r,$fn=3);
}

module hirth(n,r) {
for (i=[1:n])rotate(360/n*i)hirth_tool(n,r);
}

difference(){
cylinder(r=6,h=20,$fn=60); 
translate([0,0,-0.01]){
translate([0,0,6.99])cylinder(r1=4,r2=0,h=4,$fn=60);
cylinder(r=4,h=7,$fn=60);
intersection(){
union(){cylinder(r=5.5/sqrt(3),h=14,$fn=6);cylinder(r=5.7/2,h=14,$fn=20);}
cylinder(r1=14,r2=0,h=14,$fn=20);
}

}

cylinder(r=3.2/2,h=20,$fn=20);

translate([0,0,15]) { 
difference(){hirth(10,10);translate([0,0,-5])cylinder(r=3.5,h=10,$fn=60);}
translate([0,0,-0.1])cylinder(r1=3.7,r2=3.7+5,h=10,$fn=60);
cylinder(r1=0,r2=10,h=2.,$fn=60);}
}
%translate([0,0,15])hirth_tool(10,10);