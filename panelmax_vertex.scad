// MendelMax
// LCD & Control panel housing
// GNU GPL v2
// Author: Tommy Cheng
// Mar 2012

include <../config/configuration.scad>

//%translate([0,0,-10])
//cube([200,200,20], center=true);

lcd_scrn_w=95.77;
lcd_scrn_h=39.96;
lcd_scrn_t=8.27;

lcd_scrn_offset_x=1.18;
lcd_scrn_offset_y=9.95;

lcd_board_t_adj=0.5;
lcd_board_w=98.11;
lcd_board_h=60.12;
lcd_board_t=12.77-lcd_scrn_t+lcd_board_t_adj;

lcd_hole_d=3.2;
lcd_hole_offset=1;

lcd_holespace_w=90.82+lcd_hole_d;
lcd_holespace_h=52.47+lcd_hole_d;

lcd_connect_w=40+5;
lcd_connect_h=10;
lcd_connect_x=7;
lcd_connect_y=1.5;

sd_reader_w=30.15;
sd_reader_h=38.00;
sd_reader_t=5;
sd_connet_w=15;
sd_connet_h=2.0;

sd_reader_lcd_x=2;

input_mounting_screw_sep=70;

reset_dia=15.86+0.7;
reset_flat_w=14.71+0.7;

click_encoder_w=13.2+1;
click_encoder_h=12.6+1;
click_encoder_t=2.64;
click_encoder_shaft_dia=6.75+0.3;
click_encoder_shaft_h=7;

mount_t=4;
extrusion_width=20;

edge_w=3;

m5_diameter=5.0 + error_factor;
m5_washer_diameter=12 + error_factor;

zip_tie_w=3;
zip_tie_t=2;

pot_t=5.06 + 1;
pot_w=6.76 + 1;
pot_h=7.18;
pot_support_t=4.5;
pot_screw_dia=5;

lower_extrusion_mount_offset=39.6;
sd_card_reader_offset=39.6;

click_encoder_nob_dia = 37;

edge_w=3;
lcd_top_edge = lcd_board_h/2+edge_w;
lcd_bottom_edge = -lcd_top_edge;

////////////////////////////////////
// Select mounting side here
////////////////////////////////////
side=1; //-1 = left, 1=right


//////////////////////////////////////////////////////////////////////////////////////////
// front, includes the reset button backcover and click encoder bracket
//////////////////////////////////////////////////////////////////////////////////////////
panelmax_vertex_front(side);

translate([ 20*(side),0,10+mount_t+lcd_board_t+1+2+1.58])
rotate([0,180,0])
if (side==-1)
reset_back_cover();
else
mirror([1,0,0])
reset_back_cover();

rotate([0,0,0])
click_encoder_bracket();

//////////////////////////////////////////////////////////////////////////////////////////
// back 
/////////////////////////////////////////////////////////////////////////////////////////
//translate([0,15,lcd_board_t+2-lcd_board_t_adj])
//rotate([0,180,0])
//panelmax_vertex_back(side);

//////////////////////////////////////////////////////////////////////////////////////////
//debug use
//translate([-0,-0,20])
//rotate([0,0,0])
//panelmax_vertex_front(side);
//
//translate([0,15,lcd_board_t+2-lcd_board_t_adj])
//rotate([0,180,0])
//panelmax_vertex_back(side);
//
//translate([lcd_board_w/2+edge_w, lcd_top_edge-extrusion_width*1.5,-10])
//translate([ 20*(side),0,10+mount_t+lcd_board_t+1+2+1.58])
//rotate([0,180,0])
//if (side==-1)
//reset_back_cover();
//else
//mirror([1,0,0])
//reset_back_cover();
//
//rotate([0,0,0])
//click_encoder_bracket();

module pot_model() {
	difference() {
		translate([0,0,5])
		union() {
			cube([pot_t, pot_w, 10], center=true);
			cylinder(r=pot_screw_dia/2, h=10);
		}
		translate([0,-3,pot_support_t/2-1])
		cube([pot_support_t-1.5, pot_w, pot_support_t+2], center=true);	
		
	}
}

