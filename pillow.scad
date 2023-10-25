p=[for(i=[0:10:360],j=[0:10:360])[sin(i),cos(j),sin(j+i)]];
f=[for(i=[0:len(p)-3])[i,i+1,i+2]];
hull()
polyhedron(p,f);