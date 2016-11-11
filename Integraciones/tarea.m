%Tarea 5 Integracion
%Métodos Numéricos
%Autores:
% Santiago Valencia   A01206738
% Carla Herrera       A01203635
%
%Datos de entrada:
% N/A
%Datos de salida:
%
%
% IDEK
%
%

clear all
close all
clc
Xs = [0 2 4 6 8 10 12 14 16 18 20];
Ys = [0 1.8 2 4 4 6 4 3.6 3.4 2.8];
a = 0;
b = 20;
%cálculo de la integral de matlab:
real = (quadl(fun, a, b)
%gráfica de la función:
plot(Xs, Ys, 'o')
hold on
%gráfica de la primera línea del trapecio:
plot([a a],[0 Ys(0)],'g') 
hold on

n = 20; %input('dime el numero de aplicaciones que buscas: ');
integral = zeros(n,1);

%vector con los n+1 intervalos de a a b
x = linspace(a, b, n+1);
for i=1:n
 a = x(i);
 b = x(i+1);
 %gráfica de las barras
 plot([Xs(i) (Xs(i)],[0 Ys(i)],'g')
 hold on
 %gráficas de los trapecios:
 plot([a b],[fun(a) fun(b)], 'g')
 hold on
 base = b-a;
 alturaProm = (fun(a) + fun(b))/2;  
 integral(i) = base*alturaProm;
end
hold off

I = sum(integral);
ERPa = abs((real - I)/real)*100;