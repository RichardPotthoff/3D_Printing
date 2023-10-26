%Reuleaux polygons Matlab package:
%  - Draw Reuleaux polygones
%  - Draw Lathe based on Reuleaux polygones
%
% The script steps are:
%   1/ Build the regular polygon
%   2/ Build the Reuleaux polygon
%   3/ Rotate it through one axe of symetry to get the cloud of points
%   4/ Tessellate display and save the result as a STL file
%
% Change parameter section at the beginning of this file.
%
% Copyright (C) Damien Berget 2013
% This code is only usable for non-commercial purpose and 
% provided as is with no guaranty of any sort
dbstop if error
clear *

%Parameters
%==========

nSide = 3;                    %number of sides
diameter = 30;                %equivalent diameter
precision = 2 * pi / (3*5*7); %angle between 2 points of curves in radian

%2D Reuleaux polygon
[reuleauxVertex polyVertex] = reuleauxPolygon(nSide, diameter, precision);

%3D Reuleaux sphere
reuleauxVertex3D = reuleauxLathe(nSide, diameter, precision);

%Convex hull tessellation of the Reuleaux sphere
Tes = convhulln(reuleauxVertex3D);

%Result display
figure(1)
clf
subplot(1,2,1)
hold on
plot([polyVertex(:,1);polyVertex(1,1)], [polyVertex(:,2);polyVertex(1,2)], 'r+-')
plot(reuleauxVertex(:,1), reuleauxVertex(:,2), '+-')
axis equal
axis tight
title('Regular and Reuleaux polygon')
subplot(1,2,2)
trisurf(Tes, reuleauxVertex3D(:,1),reuleauxVertex3D(:,2),reuleauxVertex3D(:,3))
axis equal
title('Reuleaux lathe sphere')

%Save STL
filename = sprintf('ReuleauxSphere_%i.stl', nSide);
tessellationToSTL(filename, Tes, reuleauxVertex3D(:,1),reuleauxVertex3D(:,2),reuleauxVertex3D(:,3))
