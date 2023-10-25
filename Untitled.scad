module wheel(di=30,do=50,h=0.2,n){
cylinder(r=di/2,h=h);
for (i=[1:n])rotate(i/n*360)intersection(){
   cylinder(r=do/2,h=h);
    translate([-1.5*do,0,-0.25*h])cube([3*do,1.5*do,2*h]);   rotate(180+1/(2*n)*360)translate([-1.5*do,0,-0.25*h])cube([3*do,1.5*do,2*h]);}//intersection
}//module
rotate(10
)color("black")wheel(n=10);
translate([0,0,0.4])color("blue")wheel(do=45,n=9);