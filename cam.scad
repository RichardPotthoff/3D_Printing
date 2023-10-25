module bar(pivot,length,width,angle)
  translate(pivot)rotate(angle){*square([length,width],center=false); translate([
      length,0,0])circle(width);};


module cam(pivot=-40,length=25,angle=45,dangle=22.5)
difference()
{{circle(45);color("black")translate([20,0,0])cylinder(1);};
 for (a1 =  [0:5:360])
   {a2=angle+dangle*fcam(1*a1);
    rotate(a1)
    bar([pivot
       ,0,0],length,7,a2);};
   };
  
color("red") cylinder(1);

function fcam_(x,e=(1-1/0.5))=
   (x<1)
     ? (x*((1-e)*(0.875+x^2*(0.375*x^2 -1.25)) + 1))
     : 1+(x-1)*e;
   
function fcam(phase,duty_cycle=0.5)=
  fcam_((((phase+360)/180/(1-duty_cycle)+2)%(2/(1-duty_cycle))-1),1-1/duty_cycle);
 pivot=-30;
 length=25;
 angle=100
   ;
 dangle=22.5;
   
color("blue")translate([pivot,0,0])cylinder(1);
  
echo(fcam(-5));
a1=$t*360;
a2=angle+dangle*fcam(-1*a1);
    bar([pivot,0,0],length,7,a2);  
rotate(a1)cam(pivot=pivot,length=length,angle=angle,dangle=dangle);
