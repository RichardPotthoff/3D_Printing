difference(){ union(){cylinder(r=5.95,h=100,$fn=60);
cylinder(r=7,h=3,$fn=60);}
cylinder(r=4.2,h=200,center=true,$fn=60);
translate([ 0,0,55])rotate(a=180,v=[0,1,0])
difference(){
union(){
rotate(a=5,v=[0,1,0])translate([0,-100,-100])cube(200);
translate([-100,-100,-200-30])cube(200);
}
translate([-100,-100,30])cube(200);
}
}
