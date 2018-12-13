function db = plotbezierder (B,r,t)
% Opis :
% plotbezierder nariše r-ti odvod Bezierjeve krivulje (s kontrolnimi
% toèkami odvoda) za dane kontrolne tocke in seznam parametrov
%
% Definicija :
% plotbezierder (B,r,t)
%
% Vhodni podatki :
% B matrika velikosti n+1 x d, ki predstavlja kontrolne
% tocke Bezierjeve krivulje stopnje n v
% d- dimenzionalnem prostoru ,
% t seznam parametrov dolžine k, pri katerih racunamo
% vrednost Bezierjeve krivulje
% r stopnja odvoda

if (r > 0)
    b = bezierder(B,r,t);
    n = size(B,1)-1;
    d = zeros(n-r, size(B,2));
    for i = 1:n-r+1
        for j = 1:size(B,2)
            d(i,j) = factorial(n)/factorial(n-r) * diff(B(i:i+r,j),r);
        end
    end
    if size(B,2)==2
        plot(b(1,:),b(2,:))
        hold on
        plot(d(:,1),d(:,2),'r:.')
    end
    if size(B,2)==3
        plot3(b(1,:),b(2,:),b(3,:))
        hold on
        plot3(d(:,1),d(:,2),d(:,3),'r:.')
    end
else
    plotbezier(B, t, true)
end

end