module click_encoder_bracket() {
	difference() {
		union() {
			translate([0, 0,1])
			cube([input_mounting_screw_sep/2-2,10,2], center=true);
			translate([0, -.75,3+5/2])
			cube([click_encoder_w+8,click_encoder_h+6.5,6+5], center=true);
		}
		for(i=[-1,1])
		translate([i*((input_mounting_screw_sep/2)/2-(click_encoder_h+5)/4), 0, -7])
		cylinder(r=m3_diameter/2-0.1,h=20, $fn=8);

		translate([0, 2,2+5])
		cube([click_encoder_w+6,click_encoder_h+10,10], center=true);

		translate([0, 0,5+7])
		cube([input_mounting_screw_sep/2-2,11,10], center=true);

	}	
}

module reset_back_cover(side=1, thickness=2, edge_w=3, front_spacing=1) {

	y_offset=lcd_top_edge-extrusion_width*1.5;
	main_t = lcd_board_t+thickness+front_spacing+1.58;
	translate([0, 0,main_t+mount_t])
	difference() {
		union() {
			translate([extrusion_width/2, 0, 0])
			cylinder(r=extrusion_width/2,h=10);
			translate([0, 0, 0])
			cube([extrusion_width,extrusion_width/2,10]);
			translate([0, -extrusion_width, 0])
			cube([extrusion_width/2,extrusion_width*1.5,10]);
		}

		translate([extrusion_width/2,0,-2])
		rotate([0,0,-45])
		difference() {
			translate([0, 0, 0])
			cylinder(r=reset_dia/2,h=10);
			for(i=[-1,1])
			translate([0, i*(reset_flat_w/2+5/2), 0])
			cube([10,5,30], center=true);
		}

		translate([extrusion_width/2, -extrusion_width, -1])
		cylinder(r=extrusion_width/2,h=12);

		translate([3.2, -9, -5])
		rotate([0,0,180/6])
		cylinder(r=m3_diameter/2+0.3, h=20);

		translate([reset_dia+.5+.2, reset_dia-9-.6, -5])
		rotate([0,0,0])
		cylinder(r=m3_diameter/2, h=20);

		translate([-1, -extrusion_width*2+5, -1])
		cube([extrusion_width/2,extrusion_width,12]);

		translate([-1, extrusion_width/2-0.5, -1])
		cube([extrusion_width+2,extrusion_width,12]);
	}
}

module encoder()
  {
  //encoder body measures 16.15 across corners
  //12.5 X 13.25 Y
  //measures 6.21 high
  translate([-click_encoder_w/2-1,-click_encoder_h/2,0])cube([click_encoder_w+2,click_encoder_h,6.5]);
  //bearing sleeve
  cylinder(r=6.9/2,h=11);
  difference()
    {
    //shaft
    cylinder(r=6/2,h=20); // Travel measured 0.35mm (data sheet says 0.2 to 0.9)
    //cutout flat
    translate([4.5-6/2,-4,13])cube([4,8,8]);
    }
}

module click_encoder_mount(thickness, edge_w, front_spacing) {

	main_t = lcd_board_t+thickness+front_spacing+1.58;
	encoder_mount_dia= click_encoder_nob_dia+2*edge_w;

	union () {
		translate([encoder_mount_dia/2,
					-10,0])
		cylinder(r=encoder_mount_dia/2, h=main_t, $fn=100);

		translate([0,-click_encoder_nob_dia/4,0])
		cube([encoder_mount_dia,click_encoder_nob_dia/2,main_t]);
	}
}

module click_encoder_extension(thickness, edge_w, front_spacing, click_encoder_x_offset) 
{
	encoder_mount_dia= click_encoder_nob_dia+2*edge_w;
	main_t = lcd_board_t+thickness+front_spacing+1.58;

	translate([-lcd_board_w/2-edge_w,
			lcd_bottom_edge,0])
	difference () {
		click_encoder_mount(thickness, edge_w, front_spacing, 
			click_encoder_x_offset);

		//translate([-2.3,-3,3])
		translate([1.5,-0.7,3])
		scale(0.93) click_encoder_mount(thickness, edge_w, front_spacing);

		translate([encoder_mount_dia/2, -10,(click_encoder_t+click_encoder_shaft_h)/2+1.5-15])
				cylinder(r=click_encoder_shaft_dia/2,h=100);
	}
	
