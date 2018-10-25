function BS = beziersub (B,t,k)
% Opis : beziersub izvede subdivizijo Bezierjeve krivulje
%
% Definicija :
% BS = beziersub (B,t)
%
% Vhodni podatki :
% B matrika kontrolnih tock Bezierjeve krivulje , v
% kateri vsaka vrstica predstavlja eno kontrolno
% tocko ,
% t parameter subdivizije Bezierjeve krivulje
%
% Izhodni podatek :
% BS celica , ki vsebuje kontrolne tocke dveh krivulj , ki
% jih dobimo s subdivizijo prvotne Bezierjeve krivulje
nd = size(B);
n = nd(1)-1; % imamo n toèk
d = nd(2);   % so v d-dimenzionalnem prostoru

BS = {zeros(n+1, d), zeros(n+1, d)};
for i = 1:d % i-ta dimenzija
    dec = decasteljau(B(:,i),t);
    for j = 1:n+1
        BS{1}(j,i) = dec(1,j);
        BS{2}(j,i) = dec(j,n-j+2);
    end
end
if k ~= 1
    BS = [beziersub(BS{1},t,k-1),beziersub(BS{2},t,k-1)];
end

BS;
end

