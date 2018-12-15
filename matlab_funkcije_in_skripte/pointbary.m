function u = pointbary( p,T )
%pointbary vrne baricentri�ne koordinate to�ke p glede na trikotnik T
%   funkcija vrne 3-dimenzionalen vektor (stolpec) baricentri�nih koordinat
%   to�ke p (podane kot 2-dimenzionalen vektor (stolpec) v kartezi�nih
%   koordinatah) in trikotnika T (podanega kot matriko 2x3, kjer stolpci
%   pomenijo kartezi�ne koordinate oglji�� trikotnika)

% pripravimo pomo�no matriko in pomo�en vektor za izra�un koordinat
aT = [ones(1,3); T];
ap = [1; p];

u = linsolve(aT,ap);
end

