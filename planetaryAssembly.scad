/*
 *	planetaryAssembly.scad
 *
 *	by aubenc @ Thingiverse
 *
 * available at http://www.thingiverse.com/thing:23030
 *
 * released under the Creative Commons - Public Domain Dedication license
 *
 *
 *	This script requires the 3 following OpenSCAD libraries
 *
 *			Public Domain Involute Parameterized Gears - by LeemonBaird
 *			( http://www.thingiverse.com/thing:5505 )
 *
 *			Poor man's openscad screw library - by aubenc
 *			( http://www.thingiverse.com/thing:8796 )
 *
 *			Knurled surface finishing library - by aubenc
 *			( http://www.thingiverse.com/thing:9095 )
 *
 *
 * The STL parts that this script can produce are intended to assemble a
 *	planetary gear set with multiple stackable stages each of them with a ratio
 *	of 1:4 per stage.
 *
 * It has been designed to be small, easy to print*, easy to assemble and
 * hardware free.
 *
 *	(*)	It did require some fine tunning of the profile for a stepper extruder
 *			printer setup using 1.75mm filament through a 0.4mm nozzle.
 *
 * 		Layer Height must be set to 0.25mm.
 *
 *			It also requires a slightly fat and slow that lays down material enough
 *			to ensure that each layer is well fused with the previous one and the
 *			threads for nuts and taps will print properly. Infill should be set to 
 *			a minimum of 60% or the screws will break (even more easily). 
 *
 *	It has not been designed to be strong and/or have a smooth, friction-less,
 *	stable operation. Handle with care!
 *	
 *	There's not a lot of parameters to change, just the ones to adjust some of
 * the tolerances for the gears and bolts&nuts. Other parameters are also shown
 * but should not be changed unless you like to have to tweak the code in the
 * modules for almost each and every part.
 *
 * Usage:
 *
 *			Scroll down to the Modules section, uncomment the module corresponding
 *			to the part you'd like to generate and press F6 to compile.
 *
 *			The modules intended to produce parts that are threaded or have knurled
 *			surfaces finishing will not render fine (F5) and will take some time to
 *			compile.
 */

/* **** Required Libraries *************************************************** */

use <openscad_libs/polyScrewThread.scad>
use <openscad_libs/knurledFinishLib.scad>
use <openscad_libs/publicDomainGearV1.1.scad>


/* **** Parameters *********************************************************** */

pressure_angle	= 22.5;
clearance		= 0.2;
backslash		= 0.1;
nut_n_bolt_gap = 0.4;


/* Initially those where also supposed to be parameters, don't change them...  */

circular_p = 2.5;	   // Circular pitch 
n1         = 9;		// Planet's teeth number
n2         = 9;		// Sun. teeth number. Finally same than planet...
thickness  = 5;		// For the planets


/* **** Computed ************************************************************* */

	rp1 = circular_p * n1 / PI / 2;              // radius of pitch circle
	ro1 = rp1 + circular_p / PI - clearance;		// radius of outer circle
	rr1 = 2*rp1-ro1-clearance;							// radius of root circle

	rp2 = circular_p * n2 / PI / 2;              // radius of pitch circle
	ro2 = rp2 + circular_p / PI - clearance;		// radius of outer circle
	rr2 = 2*rp2-ro2-clearance;							// radius of root circle

	rp3=rp1+2*rp2;                               // radius of pitch circle
	ro3 = rp3 + circular_p / PI + clearance;		// radius of outer circle
	rr3=2*rp3-ro3-clearance;							// radius of root circle
	n3=n1*rp3/rp1;                               // Annulus teeth number


/* **** Modules... *********************************************************** */


/* **** Single Parts ********************************************************* */

/* *** Stage *** */

//	planet();
//	annulus_plate();
//	ring_bottom();
//	ring_top();


/* *** Enclosure *** */

//	end_plate();
//	rod(58);						// Parameter is total length
//	k_nut(nut_n_bolt_gap);	// Parameter is gap with the rod/bolt to fit


/* *** Input tools: Crank and tool bit *** */

//	crank_arm();
//	crank_knurl();
//	crank_bolt();
//	crank_nut();
//	tool_bit();


/* **** Sets ***************************************************************** */

//	1_to_2_stages_kit(35);				// Length for the bolts
//	1_to_3_stages_kit(47);				// Length for the bolts
//	1_to_4_stages_kit(58);				// Length for the bolts
//	enclosure(25, nut_n_bolt_gap);	// Length for the bolts, gap for the nuts
//	input_tools();


