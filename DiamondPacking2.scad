module V(r,l){
hull(){cylinder(r=r,$fn=16);
translate([0,l,l])cylinder(r=r,$fn=16);};
hull(){cylinder(r=r,$fn=16);
translate([0,-l,l])cylinder(r=r,$fn=16);};
}

module V_Layer(r,l,nx,ny)
for(i=[0:nx])for(j=[0:ny])translate([(i-nx/2)*l*2,(j-ny/2)*l*2,0])V(r=r,l=l);

module V_Layers(r,l,nx,ny,nz)
for(k=[0:nz])
{
translate([((k+1)%2)*l,((k+0)%2)*l,k*2*l])V_Layer(r=r,l=l,nx=nx,ny=ny);
translate([((k+1)%2)*l,((k+1)%2)*l,(k*2+1)*l])rotate(a=90)V_Layer(r=r,l=l,nx=nx,ny=ny);
}
$intersection(){cylinder(r=30,h=100);
translate([0,0,-2])union(){
intersection()
{cylinder(r=25,h=50,$fn=120);V_Layers(2,5,5,5,3);}
difference(){
cylinder(r=26,h=45,$fn=120);
translate([0,0,-0.5])cylinder(r=24.9,h=51,$fn=120);
}}}
intersection(){cylinder(r=30,h=100);
translate([-7.5,0-2.5,-2])union(){
V_Layers(2,5,5,5,4);
translate([5,5,0])V_Layers(2,5,5,5,4);}}