function [Be ,we] = rbezierelv (B,w)
% Opis :
% rbezierelv izvede višanje stopnje dane racionalne
% Bezierjeve krivulje
%
% Definicija :
% [Be ,we] = rbezierelv (B,w)
%
% Vhodna podatka :
% B matrika velikosti (n +1) x d, v kateri vsaka vrstica
% predstavlja d- dimenzionalno kontrolno tocko
% racionalne Bezierjeve krivulje stopnje n,
% w seznam uteži racionalne Bezierjeve krivulje
%
% Izhodni podatek :
% Be matrika velikosti n+2 x d, v kateri vsaka vrstica
% predstavlja d- dimenzionalno kontrolno tocko
% racionalne Bezierjeve krvulje stopnje n+1, ki je
% prirejena dani racionalni Bezierjevi krivulji ,
% we seznam dolžine n+2, v katerem vsak element
% predstavlja utež racionalne Bezierjeve krvulje
% stopnje n+1, ki je prirejena dani racionalni
% Bezierjevi krivulji
n = size(B,1) - 1;
d = size(B,2);
Be = zeros(n+1,d+1);
we = zeros(n+2,1);

for i = 1:n+1
    Be(i,:) = [w(i)*B(i,:) w(i)];
end
Bew = bezierelv(Be,1);

we = Bew(:,d+1);
Be = zeros(n+2,d);
for i = 1:n+2
    Be(i,:) = Bew(i,1:d)/we(i);
end

end

