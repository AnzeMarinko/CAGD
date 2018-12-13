function B = beziercubspline (u,D)
% Opis :
% beziercubspline izracuna sestavljeno Bezierjevo krivuljo
% stopnje 3, ki je dvakrat zvezno odvedljiva v stikih
%
% Definicija :
% B = beziercubspline (u,D)
%
% Vhodna podatka :
% u seznam parametrov delitve dolžine m+1,
% D matrika , v kateri vsaka izmed m+3 vrstic predstavlja
% eno kontrolno tocko sestavljene krivulje
%
% Izhodni podatek :
% B seznam dolžine m, v kateri je vsak element matrika s
% štirimi vrsticami , ki dolocajo kontrolne tocke kosa
% sestavljene krivulje
m = size(D,1)-3;
B = cell(1,m);
du = diff(u);

for i = 1:m
    B{i} = zeros(4,size(D,2));
end
for i = 1:m-2
    B{i+1}(2,:) = (du(i+1)+du(i+2)).*D(i+2,:) + du(i).*D(i+3,:);
    B{i+1}(2,:) = B{i+1}(2,:)./(du(i)+du(i+1)+du(i+2));
    B{i+1}(3,:) = du(i+2).*D(i+2,:) + (du(i)+du(i+1)).*D(i+3,:);
    B{i+1}(3,:) = B{i+1}(3,:)./(du(i)+du(i+1)+du(i+2));
end
for i = 1:m-1
    B{i+1}(1,:) = (du(i+1).*B{i}(3,:) + du(i).*B{i+1}(2,:))./(du(i)+du(i+1));
    B{i}(4,:) = B{i+1}(1,:);
end
B{1}(1,:) = D(1,:);
B{1}(2,:) = D(2,:);
B{m}(4,:) = D(m+2,:);
B{m}(3,:) = D(m+3,:);
B{1}(3,:) = (du(2).*D(2,:) + du(1).*D(3,:))./(du(1)+du(2));
B{m}(2,:) = (du(m).*D(m+1,:) + du(m-1).*D(m+2,:))./(du(m-1)+du(m));
end

