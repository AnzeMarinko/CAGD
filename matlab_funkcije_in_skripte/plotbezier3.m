function pb3 = plotbezier3( Bx, By, Bz )
%plotbezier3 nariše Bezierjevo ploskev na
% triangulaciji podani z Bx, By in Bz

d = 20;
[tri, U] = trimeshgrid(d);

n = size(Bx,1);
B = [];
for i = 1:n
    for j = 1:n-i+1
        B = [B; [Bx(i,j) By(i,j) Bz(i,j)]];
    end
end
tri2 = trimeshgrid(size(Bx,1)-1);

b = bezier3(Bx,By,Bz,U);
s = trisurf(tri,b(:,1),b(:,2),b(:,3));
set(s,'edgecolor','black','edgealpha',0.2,'linewidth',1);
hold on;
m = trimesh(tri2,B(:,1),B(:,2),B(:,3));
set(m,'edgecolor','black','facealpha',0,'linewidth',0.1);
hold off;
end

