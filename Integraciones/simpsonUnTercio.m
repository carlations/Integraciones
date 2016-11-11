% Programa para calcular la integral definida mediante la de regla de
% Simpson 1/3
%
% Fecha de ultima revision: 10/11/16
% Santiago Valencia A01206738
%
% Datos de entrada: 
% -- Funcion
% -- Intervalos
%
% Datos de salida:
% -- Integral definida
% -- Error relativo porcentual aproximado
% -- Tiempo

clear all
close all
clc



% Funcion
f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;

% Extremos
a=0;
b=0.8;

% Grafica de la funcion
x1 = linspace(a,b);
y1 = f(x1);
plot(x1, y1)
hold on

% Trampa
real = quadl(f, a,b)

n = input('Dame el numero de aplicaciones: ')
I = zeros(2*n,12);
x= linspace(a, b, 2*n+1);

% Grafica de la primer barra vertical
plot([a a],[0 f(a)],'k')
hold on

for i=1:2:(2*n)
    a = x(i);
    b = x(i+2);
    c = x(i+1);
    base = b-a;

    
    alturaProm = (f(a) + 4*f(c) + f(b))/6;
    I(i) = base * alturaProm;
    
    % Grafica de las barras derechas
    plot([b b],[0 f(b)],'k')
    hold on
    
    % Grafica de las barras centrales
    plot([c c],[0 f(c)],'g')
    hold on
    
    % Grafica del 'techo' (poly grado dos)
    A=[a c b; f(a) f(c) f(b)]';
    x2 = linspace(a,b);
    for k =1:100
        L = ones(3, 1);

        for p =1:3
         for j=1:3
               if p ~= j
                 L(p) = L(p)*((x2(k)-A(j,1))/(A(p,1)-A(j,1)));
               end
         end
        end
        Yaprox(k) = sum(L.*A(:,2));
    end
    
    plot(x2, Yaprox, 'm')
    
end

Integral = sum(I)

ERPa = abs((real-Integral)/real)*100