	translate([-lcd_board_w/2-edge_w,
		lcd_bottom_edge,0]) {
		translate([encoder_mount_dia,-extrusion_width/2+1,0])
		difference() {
			cube([extrusion_width/2, extrusion_width/2+1, main_t]);
	
			translate([extrusion_width/2,-1,0])
			cylinder(r=extrusion_width/2, h=main_t);
		}
	
		translate([encoder_mount_dia/2,-10,(click_encoder_t+click_encoder_shaft_h)/2+1.5])
		difference() {
			 union() {
				cube([click_encoder_w+5,click_encoder_h+5,click_encoder_t+click_encoder_shaft_h], center=true);
				cube([input_mounting_screw_sep/2-4,10,click_encoder_t+click_encoder_shaft_h], center=true);
			}
			translate([0,0,5]) {
				rotate([180,0,0])
				encoder();
				translate([0,0,-15])
				cylinder(r=click_encoder_shaft_dia/2,h=20);
	
				for(i=[-1,1])
				translate([i*((input_mounting_screw_sep/2)/2-(click_encoder_h+5)/4), 0, -7])
				cylinder(r=m3_diameter/2-0.4,h=click_encoder_t+click_encoder_shaft_h, $fn=8);
			}
		}
	}

}

module reset_cover_block(thickness, edge_w, front_spacing) {

	main_t = lcd_board_t+thickness+front_spacing+1.58;
	difference () {
		union () {
			translate([extrusion_width/2,
			-extrusion_width/2+extrusion_width*1.5,0]) {
				cylinder(r=extrusion_width/2, h=main_t+mount_t);
				translate([-extrusion_width,0,0])
				cube([extrusion_width,extrusion_width/2,main_t+mount_t]);
			}

			translate([-5,0,0])
			cube([5+extrusion_width,extrusion_width*1.5-10,main_t+mount_t]);

			translate([-5,-extrusion_width,0])
			cube([5+extrusion_width/2,extrusion_width*1.5,main_t+mount_t]);

			translate([extrusion_width/2,0,0])
			cylinder(r=extrusion_width/2, h=main_t+mount_t);
		}

		translate([extrusion_width/2,-extrusion_width,-1])
		cylinder(r=extrusion_width/2, h=main_t+mount_t+2);

		translate([0, 0, main_t])
		union() {
			translate([0, extrusion_width/2+extrusion_width*.25, 0])
			cube([extrusion_width+1, extrusion_width+1-extrusion_width*.25, mount_t+1]);

			translate([extrusion_width/2, extrusion_width, 0])
			cylinder(r=extrusion_width/2+.5, h=mount_t+1);
		}

		translate([extrusion_width/4-1.5,extrusion_width*.75,(mount_t+mount_t+10)/2+3])
		cube([extrusion_width*1.5, extrusion_width/2, mount_t+mount_t+10], center=true);

		translate([3.2, -9, 3])
		rotate([0,0,180/6])
		cylinder(r=m3_diameter/2-0.1, h=main_t+mount_t);

		translate([reset_dia+.5+.2, reset_dia-9-.6, 3])
		rotate([0,0,7])
		cylinder(r=m3_diameter/2-0.1, h=main_t+mount_t);
	}
}

module reset_cover_extension(screw_access, thickness, edge_w, front_spacing) 
{
	y_offset=lcd_top_edge-extrusion_width*1.5;

	translate([lcd_board_w/2+edge_w, y_offset,0])
	difference() {
		reset_cover_block(thickness, edge_w, front_spacing);
		
		translate([extrusion_width/2-1,1,0])
		rotate([0,0,-45]) {
		difference() {
			translate([0, 0, -10])
			cylinder(r=reset_dia/2,h=30);
			for(i=[-1,1])
			translate([0, i*(reset_flat_w/2+5/2), 0])
			cube([10,5,30], center=true);
		}

		translate([-(reset_dia+2)/2, -extrusion_width/2+4+2, 3])
		rotate([0,0,0])
		cube([reset_dia+2, 8, 20]);
	}

		translate([6, -extrusion_width/2+4+2, 3])
		rotate([0,0,0])
		cube([8,reset_dia+2, 20]);

		translate([extrusion_width/2, extrusion_width, 3])
		union() {
			cylinder(r=extrusion_width/2-1.5,h=40);
			translate([-extrusion_width/2,-extrusion_width/2.25,20])
			cube([extrusion_width, (extrusion_width*1.75), 40], center=true);
//			translate([0, -extrusion_width, 0])
//			cylinder(r=extrusion_width/2-1.5,h=40);
		}
		if(screw_access)
		translate([extrusion_width/2, +extrusion_width, -18])
		cylinder(r=5,h=40);
	}
}


