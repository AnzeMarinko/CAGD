function Be = bezierelv (B,k)
% Opis :
% bezierelv izvede visanje stopnje dane Bezierjeve krivulje
%
% Definicija :
% Be = bezierelv (B,k)
%
% Vhodna podatka :
% B matrika velikosti (n +1) x d, v kateri vsaka vrstica
% predstavlja d- dimenzionalno kontrolno tocko
% Bezierjeve krivulje stopnje n,
% k stevilo , ki doloca , za koliko zelimo zvisati stopnjo
% dane Bezierjeve krivulje
%
% Izhodni podatek :
% Be matrika velikosti (n+k +1) x d, v kateri vsaka
% vrstica predstavlja d- dimenzionalno kontrolno tocko
% Bezierjeve krvulje stopnje n+k, ki ustreza dani
% Bezierjevi krivulji
n = size(B,1) - 1;
d = size(B,2);
Be = zeros(n + 1 + 1, d);

for j = 1:d
    Be(1,j) = B(1,j);
    Be(n+2,j) = B(n+1,j);
    for i = 1:n
        Be(i+1,j) = (1-i/(n+1))*B(i+1,j)+i/(n+1)*B(i,j);
    end
end
if k ~= 1
    Be = bezierelv(Be,k-1);
end

Be;
end

