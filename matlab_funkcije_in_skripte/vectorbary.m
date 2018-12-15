function u = vectorbary( v,T )
%vectorbary vrne baricentriène koordinate vektorja v glede na trikotnik T
%   funkcija vrne 3-dimenzionalen vektor (stolpec) baricentriènih koordinat
%   vektorja v (podane kot 2-dimenzionalen vektor (stolpec) v karteziènih
%   koordinatah) in trikotnika T (podanega kot matriko 2x3, kjer stolpci
%   pomenijo karteziène koordinate ogljišè trikotnika)

u = pointbary(v, T) - pointbary([0;0], T);
end

