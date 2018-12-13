B = [1 0; 1 4; -3 2; -3 -2; 1 -4; 1 0];
t = 0:0.01:1;
n = size(B,1)-1;
w = [1 ones(1,n-1)/n 1];

% pravilna kroznica
plot(sin((0:0.01:1)*2*pi),cos((0:0.01:1)*2*pi),'r'); hold on;

% racionalna krivulja na vhodnih podatkih
plotrbezier(B,w,t,false); hold on;

% visanje stopnje in izris
for i = 1:30
    [B,w] = rbezierelv(B,w);
    plotbezier(B,t,false); hold on;
end