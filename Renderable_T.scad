include <OpenScadFont.scad>

height = 3;

//fnt_str( [ "T" ], 1, 1, height );

translate( [ 0, 4.5, 0 ] )
{
	scale( [ 1, 0.85, 1 ] )
		fnt_str( [ "I" ], 1, 1, height );

		scale( [ 0.9, 1.2, 1 ] )
			translate( [ -16.9, -2.6, 0 ] )
				fnt_str( [ "-" ], 1, 1, height );
}
