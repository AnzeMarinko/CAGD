function bs = beziersurf( B )
%beziersurf izri�e Bezierjevo ploskev in kontrolno mre�o za dane to�e B
%   B ... 3-slojna matrika, kjer so B(i,j,:) (x,y,z)-koordinate (i,j)-te
%   kontrolne to�ke

Bx = B(:,:,1);
By = B(:,:,2);
Bz = B(:,:,3);
u = linspace(0,1,50);
v = linspace(0,1,50);
[bx, by, bz] = bezier2(Bx,By,Bz,u,v);


s = surf(bx,by,bz);
set(s,'edgecolor','black','edgealpha',0.2,'linewidth',1);
hold on;
m = mesh(Bx,By,Bz);
set(m,'edgecolor','black','facealpha',0);
hold off;
end

