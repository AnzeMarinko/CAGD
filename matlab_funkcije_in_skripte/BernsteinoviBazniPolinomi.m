% nariši bernsteinove bazne
% polinome stopnje n
n = 5;
x = 0:0.01:1;

for i=0:n
    % zgeneriramo vsak Bernsteinov bazni polinom
    b = zeros(1,n+1);
    b(i+1) = 1;
    % polinom prevedemo v potenènega in ga izvrednotimo
    % za izris
    y = polyval(bernstein2power(b), x);
    % polinom narišemo
    plot(x,y)
    hold on
end