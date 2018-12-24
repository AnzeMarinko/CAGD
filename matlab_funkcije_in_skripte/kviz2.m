% 2. kviz RPGO, Anže Marinko, 27182007
format long;
resitve = zeros(3,4);

% 1. naloga
a = 164/101;
B = [0 a; 2 0; 1 -3; -2 -4; 0 3];
w = [1 3 0.5 a 1];
t = 0.4;
%1.1
b = rdecasteljau(B,w,t);
v1 = b-B(1,:);
resitve(1,1) = sum(v1.*v1)^(1/2);
%1.2
n = 4; d = 2;
b = NaN(n+1, d);
w1 = w; w2 = w;
for i = 0:n
    b(i+1,:) = B(i+1,:);
end
for r = 1:2
    for i = 0:(n-r)
        w2(i+1) = (1-t)*w1(i+1) + t*w1(i+2);
        b(i+1,:) = ((1-t)*w1(i+1)/w2(i+1)).*b(i+1,:);
        b(i+1,:) = b(i+1,:) + (t*w1(i+2)/w2(i+1)).*b(i+2,:);
        w1(i+1) = w2(i+1);
    end
end
b = b(2,:);
i=2;
bf = w(i)/(w(i)+w(i+1))*B(i,:) + w(i+1)/(w(i)+w(i+1))*B(i+1,:);
v2 = b-bf;
resitve(1,2) = sum(v2.*v2)^(1/2);
%1.3
w1 = w; w2 = w;
for i = 0:n
    b(i+1,:) = B(i+1,:);
end
for r = 1:3
    for i = 0:(n-r)
        w2(i+1) = (1-t)*w1(i+1) + t*w1(i+2);
        b(i+1,:) = ((1-t)*w1(i+1)/w2(i+1)).*b(i+1,:);
        b(i+1,:) = b(i+1,:) + (t*w1(i+2)/w2(i+1)).*b(i+2,:);
        w1(i+1) = w2(i+1);
    end
end
for i = 0:(n-4)
    w2(i+1) = (1-t)*w1(i+1) + t*w1(i+2);
end
db = 4*(w1(1)*w1(2)/w2(1)^2)*(b(2,:)-b(1,:));
resitve(1,3) = sum(db.*db)^(1/2);
%1.4
for i = 1:4
    [B,w] = rbezierelv(B,w);
end
resitve(1,4) = sum(sum(diff(B).*diff(B),2).^(1/2));

% 2. naloga
b = 192/101;
Bx = [0 2 5 7; 1 3 6 9; 0 3 5 8];
By = [b 3 0 2; 5 6 4 6; 8 9 7 9];
Bz = [b 3 3 0; 0 b 2 6; 1 4 5 7];
%2.1
u = 0.25; v = 0.75;
[sx,sy,sz] = bezier2(Bx,By,Bz,u,v);
s1=[sx,sy,sz];
v1 = s1 - [Bx(1,1),By(1,1),Bz(1,1)];
resitve(2,1) = sum(v1.*v1)^(1/2);
%2.2
aB = [1 3 6 9; 5 6 4 6; 0 b 2 6]';
v1 = bezier(aB, u)' - [Bx(1,1),By(1,1),Bz(1,1)];
resitve(2,2) = sum(v1.*v1)^(1/2);
%2.3
aBx = [0 7; 0 8]; aBy = [b 2; 8 9]; aBz = [b 0; 1 7];
[sx,sy,sz] = bezier2(Bx,By,Bz,0:0.1:1,0:0.1:1);
[px,py,pz] = bezier2(aBx,aBy,aBz,0:0.1:1,0:0.1:1);
resitve(2,3) = max(max((sx-px).^2 + (sy-py).^2 + (sz-pz).^2))^(1/2);
%2.4
[aBx,aBy,aBz] = lsqbezier2(1, 1, bezier2(Bx,By,Bz,0:0.5:1,0:0.5:1),0:0.5:1,0:0.5:1);
[px,py,pz] = bezier2(aBx,aBy,aBz,0:0.1:1,0:0.1:1);
resitve(2,4) = max(max((sx-px).^2 + (sy-py).^2 + (sz-pz).^2))^(1/2);

% 3. naloga
c = 81/201;
%3.1
resitve(3,1) = pointbary([0.25; c],[0 0; 1 0; 0 1]');


% matrika resitev za izpis v konzoli
resitve