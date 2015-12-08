[X,Y] = meshgrid(-8:.5:8);
R = exp(-sqrt(X.^2 + Y.^2)) + eps;

Z1 = X.*R;
Z2 = X.*Y.*R;
figure
mesh(Z1);
figure
mesh(Z2);
figure
contour(Z1);
figure
contour(Z2);
figure
%%TODO PLot along x=y

%%TODO Plot Obtain derivative along the x=y direction and plot
plot();