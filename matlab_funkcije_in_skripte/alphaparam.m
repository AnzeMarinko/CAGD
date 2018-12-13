function u = alphaparam (P,a)
% Opis :
% alphaparam sestavi alfa parametrizacijo oziroma delitev
% domene na podlagi podanih tock
%
% Definicija :
% u = alphaparam (P, alpha )
%
% Vhodna podatka :
% P matrika z m+1 vrsticami , v kateri vsaka vrstica
% predstavlja eno tocko ,
% a parameter , ki doloca alfa parametrizacijo
%
% Izhodni podatek :
% u seznam parametrov delitve , ki so doloceni rekurzivno
% tako , da se trenutnemu parametru iz seznama u
% prišteje z a potencirana norma razlike zaporednih
% tock iz seznama P
m = size(P,1)-1;
u = zeros(m+1,1);
for i = 2:m+1
    u(i) = u(i-1) + sum((P(i,:)-P(i-1,:)).^2)^(a/2);
end
% Ce izberemo a = 0, dobimo enakomerno parametrizacijo, ki je neodvisna 
% od podatkov. Izbiri a = 1 in a = 1/2 vodita k tetivni in centripetalni
% parametrizaciji.
end

