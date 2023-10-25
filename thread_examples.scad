module thread(od=7.9,id=6.35,pitch=1.25,length=25,tol=0,$fn=36)
linear_extrude(height=length,twist=-360*length/pitch)translate([(od-id)/4,0,0])circle(d=(od+id)/2+tol,$fn=$fn);

module thread_2start(od=7.9,id=6.35,pitch=1.25,length=25,tol=0,$fn=36)
linear_extrude(height=length,twist=-180*length/pitch)scale([(id+tol)/(od+tol),1,1])circle(d=od+tol,$fn=$fn);

module thread_trapezoid(od=7.9,id=6.35,pitch=1.25,length=25,tol=0,$fn=36)
linear_extrude(height=length,twist=-360*length/pitch)
  intersection(){
      circle(d=od+tol,$fn=$fn);
      union(){
          translate([2*(od-id)/4,0,0])circle(d=(od+id)/2+tol,$fn=$fn);
          circle(d=id+tol,$fn=$fn);
         }
      }
      

translate([-15,0,0])thread_trapezoid();
thread();
translate([15,0,0])thread_2start();
