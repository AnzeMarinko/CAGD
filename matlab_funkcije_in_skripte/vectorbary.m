function u = vectorbary( v,T )
%vectorbary vrne baricentrične koordinate vektorja v glede na trikotnik T
%   funkcija vrne 3-dimenzionalen vektor (stolpec) baricentričnih koordinat
%   vektorja v (podane kot 2-dimenzionalen vektor (stolpec) v kartezičnih
%   koordinatah) in trikotnika T (podanega kot matriko 2x3, kjer stolpci
%   pomenijo kartezične koordinate ogljišč trikotnika)

u = pointbary(v, T) - pointbary([0;0], T);
end

