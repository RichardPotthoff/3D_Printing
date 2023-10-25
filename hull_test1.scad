module h(v){hull(){translate(v){child(0);} child(0);}}
module h1(v){hull(){translate(v){child(0);} child(0);}}
module h2(v){hull(){translate(v){child(0);} child(0);}}
module roundedcube(size,r){
h2(v=[0,0,size[2]])h1(v=[0,size[1],0])h(v=[size[0],0,0])sphere(r);}

roundedcube([10,20,5],4);