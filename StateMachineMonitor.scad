module led(d=3,c="white")scale(d/3) translate([0,0,-3])
{
color(c){translate([0,0,4])sphere(r=1.5,$fn=20);
cylinder(r=1.5,h=4,$fn=20);
cylinder(r=2,h=1,$fn=20);}
    color("silver"){
translate([-1.5,-0.25,-2])cube([0.5,.5,2.5]);
translate([1.,-0.250,-3])cube([0.5,.5,3.5]);
    }
}
module led3(d=3,c="white",l=5)
    {led(d=d,c=c);
    color("silver")
    for(angle1=[60,180,300])rotate(angle1)
    translate([0,1.75+0.8,-3.5]){translate([-0.250,-0.250,0])cube([0.5,0.5,l]);
    rotate([-90,0,90])translate([-0.750,0,0])rotate_extrude(angle=180,$fn=10)translate([0.5,-0.25,0])square(0.5);}
}
module led1()
{ rotate([54.7356,0,45])rotate(-15)translate([0,0,0.2])led3(l=2.5);
for (ang1=[0,120,240])
    rotate(a=ang1,v=[1,-1,1])
color("silver"){
rotate([0,45,0])scale([1,1.224,1])rotate([0,0,-90])rotate_extrude(angle=180,$fn=20)translate([1.9,0,0])circle(r=0.4,$fn=10);
for(ang2=[90,-90])rotate([ang2,0,0])translate([0,0,1.9*1.224]){linear_extrude(height=10)circle(r=0.4,$fn=10);
scale([1,1,1.224])sphere(r=0.4,$fn=10);}

}
}
module led2()
{ rotate([54.7356,0,45])rotate(-90)led3(l=3.3);
for (ang1=[0,120,240])
    rotate(a=ang1,v=[1,-1,1])
color("silver")
translate([-1.8,-0.9,0])cylinder(r=0.4,h=25,$fn=10,center=true);
}

//*rotate($t*360){
//$vpr=[90,0,315];
//led2();
for(i=[-1.5:1.5],j=[-1.5:1.5],k=[-1.5:1.5])
translate(6*25.4/10*([i,j,k]))led2();
//}
function coords(x,bits=[])=
  x==0?
  let(bits_0=[each bits,each[0,0,0,0,0,0,0]])
  let(bitsgray=[for( i=[0:5] )bits_0[i]==bits_0[i+1]?0:1 ])
  [for( i=[0:2]) (bitsgray[i]+0.5)*(bitsgray[i+3]==1?-1:1)]
      :
  let (x1=floor(x/2))
  coords(x1,[each bits,x-2*x1]);

translate(6*25.4/10*coords(round($t*64)))rotate([54.7356,0,45])led(3.3,"orangered");
      

*echo(round($t*64));
