function b = bernsteinovaAproksimacija( f, n )
% bernsteinovaAproksimacija vrne Bernsteinovo aproksimacijo
% funkcije f v n+1 toèkah
%   b = bernsteinovaAproksimacija( f, n ) ... koeficienti
% Bernsteinovega polinoma n-te stopnje
% npr. f = @(x) x.^2, n = 10

b = f(0:(1/n):1)
end