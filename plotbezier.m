function plotbezier (B,t)
% Opis :
% plotbezier nari�e Bezierjevo krivuljo za dane kontrolne
% tocke in seznam parametrov
%
%Definicija :
% plotbezier (B,t)
%
%Vhodni podatki :
% B matrika velikosti n+1 x d, ki predstavlja kontrolne
% tocke Bezierjeve krivulje stopnje n v
% d- dimenzionalnem prostoru ,
% t seznam parametrov dol�ine k, pri katerih racunamo
% vrednost Bezierjeve krivulje

if size(B,2) == 2
    % bezierjeva krivulja
    b = bezier(B,t);
    plot(b(1,:),b(2,:));
    hold on;

    % kontrolni poligon
    plot(B(:,1),B(:,2),'r:.');
end
if size(B,2) == 3
    % bezierjeva krivulja
    b = bezier(B,t);
    plot3(b(1,:),b(2,:),b(3,:));
    hold on;

    % kontrolni poligon
    plot3(B(:,1),B(:,2),B(:,3),'r:.');
end

end

