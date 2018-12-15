function u = pointbary( p,T )
%pointbary vrne baricentriène koordinate toèke p glede na trikotnik T
%   funkcija vrne 3-dimenzionalen vektor (stolpec) baricentriènih koordinat
%   toèke p (podane kot 2-dimenzionalen vektor (stolpec) v karteziènih
%   koordinatah) in trikotnika T (podanega kot matriko 2x3, kjer stolpci
%   pomenijo karteziène koordinate ogljišè trikotnika)

% pripravimo pomožno matriko in pomožen vektor za izraèun koordinat
aT = [ones(1,3); T];
ap = [1; p];

u = linsolve(aT,ap);
end