/* **** Build Plates ********************************************************* */

//                   // Required Build Envelope
//	1x_stages_kit();	// X:  80mm  Y:  80mm  Z: 30mm
//	2x_stages_kit();	// X:  90mm  Y: 100mm  Z: 40mm
//	3x_stages_kit();	// X: 115mm  Y:  95mm  Z: 50mm
//	4x_stages_kit();	// X: 115mm  Y: 115mm  Z: 60mm


/* **** Utilitary modules **************************************************** */

//	n_gears(3, 2*ro1, 0.75);	// 3 planets, diameter, spacing
//	n_nuts(3, 0.35, 1);			// 3 nuts, gap with bolt, spacing
//	n_bolts(3, 58, 1);			// 3 bolts, total length, spacing


/* **** Code... ************************************************************** */

/* **** Sets ***************************************************************** */

module 1_to_2_stages_kit(ln)
{
	translate([0,3,0]) rotate([0,0,90]) stage();

	for(x=[-11,0,11])
	{
		translate([x,25,0]) rod(ln);
	}
}

module 1_to_3_stages_kit(ln)
{
	translate([-19,-8,0]) rotate([0,0,-90]) stage();

	translate([ 19,-8,0]) rotate([0,0,-90]) stage();

	translate([  0,15,0]) rotate([0,0,30]) n_bolts(3,ln,1);
}

module 1_to_4_stages_kit(ln)
{
	translate([-9,19,0]) stage();

	translate([-9,-19,0]) stage();

	translate([25,-3,0]) rotate([0,0,90]) stage();

	translate([ 17,23,0]) n_bolts(3,ln,1);
}

module stage()
{
	translate([-(ro3+2),0,0]) rotate([0,0,60]) annulus_plate();

	translate([-(ro3+2),0,0]) n_gears(3, 2*ro1, 0.75);

	translate([2*ro1,2*rp1+1,0]) rotate([0,0,-30]) ring_top();

	translate([2*ro1,-2*rp1-1,0]) rotate([0,0,30]) ring_bottom();
}

module enclosure(rln, ngp)
{
	translate([-20,0,0]) end_plate();

	translate([ 20,0,0]) rotate([0,0,60]) end_plate();

	translate([0,8,0]) rod(rln);

	translate([-9,14,0]) rod(rln);

	translate([9,14,0]) rod(rln);

	translate([0,-8,0]) k_nut(ngp);

	translate([-9,-14,0]) k_nut(ngp);

	translate([9,-14,0]) k_nut(ngp);
}

module input_tools()
{
	translate([-16,6,0]) crank_bolt();

	translate([-6.5,6,0]) tool_bit();

	translate([4.5,6,0]) crank_knurl();

	translate([16,6,0]) crank_nut();

	translate([0,-6,0]) crank_arm();
}


/* **** Build Plates ********************************************************* */

module 1x_stages_kit()
{
	translate([-5,16,0]) stage();

	translate([0,-21,0]) enclosure(23, nut_n_bolt_gap);

	translate([25,17,0]) rotate([0,0,90]) input_tools();
}

module 2x_stages_kit()
{
	translate([-24,9,0]) rotate([0,0,-90]) stage();

	translate([9,30,0]) rotate([0,0,180]) stage();

	translate([14,0,0]) rotate([0,0,180]) input_tools();

	translate([-5,-29,0]) enclosure(35, nut_n_bolt_gap);
}

module 3x_stages_kit()
{
	translate([-37,12,0]) rotate([0,0,-90]) stage();

	translate([0,12,0]) rotate([0,0,-90]) stage();

	translate([37,12,0]) rotate([0,0,-90]) stage();

	translate([33,-27,0]) rotate([0,0,90]) input_tools();

	translate([-12,-25,0]) enclosure(47, nut_n_bolt_gap);
}

module 4x_stages_kit()
{
	translate([-37,22,0]) rotate([0,0,-90]) stage();

	translate([0,22,0]) rotate([0,0,-90]) stage();

	translate([37,22,0]) rotate([0,0,-90]) stage();

	translate([37,-18,0]) rotate([0,0,90]) stage();

	translate([-5,-7,0]) input_tools();

	translate([-13,-37,0]) enclosure(58, nut_n_bolt_gap);
}


/* **** Gears modules ******************************************************** */

