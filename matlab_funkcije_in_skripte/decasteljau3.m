function d = decasteljau3 (B,u)
% Opis :
% decasteljau3 izracuna vrednost polinoma dveh spremenljivk
%
% Definicija :
% d = decasteljau3 (B,u)
%
% Vhodna podatka :
% B matrika velikosti n+1 x n+1, ki predstavlja
% koeficiente polinoma dveh spremenljivk stopnje n v
% Bezierjevi obliki ( element matrike na mestu (i,j),
% j <= n+2-i, doloca koeficient polinoma z indeksom
% (n+2-i-j, j -1, i -1) ),
% u matrika velikosti 1 x 3, ki predstavlja baricentricne koordinate tock
% glede na domenski trikotnik , za katerega raèunamo vrednost polinoma v u
%
% Izhodni podatek :
% d vrednost polinoma v u, dolocenega z matriko B
n = size(B,1)-1;
U = ones(3,n);
U(1,:) = U(1,:)*u(1);
U(2,:) = U(2,:)*u(2);
U(3,:) = U(3,:)*u(3);
d = blossom3(B, U);
end
