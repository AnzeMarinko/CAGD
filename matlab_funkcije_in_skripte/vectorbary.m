function u = vectorbary( v,T )
%vectorbary vrne baricentri�ne koordinate vektorja v glede na trikotnik T
%   funkcija vrne 3-dimenzionalen vektor (stolpec) baricentri�nih koordinat
%   vektorja v (podane kot 2-dimenzionalen vektor (stolpec) v kartezi�nih
%   koordinatah) in trikotnika T (podanega kot matriko 2x3, kjer stolpci
%   pomenijo kartezi�ne koordinate oglji�� trikotnika)

u = pointbary(v, T) - pointbary([0;0], T);
end

