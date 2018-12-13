function [bx ,by ,bz] = bezier2 (Bx ,By ,Bz ,u,v)
% Opis :
% bezier2 vrne tocke na Bezierjevi ploskvi iz tenzorskega
% produkta
%
% Definicija :
% [bx ,by ,bz] = bezier2 (Bx ,By ,Bz ,u,v)
%
% Vhodni podatki :
% Bx , By , Bz matrike velikosti n+1 x m+1, ki dolocajo
% koordinate kontrolnih tock ,
% u, v vrstici dolžine M in N, ki predstavljata
% parametre v smereh u in v.
%
% Izhodni podatki :
% bx , by , bz matrike velikosti N x M, ki predstavljajo
% tocke na Bezierjevi ploskvi :
% [bx(J,I) by(J,I) bz(J,I)] je tocka pri
% parametrih u(I) in v(J).
m = size(Bx,2)-1;
n = size(Bx,1)-1;
B = zeros(n+1, m+1, 3);
B(:,:,1) = Bx;
B(:,:,2) = By;
B(:,:,3) = Bz;
M = length(u);
N = length(v);
b = zeros(N,M,3);

for ui = 1:length(u)
    for vj = 1:length(v)
        for j = 1:3
            dB = zeros(m+1);
            for i = 1:m+1
                x = decasteljau(B(:,i,j), v(vj));
                dB(i) = x(1,n+1);
            end
            x = decasteljau(dB, u(ui));
            b(vj,ui,j) = x(1,m+1);
        end
    end
end

bx = b(:,:,1);
by = b(:,:,2);
bz = b(:,:,3);
end