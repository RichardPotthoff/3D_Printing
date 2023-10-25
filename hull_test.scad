module s10(){sphere(5);};
module h10(){hull(){translate(v=[10,0,0]){s10();} s10();}}
module h11(){hull(){translate(v=[0,10,0]){h10();} s10();}}
module h12(){hull(){translate(v=[0,0,10]){h11();} s10();}}

h12();