module sun_and_planets(nteeth,thk)
{
    gear(mm_per_tooth    = circular_p,
         number_of_teeth = nteeth,
         thickness       = thk,
			hole_diameter   = 0,
         pressure_angle  = pressure_angle,
         clearance       = clearance,
         backlash        = backslash);
}

module annulus(nteeth,thk)
{
    gear(mm_per_tooth    = circular_p,
         number_of_teeth = nteeth,
         thickness       = thk,
			hole_diameter   = 0,
         pressure_angle  = pressure_angle,
         clearance       = 0,
         backlash        = -backslash);

}


/* **** Stage modules ******************************************************** */

module annulus_plate()
{
	rd1=rr3+2*clearance;
	rd2=rd1+1;
	fnn=n3*round(2*rr3*PI/n3);

	difference()
	{
		intersection()
		{
			m_plate_body(3,3);
			m_plate_taps();
		}

		translate([0,0,3/2]) annulus(n3,3+0.1);

		translate([0,0,-0.5])
		cylinder(h=1, r1=rd2, r2=rd1, $fn=fnn, center=false);

		translate([0,0,2.5])
		cylinder(h=1, r1=rd1, r2=rd2, $fn=fnn, center=false);
	}
}

module planet()
{
	translate([0,0,thickness/2])
	intersection()
	{
		difference()
		{
			sun_and_planets(n2,thickness);

			cylinder(h=thickness+0.1, r=rr2-1.2, $fn=2*(rr2-0.9)*PI, center=true);
		}

		rotate_extrude(convexity=10, $fn=n1*round(2*ro1*PI/n1))
		polygon(points=[ [0,-thickness/2],[ro1-0.5,-thickness/2],
		                 [ro1,-thickness/2+0.5],[ro1,thickness/2-0.5],
						     [ro1-0.5,thickness/2],[0,thickness/2] ],
					paths=[ [0,1,2,3,4,5] ]);
	}
}

module ring_top()
{
	ps=3;
	lf=360/ps;

	difference()
	{
		union()
		{
			difference()
			{
				cylinder(h=3, r=rp1+rp2, $fn=4*round(2*(rp1+rp2)*PI/4), center=false);

				for(i=[0:ps-1])
				{
					rotate([0,0,i*lf])
					translate([rp1+rp2,0,-0.1])
					cylinder(h=1+0.1, r=ro2+0.5, $fn=4*round(2*(ro2+0.5)*PI/4), center=false);
				}

				translate([0,0,-0.1])
				cylinder(h=1+0.1, r=ro2+0.5, $fn=4*round(2*(ro2+0.5)*PI/4), center=false);
			}

			for(i=[0:ps-1])
			{
				rotate([0,0,i*lf])
				translate([rp1+rp2,0,0])
				cylinder(h=3, r=rr2, $fn=4*round(2*rr2*PI/4), center=false);
			}

			cylinder(h=3, r=rr2, $fn=4*round(2*rr2*PI/4), center=false);

			translate([0,0,9.5/2+2]) sun_and_planets(9,9.5);

			cylinder(h=9.5+2+2, r=rr2-1.2-0.5/2, $fn=4*round(2*rr2*PI/4), center=false);
		}
	
		for(i=[0:ps-1])
		{
			rotate([0,0,i*lf])
			translate([rp1+rp2,0,-0.1])
			cylinder(h=2.25+0.1, r=rr2-1.2, $fn=4*round(2*(rr2-1.2)*PI/4), center=false);
		}

		translate([0,0,-0.1])
		cylinder(h=2.25+0.1, r=rr2-1.2, $fn=4*round(2*(rr2-1.2)*PI/4), center=false);
	}

}

module ring_bottom()
{
	ps=3;
	lf=360/ps;

	union()
	{
		difference()
		{
			cylinder(h=2, r=rp1+rp2, $fn=4*round(2*(rp1+rp2)*PI/4), center=false);

			translate([0,0,-0.1])
			cylinder(h=2+0.2, r=ro1+0.25, $fn=4*round(2*(ro1+0.25)*PI/4), center=false);
		}

		for(i=[0:ps-1])
		{
			rotate([0,0,i*lf])
			union()
			{
				translate([rp1+rp2,0,0])
				cylinder(h=3, r=rr2, $fn=4*round(2*rr2*PI/4), center=false);

				translate([rp1+rp2,0,0])
				cylinder(h=3+5+2, r=rr2-1.2-0.5/2, $fn=4*round(2*rr2*PI/4), center=false);
			}
		}
	}
}