module reset_button_block(thickness, edge_w, front_spacing) {

	main_t = lcd_board_t+thickness+front_spacing+1.58;
	difference () {
		union () {
			translate([-5,-extrusion_width,0])
			cube([5+extrusion_width/2,extrusion_width*2,main_t]);
			
			translate([extrusion_width/2,0,0])
			cylinder(r=extrusion_width/2, h=main_t);
		}
		
		for (i=[-1,1])
		translate([extrusion_width/2,-i*extrusion_width,0])
		cylinder(r=extrusion_width/2, h=main_t);
	}
}

module reset_button_extension(thickness, edge_w, front_spacing) 
{
	y_offset=lcd_top_edge-extrusion_width*1.5;

	translate([lcd_board_w/2+edge_w, y_offset,0])
	difference() {
		reset_button_block(thickness, edge_w, front_spacing);
		translate([0,0,3])
		scale(0.9) reset_button_block(thickness, edge_w, front_spacing);

		translate([extrusion_width/2-1,0,0])
		difference() {
			translate([0, 0, -10])
			cylinder(r=reset_dia/2,h=20);
			for(i=[-1,1])
			translate([0, i*(reset_flat_w/2+5/2), 0])
			cube([10,5,20], center=true);
		}

	}
}


module front_extensions(screw_cover, screw_access, thickness, edge_w, front_spacing, click_encoder_x_offset) {
	click_encoder_extension(thickness, edge_w, front_spacing, click_encoder_x_offset);
	mirror([1,0,0]) 
	if (screw_cover)
		reset_cover_extension(screw_access, thickness, edge_w, front_spacing);
	else
		reset_button_extension(thickness, edge_w, front_spacing);
}

module panelmax_vertex_front(side=-1, screw_cover=true, screw_access=true, thickness=2, edge_w=3, front_spacing=1) {

	click_encoder_x_offset=lcd_board_w/2;

	difference () {
		union() {
			difference() {
				union() {
		
					if (side>0) {
						front_extensions(screw_cover, 
							screw_access, thickness, 
							edge_w, front_spacing, click_encoder_x_offset);
					} else {
						mirror([1,0,0])
						front_extensions(screw_cover, 
							screw_access, thickness, edge_w, 
							front_spacing, click_encoder_x_offset);
					}
		
					translate([0, 0, 0])
					roundedRect([lcd_board_w+edge_w, 
						lcd_board_h+edge_w, 
						lcd_board_t+thickness+front_spacing], edge_w);
				}
		
				translate([0, 0, (lcd_board_t+thickness+front_spacing)*1.5+10]) 
				cube([lcd_board_w+edge_w*2+2, 
					lcd_board_h+edge_w*2+2, 
					lcd_board_t+thickness+front_spacing+20], center=true);

				translate([0, -40, (lcd_board_t+thickness+front_spacing)*1.5+10]) 
				cube([25, 50, lcd_board_t+thickness+front_spacing+20], center=true);

				if(side>0)
				translate([(-side)*lcd_board_w/2+7, 
					-lcd_top_edge, 
					(lcd_board_t+thickness+front_spacing)*1.5+8]) 
				cube([3, 10, lcd_board_t+thickness+front_spacing+20], center=true);

		
				translate([0,(lcd_top_edge+4.853),0])
				cube([200,10,20], center=true);
		
				translate([0,0,lcd_board_t+thickness])
				rotate([0,180,0])
				cube([lcd_board_w+1, lcd_board_h+1, 10], center=true);
		
				lcd_sdreader_model(thickness,edge_w,side);
			}
		
			for(i=[-1,1])
			translate([0,i*(lcd_scrn_h/2+3),thickness+front_spacing/2-1/2])
				cube([lcd_board_w+2, 1, front_spacing+1], center=true);
			
			translate([0,0,thickness+front_spacing/2-1.5])
			lcd_screw_support(front_spacing+1);

		}
		translate([0,0,6.8])
		lcd_screw_holes(false,8);

		translate([0,0,-23.5])
		lcd_screw_holes(false,20,6);
	}

}

module side_tab(curve_side=true) {

