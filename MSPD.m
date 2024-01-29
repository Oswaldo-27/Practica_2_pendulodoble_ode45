function dx=MSPD(t,x)
%----Definición de nuestros parametros----%
m1=0.2;
l1=0.3;
m2=0.1;
l2=0.25;
g=9.81;
c1=0.2;
%----Creamos nuestra matriz de variables de estado----%
dx=zeros(4,1);
%----Creamos nuestras matrices----%
M=[(m1+m2)*l1 m2*l2*cos(x(2)-x(1));l1*cos(x(2)-x(1)) l2];
C=[c1 -m2*l2*x(4)*sin(x(2)-x(1));l1*x(3)*sin(x(2)-x(1)) 0];
G=[(m1+m2)*g*sin(x(1));g*sin(x(2))];
%----Definición dinamica del sistema (espacios de estado)----%
dx(1)=x(3);
dx(2)=x(4);
dx(3:4)=inv(M)*(-C*[x(3);x(4)]-G);
%-------------------------------------------------------------%