/* **** Enclosure modules **************************************************** */

module end_plate()
{
	intersection()
	{
		difference()
		{
			union()
			{
				end_plate_body();

				cylinder(h=3, r=ro1+2, $fn=2*(ro1+2)*PI, center=false);
			}

			translate([0,0,-0.1])
			cylinder(h=3+0.2, r=ro1+0.125, $fn=2*(ro1+2)*PI, center=false);
		}

		m_plate_taps();
	}
}

module end_plate_body()
{
	r1=ro1+1;
	r2=ro3;
	r3=((ro3-1)+(ro1+2))/2;
	r4=ro3-ro1-5;

	x1=r1*cos(22.5); y1=r1*sin(22.5);
	x2=r2*cos(22.5); y2=r2*sin(22.5);
	x3=r3*cos(22.5); y3=r3*sin(22.5);

	difference()
	{
		m_plate_body(1.5,3);

		for(i=[0:2])
		{
			translate([0,0,-0.1])
			rotate([0,0,60+i*120])
			linear_extrude(height=3, convexity=10, center=false)
			difference()
			{
				intersection()
				{
					union()
					{
						polygon(points=[ [x1,-y1],[x2,-y2],[x2,y2],[x1,y1] ],
									paths=[ [0,1,2,3] ]);

						for(j=[-1,1])
						{
							translate([x3,j*y3,0])
							rotate([0,0,j*22.5])
							circle(r=r4, $fn=4*round(2*r4*PI/2));
						}
					}

					circle(r=ro3-1, $fn=2*ro3*PI);
				}

				circle(r=ro1+2, $fn=2*(ro1+2)*PI);
			}
		}
	}
}

module rod(ln)
{
	union()
	{
		screw_thread(	5,			// Outer diameter of the thread
							1.46875,	// Step
							50,		// Degrees
							ln,		// Length (Z) of the tread
							1.25,		// Resolution
							1);		// Top end countersunk

		knurled_cyl(3, 8.5, 2.25, 3, 0.5, 0.5, 40);
	}
}

module k_nut(gp)
{
	intersection()
	{
		hex_nut(	10,		// Distance between flats
					3,			// Height 
					1.46875, // Step 
					50,   	// Degrees
					5+gp,		// Outer diameter of the thread to match
					0.5); 	// Resolution

		knurled_cyl(3, 8.5, 2.25, 3, 0.5, 0.5, 40);
	}
}


/* **** Input tools modules ************************************************** */

module crank_bolt()
{
	union()
	{
		rotate_extrude(convexity=10, $fn=4*round(6*PI/4))
		polygon(points=[ [0,0],[3,0],[4,1],[3,3],[3,19.4],[0,19.4] ],
					paths=[ [0,1,2,3,4,5] ]);

		translate([0,0,19.3])
		screw_thread(	6,		// Outer diameter of the thread
							1.5,	// Step
							50,	// Degrees
							7.5,	// Length (Z) of the tread
							1.25,	// Resolution
							1);	// Top end countersunk
	}
}

module tool_bit()
{
	rd=6.25/2/cos(30);

	intersection()
	{
		input();

		rotate_extrude(convexity=10, $fn=6)
		polygon(points=[ [0,0],[rd,0],[rd,14],[rd+3,17],[rd+3,30],[0,30] ],
					paths=[ [0,1,2,3,4,5] ]);
	}
}

module crank_knurl()
{
	intersection()
	{
		rotate_extrude(convexity=10, $fn=4*round(11*PI/4))
		polygon(points=[ [3.25,0],[5.5,0],[5.5,20],[4.25,20],[3.25,17.75] ],
					paths=[ [0,1,2,3,4] ]);

		knurled_cyl(20, 10, 3, 4, 1, 0.5, 50);
	}
}

module crank_nut()
{
	gp=nut_n_bolt_gap;

	intersection()
	{
		hex_nut(	15,	// Distance between flats
					3,		// Height 
					1.5,  // Step 
					50,   // Degrees
					6+gp,	// Outer diameter of the thread to match
					0.5); // Resolution

		knurled_cyl(3, 10, 2, 3, 0.5, 0.5, 40);
	}
}

module crank_arm()
{
	gp=nut_n_bolt_gap;

