a=[[-1.5,-0.5,0.5],[-0.5,-0.5,0.5],[0.5,-0.5,0.5],[1.5,-0.5,0.5],
[-1.5,0.5,0.5],[-0.5,0.5,0.5],[0.5,0.5,0.5],[1.5,0.5,0.5],
[-0.5,-0.5,-0.5],[0.5,-0.5,-0.5],
[-0.5,0.5,-0.5],[0.5,0.5,-0.5]];

module octaeder(size)scale(size)hull()for(i=[0,180])rotate([i,0,0])cylinder(r1=1,r2=0,h=1,$fn=4);

module burr_(x,eps=0,chamfer=0,length=6)
difference(){
cube([length,2,2]-(2*chamfer*[1,1,1]),center=true);
for(i=x)translate(a[i])cube(1+eps+2*chamfer,center=true);
};

module burr(x,eps=0,chamfer=0,length=6)
if(chamfer==0) burr_(x,eps,length=length);
else
minkowski(){octaeder(chamfer);burr_(x,eps,chamfer,length);}

module burrset(b,eps=0,chamfer=0,length=6)
for(i=[0:(len(b)-1)]){
translate([0,(-len(b)/2+i+0.5)*2.2,1.0]) burr(b[i],eps=eps,chamfer=chamfer,length=length);}

b=[
[0,1,2,3,4,6,7,8,9],
[0,1,2,3,4,5,7,8,9],
[1,2,5,8,9],
[0,1,2,4,8,9],
[2,3,6,7],
[1,2,3,6,7,8,9],
[1,2,5,6,8,9]
];
dubois=[
[0,1,2,3,4,5,6,7],
[0,1,2,3,4,5,6,7,8],
[0,1,2,4,5,6],
[0,1,2,3,5,6,8,9],
[0,1,2,3,4,5,7,8,9],
[0,1,2,3,4,7]
];
//scale(13.4/2) burrset(b,eps=0.008,chamfer=0.07,length=6);
scale(13.4/2) burrset(dubois,eps=0.008,chamfer=0.07,length=6);
