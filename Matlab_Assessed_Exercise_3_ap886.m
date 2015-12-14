%Plotting the Mesh Plot of Orbitals


%%
%Create Meshgrid for plotting
[X,Y] = meshgrid (-5:.5:5);


%%
%Helper Functions and Orbitals themselves

E = exp (-sqrt(X.^2+Y.^2+0));
Px = X.* E;
dxy = X.* Y.*E;

%%
%Plotting using mesh
%P_x
figure;

u=linspace (-5,5,21);
v=linspace (-5,5,21);
%We want the plot to agree to the coordinates
mesh (u,v,Px);
grid on;
set(gca,'fontsize',14,'linewidth',1);
xlabel('x');ylabel('y');zlabel('Probability Amplitude');

%%
%Printing to file.
print -dsvg 1P_x.svg;

%%
%Plotting using surf
%dxy
figure
surf(u,v,dxy);
grid on;
set(gca,'xlim',[-5 5]); 
set(gca,'ylim',[-5  5]); 
set(gca,'zlim',[-0.4 0.4])
view(-134,68);
set(gca,'fontsize',14,'linewidth',1);
xlabel('x');ylabel('y');zlabel('Probability Amplitude');
%%
%Printing to file
print -dsvg 1dxy.svg;

%%
%Plotting 
%P_x
figure;
contour (Px);
grid on;
set(gca,'fontsize',14,'linewidth',1);
xlabel('x');ylabel('y');zlabel('Probability Amplitude');

%%
%Printing to file.
print -dsvg 2P_x_Contour.svg;

%%
%Plotting using surf
%dxy
figure
contour(u,v,dxy);
grid on;
set(gca,'xlim',[-5 5]); 
set(gca,'ylim',[-5 5]); 
set(gca,'zlim',[-0.4 0.4])
set(gca,'fontsize',14,'linewidth',1);
xlabel('x');ylabel('y');zlabel('Probability Amplitude');
%%
%Printing to file
print -dsvg 2dxy_Contour.svg;

%%
%Plotting along the Diagonal
figure

%Takes the Diagonal Matrix that contains 
%All of the values of dxy along its diagonal.
f = diag(dxy);
plot(u.*sqrt(2),f);
%Need to re-scale the independent variable to 
%agree with length along the direction

%If we needed to plot along an arbitrary 
%direction we'd have to define a new linspace 
%and a new function.

grid on;
set(gca,'xlim',[-5*sqrt(2) 5*sqrt(2)]); 
set(gca,'ylim',[0 0.4]); 
set(gca,'fontsize',14,'linewidth',1);
xlabel('x=y');ylabel('Probability Amplitude');

%%
%pirnting to file
print -dsvg 4dxy_along_diagonal.svg;

%%
%Obtaining differential
figure
df = diff (f);
U= linspace (-5,5,20);
fprime = df./ (sqrt(2)*0.5); %The vector fprime is shorter
plot(U.*sqrt(2),fprime);grid on;
set(gca,'xlim',[-5*sqrt(2) 5*sqrt(2)]); 
set(gca,'ylim',[-0.2 0.2]); 
set(gca,'fontsize',14,'linewidth',1);
xlabel('x=y');ylabel('Differential of Probability Amplitude');
%%
%pirnting to file
print -dsvg 5Differential.svg;

