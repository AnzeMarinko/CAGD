function pb = plotrbezier(B,w,t)
% Opis :
% plotrbezier narise kontrolni poligon in tocke na
% racionalni Bezierovi krivulji
%
% Definicija :
% b = plotrbezier (B,w,t)
%
% Vhodni podatki :
% B matrika velikosti n+1 x d, v kateri vsaka vrstica
% predstavlja kontrolno tocko racionalne Bezierjeve
% krivulje stopnje n v d- dimenzionalnem prostoru ,
% w seznam uteži racionalne Bezierjeve krivulje ,
% t seznam parametrov dolžine N, za katere se racunajo
% tocke na racionalni Bezierjevi krivulji

n = size(B,1)-1;
d = size(B,2);
q = zeros(n,d);

for i = 1:n
    q(i,:) = w(i)/(w(i)+w(i+1))*B(i,:) + w(i+1)/(w(i)+w(i+1))*B(i+1,:);
end

rb = rbezier(B,w,t);
plot(rb(:,1),rb(:,2))
hold on;
plot(B(:,1),B(:,2),'k:s');
hold on;
plot(q(:,1),q(:,2),'rs');

end

