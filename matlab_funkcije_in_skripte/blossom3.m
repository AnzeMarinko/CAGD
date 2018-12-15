function b = blossom3 (B,U)
% Opis :
% blossom3 izracuna razcvet polinoma dveh spremenljivk
%
% Definicija :
% b = blossom3 (B,U)
%
% Vhodna podatka :
% B matrika velikosti n+1 x n+1, ki predstavlja
% koeficiente polinoma dveh spremenljivk stopnje n v
% Bezierjevi obliki ( element matrike na mestu (i,j),
% j <= n+2-i, doloca koeficient polinoma z indeksom
% (n+2-i-j, j -1, i -1) ),
% u matrika velikosti n x 3, v kateri vrstice
% predstavljavo baricentricne koordinate tock glede
% na domenski trikotnik , za katere izvajamo razcvet
% polinoma
%
% Izhodni podatek :
% b vrednost razcveta polinoma , dolocenega z matriko B,
% v tockah , dolocenih z matriko u
n = size(B,1)-1;
for r = 1:n
    for i = 1:n-r+1
        for j = 1:n-r-i+2
            B(i,j) = U(1,r)*B(i,j) + ...
                     U(2,r)*B(i,j+1) + ...
                     U(3,r)*B(i+1,j);
        end
    end
end

b = B(1,1);
end

