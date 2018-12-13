B = [1 0; 1 4; -3 2; -3 -2; 1 -4; 1 0];
t = 0:0.01:1;
n = size(B,1)-1;
w = [1 ones(1,n-1)/n 1];

% pravilna kroznica
plot(sin((0:0.01:1)*2*pi),cos((0:0.01:1)*2*pi)); hold on;

% racionalna krivulja na vhodnih podatkih
plotrbezier(B,w,t); hold on;

% visanje stopnje
for i = 1:3
    B = rbezierelv(B,w);
    n = size(B,1)-1;
    w = [1 ones(1, n-1)/2 1];
    plotrbezier(B,w,t); hold on;
end