//designed by james villeneuve

//threading design for bolt - 'for the good of mankind'. 
// this is to know that you are printing above zero.
zerocal= 3.5 ; // this ofsets baseof object allows skienforge use without editing further
leftcal= 20 ;// this is left offset
zerocalnut= 6.5; //this is for nut cal
leftcalnut= -10; //this is for nut cal
threadoffsetnut= 25 ;// this is how far down to place nut threading so it goes thru nut
 %cube( size=[100,50, 0.1],center=true);
//standard names and variables, what a hardware store employee would understand to universally size a bolt
printCal= 0.95; //printersize calibration for thickness
size=25.4 ; //size scale 1 is  mm/ 25.4 is inches (openscad in mm)
enablethread=1; // comment this line out if you want to thread by machine.
ShankBoltLenght=1.5; //this is entire lenght of bolt, from point meets head to the other end
ShankThreadLength= 1 ; //this is how far you want the threading to go down shank
DiameterBolt= 0.9; //use calipers to size bolt around shaft size
HeadDiamter=1; // this is head tool contact diameter
ThreadPitch=8 ;//count how many threads per inch or mm.
HeadShape=6 ; //shapes 6=hex,4=square,16=round
scalethreads=1.7 ;//this is used to correct threading issues 
//notimplimented yet... sorry
CarriageBoltType= 0;// if bolt is rounded on end and is a carriage bolt type set to 1. if normal bolt set to 0


//*****************************************************************************
//variables below used to made the code work. don't change unless needed.
//*****************************************************************************
// there are a few bugs still but it basically works.
radiusboltbase = HeadDiamter * 0.5; //this is radius of bolt converted from diameter
boltbottomhieght= 0.25;  //this is head of bolt
boltbottomhieghtnut= 0.50;  //this is head of bolt
boltsizebase= DiameterBolt * 0.5;     //sizeofbolt rod
boltlength= ShankBoltLenght; //total length of bolt
boltbasesides = HeadShape ; //how  many sides to base bolt shape
threadlength= ShankThreadLength; //lenght down from top of bolt
threadspacing=1/ThreadPitch ; 
threadcut=1/16*(printCal); //howdeep thread is
threadthickness=1/8 ; //this is thickness width of cut of thread
threadingrotation=60 ;//prevents threads from overhangs
threadingrotationnut=40 ;//prevents threads from overhangs
polygonIntersect=3 ; //this is used to make sure threading intersects other polygons so stl generation is possible
polygonIntersectnut=2;
tapper=4 ; //2mm  no size convesion
threadingpolygonspercircle =25 ; // this is detail level higher is better but takes forever
//this is code section. do not change below here
//***************************************
translate([leftcal,0,zerocal])
cylinder(r1=boltsizebase*size* printCal,r2=boltsizebase*size* printCal,h=(boltlength-threadlength)*size);
translate([leftcal,0,zerocal])
cylinder(r1=(boltsizebase*size* printCal)-threadcut*size, r2=(boltsizebase*size* printCal)-threadcut*size,h=(boltlength)*size);


//this is screwofbolt
translate([leftcal,0,zerocal])
if (enablethread== 1){
for (timesaround=[0:threadingpolygonspercircle*((boltlength-threadlength)* scalethreads)/threadspacing]){
rotate([0,0,(timesaround*360)/threadingpolygonspercircle])
translate([0,(boltsizebase*size)-(threadcut/2)*size-polygonIntersect,(boltlength-threadlength)*size+(timesaround*threadspacing)])
//cube(size=[3 *20/threadingpolygonspercircle,threadcut*size,threadthickness*size]);
rotate([threadingrotation,0,0]) cube(size=[3 *20/threadingpolygonspercircle,(threadcut*size)*printCal+polygonIntersect,threadthickness*size]);


}
}

if (CarriageBoltType==1) {//code for determining bolt type



}  

translate([leftcal,0,zerocal])
//tapper at top of bolt
translate([0,0,(boltlength*size)]) cylinder(r1=(boltsizebase*size*printCal)-threadcut*size, r2=(boltsizebase*size*printCal)-threadcut*size-tapper/2,h=(tapper));


//this is base of bolt this generates sides
translate([leftcal,0,zerocal])
for ( r= [1:boltbasesides]) {
rotate([0,0,r*(360/boltbasesides) ])


//this is for fill in of base part
//this is an attempt to speed up math processing from shortcuts further

for ( outsideinside = [0:radiusboltbase*size]) {

translate([outsideinside,0,0])
cube(size=[1,(180*radiusboltbase)/boltbasesides,boltbottomhieght*size], center=true);


}

}; //end of  for


difference(){
//this is base of bolt this generates sides
translate([leftcalnut,0,zerocalnut])





intersection(){
for ( r= [1:boltbasesides]) {
rotate([0,0,r*(360/boltbasesides) ])


//this is for fill in of base part
//this is an attempt to speed up math processing from shortcuts further

for ( outsideinside = [0:radiusboltbase*size]) {

translate([outsideinside,0,0])
cube(size=[1,(180*radiusboltbase)/boltbasesides,boltbottomhieghtnut*size], center=true);


}
}
}//end of intersect



translate([leftcalnut,0,zerocalnut-threadoffsetnut])
cylinder(r1=boltsizebase*size,r2=boltsizebase*size,h=(boltlength-threadlength)*size);
translate([leftcalnut,0,zerocalnut-threadoffsetnut])
cylinder(r1=(boltsizebase*printCal*size)-threadcut*size, r2=(boltsizebase*printCal*size)-threadcut*size,h=(boltlength)*size);


translate([leftcalnut,0,zerocalnut-threadoffsetnut])
if (enablethread== 1){
for (timesaround=[0:threadingpolygonspercircle*((boltlength-threadlength)* scalethreads)/threadspacing]){

rotate([0,0,(timesaround*360)/threadingpolygonspercircle])
translate([0,(boltsizebase*size)-(threadcut/2)*size-polygonIntersectnut,(boltlength-threadlength)*size+(timesaround*threadspacing)])
//cube(size=[3 *20/threadingpolygonspercircle,threadcut*size,threadthickness*size]);
rotate([threadingrotationnut,0,0]) cube(size=[3 *20/threadingpolygonspercircle,(threadcut*size)+polygonIntersect,threadthickness*size]);


}
}




}
