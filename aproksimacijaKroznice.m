% aproksimacija krožnice s k Bezierjevimi krivuljami
k = 6;
fi = pi/k;
t = 0:0.01:1;
rotacijskaMatrika = [cos(2*fi) -sin(2*fi); sin(2*fi) cos(2*fi)];

% aproksimacija pri n=2
n = 2;
B = [cos(fi) -sin(fi); 1/cos(fi) 0; cos(fi) sin(fi)];
for i = 1:k
    b = bezier(B,t);
    plot(b(1,:),b(2,:),'b')
    hold on
    B = B*rotacijskaMatrika;
end
% napaka
max(abs(1-power(power(b(1,:),2)+power(b(2,:),2),1/2)))

% aproksimacija pri n=3
n = 3;
B = [cos(fi), -sin(fi);
    cos(fi)+1/n*sin(fi), -sin(fi)+1/n*cos(fi);
    cos(fi)+1/n*sin(fi), sin(fi)-1/n*cos(fi);
    cos(fi), sin(fi)];
for i = 1:k
    b = bezier(B,t);
    plot(b(1,:),b(2,:),'r')
    hold on
    B = B*rotacijskaMatrika;
end
% napaka
max(abs(1-power(power(b(1,:),2)+power(b(2,:),2),1/2)))

% popravljena aproksimacija pri n=3
n = 3;
B = [cos(fi), -sin(fi);
    4/3-cos(fi)/3, 4*cot(fi)/3-4/sin(fi)/3+sin(fi)/3;
    4/3-cos(fi)/3, -4*cot(fi)/3+4/sin(fi)/3-sin(fi)/3;
    cos(fi), sin(fi)];
for i = 1:k
    b = bezier(B,t);
    plot(b(1,:),b(2,:),'g')
    hold on
    B = B*rotacijskaMatrika;
end
% napaka
max(abs(1-power(power(b(1,:),2)+power(b(2,:),2),1/2)))

% krožnica
plot(cos(0:0.01:2*pi),sin(0:0.01:2*pi),'y')