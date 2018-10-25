function db = bezierder (B,r,t)
% Opis :
% bezierder vrne tocke na krivulji , ki predstavlja odvod
% dane Bezierjeve krivulje
%
% Definicija :
% db = bezierder (B,r,t)
%
% Vhodni podatki :
% B matrika kontrolnih tock Bezierjeve krivulje , v
% kateri vsaka vrstica predstavlja eno kontrolno
% tocko ,
% r stopnja odvoda , ki ga racunamo ,
% t seznam parameterov , pri katerih racunamo odvod
%
% Izhodni podatek :
% db matrika , v kateri vsaka vrstica predstavlja tocko
% r- tega odvoda pri istole�nem parametru iz seznama t

if (r > 0)
    nd = size(B);
    n = nd(1)-1;
    d = nd(2);
    db = zeros(d, length(t));
    for i = 1:d
        for j = 1:length(t)
            dC = decasteljau(B(:,i),t(j));
            dCr = dC(1:r+1, n-r+1);
            db(i,j) = factorial(n)/factorial(n-r) * diff(dCr,r);
        end
    end
else
    db = bezier(B, t);
end

db;
end

