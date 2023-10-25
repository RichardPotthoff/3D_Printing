// PRUSA Mendel  
// Endstop holder
// Used to attach endstops to 8mm rods
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @id endstop-holder
 * @name Endstop holder
 * @category Printed
 * @using 1 m3x20xhex
 * @using 1 m3nut
 * @using 2 m3washer
 */
module endstop(){
outer_diameter = m8_diameter/2+3.2;
screw_hole_spacing = 10;
opening_size = m8_diameter-1.5; //openingsize
switch_hole_diameter=2.5;

difference(){
	union(){


		translate([outer_diameter, outer_diameter, 0]) cylinder(h =10, r = outer_diameter, $fn = 20);
		translate([outer_diameter, 0, 0]) cube([15.5,outer_diameter*2,10]);
		translate([0,12,0])rotate(-90)cube([31
, 4, 30]);
        
		translate([0,4,15])rotate(-90)cube([23
, 4.5, 12]);
        
		translate([17, 4, 5]) rotate([90, 0, 0]) #cylinder(h =6, r = m4_nut_diameter/2+1.5, $fn = 6);
	}




	translate([9, outer_diameter-opening_size/2, 0]) cube([18,opening_size,20]);
	translate([outer_diameter, outer_diameter, 0]) cylinder(h =40, r = m8_diameter/2+0.2, $fn = 18);

	//Securing hole
	translate([17, 17, 5]) rotate([90, 0, 0]) cylinder(h =20, r = m4_diameter/2+0.2, $fn = 10);
	translate([17, 1, 5]) rotate([90, 0, 0]) #cylinder(h =5, r = m4_nut_diameter/2, $fn = 6);

	translate([17, 17, 5]) rotate([90, 0, 0]) #cylinder(h =20, r = m4_diameter/2, $fn = 10);
translate([3,0,0]) rotate(90){
     translate([-13,-5,27])cube([17,25,2]);
     translate([-13,-5,13])cube([17,25,2]);
     translate([-26,-5,10])cube([30,25,2]);
     translate([3,-5,13])cube([1,25,15]);
	translate([-15, 1, -1]) rotate([0, 0, 0]) cylinder(h =12, r = switch_hole_diameter/2, $fn = 10);
	translate([-3, 17, 23]) rotate([90, 0, 0]) cylinder(h =20, r = switch_hole_diameter/2, $fn = 10);
	translate([-(3+screw_hole_spacing), 17, 23]) rotate([90, 0, 0]) cylinder(h =20, r = switch_hole_diameter/2, $fn = 10);}
}
}
mirror()rotate(a=-90,v=[0.,1,0])endstop();

