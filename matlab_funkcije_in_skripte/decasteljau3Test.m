% koeficienti polinoma
B = [2 5 -1 0; 1 3 -4 NaN; 0 0 NaN NaN; 1 NaN NaN NaN];
% trikotnik T
T = [0 5 3; 0 1 3];
% tocke, kjer racunamo vrednost
p1 = [0; 0];
p2 = [1; 1];
p3 = [4; 2];
% baricentricne koordinate teh tock
u1 = pointbary(p1, T);
u2 = pointbary(p2, T);
u3 = pointbary(p3, T);

% vrednost polinoma v teh tockah
decasteljau3(B, u1);
decasteljau3(B, u2);
decasteljau3(B, u3);

% odvodi
n = size(B,1)-1;
x = vectorbary( [1;0],T );
y = vectorbary( [0;1],T );

% v tocki p1
U = ones(3,n);
U(1,:) = U(1,:)*u1(1);
U(2,:) = U(2,:)*u1(2);
U(3,:) = U(3,:)*u1(3);
U(:,1) = x;
Dx = n * blossom3(B, U);
U(:,1) = y;
Dy = n * blossom3(B, U);
U(:,1:2) = [x x];
Dxx = n*(n-1) * blossom3(B, U);
U(:,2) = y;
Dxy = n*(n-1) * blossom3(B, U);
U(:,1) = y;
Dyy = n*(n-1) * blossom3(B, U);

% v tocki p2
U = ones(3,n);
U(1,:) = U(1,:)*u2(1);
U(2,:) = U(2,:)*u2(2);
U(3,:) = U(3,:)*u2(3);
U(:,1) = x;
Dx = n * blossom3(B, U);
U(:,1) = y;
Dy = n * blossom3(B, U);
U(:,1:2) = [x x];
Dxx = n*(n-1) * blossom3(B, U);
U(:,2) = y;
Dxy = n*(n-1) * blossom3(B, U);
U(:,1) = y;
Dyy = n*(n-1) * blossom3(B, U);

% v tocki p3
U = ones(3,n);
U(1,:) = U(1,:)*u3(1);
U(2,:) = U(2,:)*u3(2);
U(3,:) = U(3,:)*u3(3);
U(:,1) = x;
Dx = n * blossom3(B, U);
U(:,1) = y;
Dy = n * blossom3(B, U);
U(:,1:2) = [x x];
Dxx = n*(n-1) * blossom3(B, U);
U(:,2) = y;
Dxy = n*(n-1) * blossom3(B, U);
U(:,1) = y;
Dyy = n*(n-1) * blossom3(B, U);