	difference() {
		union() {
			translate([0, 0, 0])
			cube([extrusion_width/2, extrusion_width, mount_t]);

			translate([0, extrusion_width/2, 0])
			cylinder(r=extrusion_width/2, h=mount_t);
			if (curve_side)
			translate([extrusion_width/4,-extrusion_width/4,mount_t/2])
			cube([extrusion_width/2, extrusion_width/2, mount_t], center=true);

		}
		if (curve_side)
		translate([0,-extrusion_width/2, mount_t/2])
		cylinder(r=extrusion_width/2, h=mount_t+2, center=true);

		translate([0, extrusion_width/2, -1])
		cylinder(r=m5_diameter/2, h=10);
	}
}

module lower_tab() {
	difference() {
		union() {
			translate([0,0,0])
			cube([extrusion_width, extrusion_width+10, mount_t], center=true);
		
			translate([extrusion_width/2, 
				-extrusion_width*1.25, -mount_t/2])
			rotate([0,0,90])
			side_tab(false);
		
			translate([-extrusion_width*3/4, 0, 0])
			cube([extrusion_width/2, 
				extrusion_width/2, 
				mount_t], center=true);
		}
		translate([-extrusion_width, -extrusion_width/2+5, 0])
		cylinder(r=extrusion_width/2, h=mount_t+2, center=true);

		// lower mounting hole
		translate([0, -extrusion_width/2+5,
			-5])
		cylinder(r=m5_diameter/2, h=10);
	}
}

module panelmax_vertex_back(side=1, thickness=2, edge_w=3, front_spacing=1) {
	main_t=lcd_board_t+thickness-lcd_board_t_adj;
	tabs_z=(lcd_board_t+thickness-lcd_board_t_adj)/2-1.10;

	difference() {
		union() {
			difference() {
				union() {
					translate([0, 0, 1])
					roundedRect([lcd_board_w+edge_w, 
						lcd_board_h+edge_w+0.3, 
						main_t-1], edge_w);
					
					translate([0, lcd_top_edge-extrusion_width/2, 
						main_t-mount_t/2])
					cube([lcd_board_w+edge_w*2+5, 
						extrusion_width, 
						mount_t], center=true);

					//top tabs
					translate([-(lcd_board_w+edge_w*2)/2-extrusion_width*0.5,
						lcd_top_edge-extrusion_width,
						main_t-mount_t]) 
					side_tab();

					mirror([1,0,0])
					translate([-(lcd_board_w+edge_w*2)/2-extrusion_width/2, 
						lcd_top_edge-extrusion_width,
						main_t-mount_t])
						side_tab();
				}

				translate([0,0,-lcd_board_t-thickness-0.01])
				lcd_sdreader_model(thickness,edge_w,side);
			
				translate([0,0,-10/2+lcd_board_t-lcd_board_t_adj])
				cube([lcd_board_w+1, lcd_board_h-20, 10], center=true);
			}

			//lcd support taps
			translate([15*side*-1, 
				(lcd_board_h)/2-1.5, 
				tabs_z])
			cube([8, 3, 8], center=true);

			translate([(-lcd_board_w)/2+10, 
				(-lcd_board_h)/2+1.5, 
				tabs_z])
			cube([8, 3, 8], center=true);
			
			//sdcard reader support tap
			translate([((-lcd_board_w)/2+sd_reader_lcd_x+sd_card_reader_offset+30)*side, 
				(lcd_board_h-sd_reader_h)/2+edge_w+1-sd_reader_h/2-1, 
				tabs_z])
			cube([8, 3, 4], center=true);

			translate([(lcd_board_w)/2-1.5, -10, 
				tabs_z])
			cube([3, 8, 8], center=true);

			translate([side*-1*(12), 
				0, 
				tabs_z])
			cube([3, 8, 8], center=true);

			translate([(-lcd_board_w)/2+1.5, 
				(lcd_board_h)/2-10, 
				tabs_z])
			cube([3, 8, 8], center=true);

			translate([(-(lcd_board_w+edge_w*2)/2+extrusion_width/2+lower_extrusion_mount_offset)*side, 
				lcd_bottom_edge-extrusion_width/2+5,
				main_t-mount_t/2])
			lower_tab();
		}
		translate([0,0,-1.5])
		lcd_screw_holes(true);

		translate([side*(-lcd_board_w)/2, 
			lcd_top_edge-extrusion_width*1.5, 
			main_t-mount_t-5])
		cube([10, 5, 10], center=true);

		translate([side*(-lcd_board_w/2-edge_w+(click_encoder_nob_dia+2*edge_w)/2),
			-lcd_top_edge, 
			main_t+5])
		cube([click_encoder_w+8+2, 24, 13], center=true);

	}

}


