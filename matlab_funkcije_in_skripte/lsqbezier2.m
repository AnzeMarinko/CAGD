function [Bx,By,Bz] = lsqbezier2(m,n,P,u,v)
% Opis:
%   lsqbezier2  vrne  kontrolne  to�ke  Bezierjeve  ploskve , ki
%   se po  metodi  najmanj�ih  kvadratov  najbolje  prilega  danim
%   podatkom
%
% Definicija:
%   [Bx ,By,Bz] = lsqbezier2(m,n,P,u,v)
%
% Vhodni  podatki:
%   m,n     parametra , ki  dolo�ata  stopnji  Bezierjeve
%           ploskve  iz  tenzorskega  produkta ,
%   P       matrika , ki v vrsticah  vsebuje  to�ke v prostoru ,
%           za  katere  �elimo , da jih  Bezierjeva  ploskev
%           �imbolje  aproksimira ,
%   u,v     seznama  parametrov , ki dolo�ata , kateri  to�ki v
%           domeni  pripada  posamezna  to�ka  iz P
%
% Izhodni  podatki:
%   Bx ,By,Bz  matrike  velikosti n+1 x m+1, ki  predstavljajo
%               kontrolne  to�ke  Bezierjeve  ploskve  iz
%               tenzorskega  produkta , ki se po  metodi  najmanj�ih
%               kvadratov  najbolje  prilega  podatkom



% imamo l ena�b in (m+1)*(n+1) neznank (bij)
% Vsako dimenzijo minimiziramo posebej. 
% neznanke imamo urejene tako b00, b10, b20, .. bm0, b01, b11, b21 ... 

% X koordinata

[XD,YD] = size(P);
L = XD;

Ax = zeros(L, (n+1)*(m+1));
b = P(:,1);

for k=1:L
    for j=0:n
        for i=0:m
            % Faktorji pred neznankami so bim(uk)*bjn(vk)
            % B_i^m (uk)
            bim = factorial(m)/factorial(i)/factorial(m-i) * (u(k)^i) * (1-u(k))^(m-i);
            bjn = factorial(n)/factorial(j)/factorial(n-j) * (v(k)^j) * (1-v(k))^(n-j);
            Ax(k, j*(m+1) + i + 1) = bim*bjn;
        end
    end
end

bxsolution = Ax\b;

Bx = reshape(bxsolution, m+1,n+1)';

% Y koordinata

Ay = zeros(L, (n+1)*(m+1));
b = P(:,2);

for k=1:L
    for j=0:n
        for i=0:m
            % B_i^m (uk)
            bim = factorial(m)/factorial(i)/factorial(m-i) * (u(k)^i) * (1-u(k))^(m-i);
            bjn = factorial(n)/factorial(j)/factorial(n-j) * (v(k)^j) * (1-v(k))^(n-j);
            Ay(k, j*(m+1) + i + 1) = bim*bjn;
        end
    end
end

bysolution = Ay\b;

By = reshape(bysolution, m+1,n+1)';

% Z koordinata

Az = zeros(L, (n+1)*(m+1));
b = P(:,3);

for k=1:L
    for j=0:n
        for i=0:m
            % B_i^m (uk)
            bim = factorial(m)/factorial(i)/factorial(m-i) * (u(k)^i) * (1-u(k))^(m-i);
            bjn = factorial(n)/factorial(j)/factorial(n-j) * (v(k)^j) * (1-v(k))^(n-j);
            Az(k, j*(m+1) + i + 1) = bim*bjn;
        end
    end
end

bzsolution = Az\b;

Bz = reshape(bzsolution, m+1,n+1)';

end




