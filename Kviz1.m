% Kviz 1
% 1.)
a = 21/101;
b0 = [2, a];
b2 = [8, 1+a];
b1 = [11/2,a-1];
B = [b0;b1;b2];
t1 = 0:0.01:1;
plotbezier(B, t1); hold on;
plot(-t1.^2+7*t1+2,3*t1.^2-2*t1+a, 'b');

sum(b1.^2)^(1/2);
R = [cosd(60) -sind(60); sind(60) cosd(60)];
(sum(R*bezier(B,1/2)-b0').^2)^(1/2)
BR = R*B';
bernstein2power(BR(2,:));

% 2.)
b = 4+23/101;
B = [-1 0 1; 5 0 -2; 3 6 b; 3 3 -5];
sum(bezierder(B,1,1/4).^2)^(1/2);
sum(bezierder(B,1,1).^2)^(1/2);

t = 1/4;
bb = cross(bezierder(B,1,t),bezierder(B,2,t));
bb'*bezierder(B,3,t)/sum(bb.^2)^(1/2)

% 3.)
c = 3 + 55/101;
b0 = [1 c];
db0 = [2 5];
b3 = [3 2];
db3 = [c 3];

% 4.)
d = 69/101;
t = zeros(1,7);