	translate([0,0,3])
	union()
	{
		translate([-15,0,-2.5]) input();
		difference()
		{
			hull()
			{
				arm_shape(ro1,5.2,30,5);
				arm_shape(ro1-0.5,5.2-0.5,30,6);
			}

			translate([-(5.2-ro1)/2,0,0])
			union()
			{
				cube(size=[30-(ro1+5.2+2)-5.6,5.6,7], center=true);

				for(x=[-1,1])
				{
					translate([x*(30-(ro1+5.2+2)-5.6)/2,0,0])
					cylinder(h=7, r=5.6/2, $fn=4*round(5.6*PI/4), center=true);
				}
			}

			translate([15,0,0])
			cylinder(h=4, r=5.5, $fn=2*5.5*PI, center=false);

			translate([15,0,0])
			cylinder(h=7, r=4.5, $fn=2*5.5*PI, center=true);
		}

		translate([15,0,-3])
		intersection()
		{
			hex_nut(	15,	// Distance between flats
						3,		// Height 
						1.5,  // Step 
						50,   // Degrees
						6+gp,	// Outer diameter of the thread to match
						0.5); // Resolution

			cylinder(h=3, r=4.7, $fn=30, center=false);
		}
	}
}

module input()
{
	union()
	{
		translate([0,0,16+8.6/2-0.1]) sun_and_planets(9,8.6);

		cylinder(h=16+8.6+1.75-0.1, r=rr2-1.2-0.5/2, $fn=4*round(2*rr2*PI/4), center=false);

		cylinder(h=16, r=ro2, $fn=2*ro2*PI, center=false);
	}
}

module arm_shape(rd0,rd2,rd1,tk)
{
	dst=sqrt(pow(rd0-rd2,2)+pow(rd1,2));
	lf0=90-(acos(rd1/dst));

	translate([-rd1/2,0,-tk/2])
	union()
	{
		cylinder(h=tk, r=rd0, $fn=2*rd0*PI, center=false);

		translate([rd1,0,0])
		cylinder(h=tk, r=rd2, $fn=2*rd2*PI, center=false);

		linear_extrude(height=tk, convexity=10, center=false)
		polygon(points=[	[ rd0*cos(lf0),rd0*sin(lf0)],[rd1+rd2*cos(lf0), rd2*sin(lf0)],
								[rd1+rd2*cos(lf0),-rd2*sin(lf0)],[rd0*cos(lf0),-rd0*sin(lf0)]	],
					paths=[	[0,1,2,3]	]);
	}
}


/* **** Auxiliary modules **************************************************** */

module m_plate_body(ptk,etk)
{
	union()
	{
		cylinder(h=ptk, r=ro3+1, $fn=12*round(2*ro3*PI/12), center=false);

		for(i=[0:3])
		{
			rotate([0,0,i*120])
			translate([(ro3+1+5/2)/2,0,ptk/2])
			cube(size=[ro3+1+5/2,8.5,ptk], center=true);

			rotate([0,0,i*120])
			translate([ro3+1+5/2,0,0])
			cylinder(h=etk, r=8.5/2, $fn=4*round(8.5*PI/4), center=false);
		}
	}
}

module m_plate_taps()
{
	gp=nut_n_bolt_gap;

	union()
	{
		cylinder(h=3, r=ro1, center=false);

		for(i=[0:3])
		{
			rotate([0,0,i*120-90])
			translate([0,ro3+1+5/2,0])
			hex_nut(	2*(ro3+1+5/2),	// Distance between flats
						4,					// Height 
						1.46875,  		// Step 
						50,   			// Degrees
						5+gp,				// Outer diameter of the thread to match
						0.5); 			// Resolution
		}
	}
}

module n_gears(gno, god, gsp)
{
	glf=360/gno;
	dst=((god+gsp)/2)/sin(glf/2);

	for(i=[0:gno-1])
	{
		translate([dst*cos(i*glf),dst*sin(i*glf),0])
		rotate([0,0,i*glf+i*360/n1/2])
		planet();
	}
}

module n_nuts(nno, ngp, gsp)
{
	glf=360/nno;
	dst=((8.5+gsp)/2)/sin(glf/2);

	for(i=[0:nno-1])
	{
		translate([dst*cos(i*glf),dst*sin(i*glf),0])
		k_nut(ngp);
	}
}

module n_bolts(bno, bln, gsp)
{
	glf=360/bno;
	dst=((8.5+gsp)/2)/sin(glf/2);

	for(i=[0:bno-1])
	{
		translate([dst*cos(i*glf),dst*sin(i*glf),0])
		rod(bln);
	}
}

