module ballbearing(id=8,od=16,width=5,rad=0.25,$fn=64,$fnr=16)
{
module c() circle(rad,$fn=$fnr);
rotate_extrude($fn=$fn)
difference(){hull(){
translate([id/2+rad,-width/2+rad]) c();
translate([id/2+rad,+width/2-rad]) c();
translate([od/2-rad,+width/2-rad]) c();
translate([od/2-rad,-width/2+rad]) c();
}//hull
hull(){
translate([id/2+(od-id)/8+2*rad,+width/2]) c();
translate([od/2-(od-id)/8-2*rad,+width/2]) c();
}//hull
hull(){
translate([id/2+(od-id)/8+2*rad,-width/2]) c();
translate([od/2-(od-id)/8-2*rad,-width/2]) c();
}//hull
}//difference
}//module ballbearing

ballbearing();
translate([0,0,10])ballbearing();