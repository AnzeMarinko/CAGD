% bezierjeva krivulja v kontrolnih toèkah B
% pri vrednostih parametra t
B = [-2/3 -4/5; 1/3 1/5; 0 0; -1/3 1/5; 2/3 -4/5];
t = 0:0.01:1;
r = 2;
% izris r-tega odvoda
plotbezierder(B,r,t);