% 5. naloga: izris lomljenke
B = [0 0; 2 3; 4 2; 5 -1]; t = 0.5;
plotbezier(B,0:0.01:1)
k = 2;
b = beziersub(B,t,k);
for i = 1:size(b,2)
    plotbezier(b{i},0:0.01:1)
end

% 6. naloga: izris višanja stopnje
B = [0 0; 2 6; 3 0; 5 4; 7 1; 5 5; 10 6];
plotbezier(B,0:0.01:1)
k = 5;
plotbezier(bezierelv (B ,k),0:0.01:1)