module lcd_sdreader_model(thickness, edge_w, side) {

	translate([0,0,lcd_board_t+thickness])
	rotate([0,180,0])
	lcd_model();

//	translate([(sd_reader_h-lcd_board_w)/2-edge_w-sd_reader_lcd_x,
//		0,
//		sd_reader_t/2+lcd_board_t+thickness+0.5])
//	rotate([0,180,90])
//	sd_reader_model();

	translate([((sd_reader_w-lcd_board_w)/2+sd_reader_lcd_x+sd_card_reader_offset+20)*side,
		(lcd_board_h-sd_reader_h)/2+edge_w+2,
		sd_reader_t/2+lcd_board_t+thickness+1])
	rotate([0,180,0])
	sd_reader_model();


//	translate([30,lcd_board_h/2-8,lcd_board_t+thickness+1])
//	rotate([-90,0,0])
//	pot_model();
}

module lcd_model() {
lcd_connect_t=15;

	difference() {
		union() {
			translate([0, 0, (lcd_scrn_t+lcd_board_t)/2])
			cube([lcd_scrn_w+1, lcd_scrn_h+1, lcd_scrn_t+lcd_board_t], center=true);
		
			translate([0, 0, lcd_board_t/2])
			cube([lcd_board_w+1, lcd_board_h+1, lcd_board_t], center=true);

			translate([-((lcd_board_w+1+lcd_connect_w))/2+lcd_connect_w+lcd_connect_x, 
			-((lcd_board_h+1+lcd_connect_h))/2+lcd_connect_h-(lcd_connect_h/2-lcd_connect_y), 
			-lcd_connect_t/2])
			cube([lcd_connect_w, lcd_connect_h, lcd_connect_t], center=true);
		}
		//lcd_screw_holes();
	}
}

module lcd_screw_holes(nut_trap=false, fn=8, dia=m3_diameter) {
	for(i=[-1,1])
	for(j=[-1,1]) {
		if (nut_trap) {
			translate([i*lcd_holespace_w/2,j*lcd_holespace_h/2,-5.5-.35])
			rotate([0,0,0])	
			cylinder(r=dia/2, h=10, $fn=fn);
	
			translate([i*lcd_holespace_w/2,j*lcd_holespace_h/2,4.5])
			rotate([0,0,0])	
			cylinder(r=m3_nut_diameter_bigger/2-0.2, h=10, $fn=6);
		} else {
			translate([i*lcd_holespace_w/2,j*lcd_holespace_h/2,-5])
			rotate([0,0,0])	
			cylinder(r=dia/2, h=30, $fn=fn);
		}
	}
}

module lcd_screw_support(thickness=2, fn=18) {
	for(i=[-1,1])
	for(j=[-1,1]) {
		translate([i*lcd_holespace_w/2,j*lcd_holespace_h/2,0])
		rotate([0,0,0])	
		cylinder(r=m3_diameter/2+3, h=thickness, $fn=fn);
	}
}

module sd_reader_model() {
	sd_connet_t=15;
	translate([0, 0, 0])
	cube([sd_reader_w+1, sd_reader_h+1, sd_reader_t], center=true);

	translate([(-sd_reader_w+sd_connet_w)/2+2.6, -sd_reader_h/2+1.5, (-sd_connet_t+sd_reader_t)/2])
	cube([sd_connet_w+1, sd_connet_h+1, sd_connet_t], center=true);

	// card reader ziptie
	for (i=[-1,1])
	translate([i*(sd_reader_w+1+zip_tie_t)/2,
		-10, 0]) {
		cube([zip_tie_t,zip_tie_w,20], center=true);
	}
}


module roundedRect(size, radius) {
	x = size[0]; 
	y = size[1]; 
	z = size[2]; 

	linear_extrude(height=z) 
	hull() { 
		// place 4 circles in the corners, with the given radius 
		translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0]) circle(r=radius); 
		translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0]) circle(r=radius); 
		translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0]) circle(r=radius); 
		translate([(x/2)-(radius/2), (y/2)-(radius/2), 0]) circle(r=radius); 
		translate([0,0,0]);
	} 
}
