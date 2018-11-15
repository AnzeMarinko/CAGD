P = [-4 1; -2 -1; 0 3; 3 0; 5 2];
ue = alphaparam (P ,0); % [0 1 2 3 4]
uc = alphaparam (P ,0.5); % [0 1.6818 3.7965 5.8563 7.5381]
ut = alphaparam (P ,1); % [0 2.8284 7.3006 11.5432 14.3716]

D = [-5 0; -4 1; -2 -1; 0 3; 3 0; 5 2; 7 -1];
plot(D);
hold on;
for a = 0:0.5:1
    u = alphaparam (D ,a);
    bs = beziercubspline(u, D);
    for i = 1:size(bs,2)
        plotbezier(bs{i},0:0.01:1)
    end
end
