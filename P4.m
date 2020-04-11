%Practica 4 Filtros espaciales
clc;
clear all;
close all;


%Imagen original 
 original = imread('lena.png');


%%%%%%%%%%%%%%%%%%%Punto 1, imagen sin ruido e imagen con ruido%%%%%%%%%%%% 

%imagen sin ruido
figure('Name','Punto 1');
subplot(2,3,1);
imagesc(original);
colormap(gray);
title('Imagen sin ruido');

%imagen con diferentes tipos de ruido 

%Imagen con ruido gaussiano
G = imnoise(original,'gaussian'); 
subplot(2,3,2);
imagesc(G);
colormap(gray);
title('Imagen con ruido gaussiano');

%Imagen con ruido localvar
L = imnoise(original,'localvar',0.08*rand(size(original))); 
subplot(2,3,3);
imagesc(L);
colormap(gray);
title('Imagen con ruido localvar');

%Imagen con ruido poisson
P = imnoise(original,'poisson'); 
subplot(2,3,4);
imagesc(P);
colormap(gray);
title('Imagen con ruido poisson');

%Imagen con ruido salt & pepper
SP = imnoise(original,'salt & pepper'); 
subplot(2,3,5);
imagesc(SP);
colormap(gray);
title('Imagen con ruido salt & pepper');

%Imagen con ruido speckle
S = imnoise(original,'speckle'); 
subplot(2,3,6);
imagesc(S);
colormap(gray);
title('Imagen con ruido speckle');


%%%%%%%%%%%%%%%%Punto 2 filtro paso bajas de bloque%%%%%%%%%%%%%%%%%%%%%%%%

figure('Name','Punto 2');
filtro3 = ones(3,3)/(9*9); %filtro 3x3
filtro5 = ones(5,5)/(25*25); %filtro 5x5
filtro7 = ones(7,7)/(49*49); %filtro 7x7
filtro11 = ones(11,11)/(121*121); %filtro 11x11



%%%%%%%%%%%%%%%%%%%%%%Filtros convolucion a imagen sin ruido

%Filtro 3x3 Imagen sin ruido
F3S = conv2(original,filtro5,'full'); %con argumento full 3x3
subplot(2,4,1);
imagesc(F3S);
colormap(gray);
title('Filtro 3x3 Imagen sin ruido')

%Filtro 5x5 Imagen sin ruido
F5S = conv2(original,filtro5,'full'); %con argumento full 5x5
subplot(2,4,2);
imagesc(F5S);
colormap(gray);
title('Filtro 5x5 Imagen sin ruido')

%Filtro 7x7 Imagen sin ruido
F7S = conv2(original,filtro7,'full'); %con argumento full 7x7
subplot(2,4,3);
imagesc(F7S);
colormap(gray);
title('Filtro 7x7 Imagen sin ruido');

%Filtro 11x11 Imagen sin ruido
F11S = conv2(original,filtro11,'full'); %con argumento full 11x11
subplot(2,4,4);
imagesc(F11S);
colormap(gray);
title('Filtro 11x11 Imagen sin ruido');




%%%%%%%%%%%%%%%%%%%%%%Filtros convolucion a imagen con ruido


%Filtro 3x3
F3 = conv2(SP,filtro5,'full'); %con argumento full 3x3
subplot(2,4,5);
imagesc(F3);
colormap(gray);
title('Imagen filtrada  convolucion 3x3')

%Filtro 5x5
F5 = conv2(SP,filtro5,'full'); %con argumento full 5x5
subplot(2,4,6);
imagesc(F5);
colormap(gray);
title('Imagen filtrada  convolucion 5x5')

%Filtro 7x7
F7 = conv2(SP,filtro7,'full'); %con argumento full 7x7
subplot(2,4,7);
imagesc(F7);
colormap(gray);
title('Imagen filtrada  convolucion 7x7');

%Filtro 11x11
F11 = conv2(SP,filtro11,'full'); %con argumento full 11x11
subplot(2,4,8);
imagesc(F11);
colormap(gray);
title('Imagen filtrada  convolucion 11x11');




%%%%%%%%%%%%%%%%%%%%%Punto 3 filtros paso bajas binomiales 3x3, 5x5, 7x7 y 11x11.%%%%%%%%%%%%%%%%%

figure('Name','Punto 3');

binomial3 = (1/16)*([1 2 1]' * [1 2 1]);%Filtro binomial 3x3
binomial5 = (1/256)*([1 4 6 4 1]' * [1 4 6 4 1]);%Filtro binomial 5x5
binomial7 = (1/4096)*([1 6 15 20 15 6 1].' * [1 6 15 20 15 6 1]);%filtro binomial 7x7
binomial11 = (1/1048576)*([1 10 45 120 210 252 210 120 45 10 1]' * [1 10 45 120 210 252 210 120 45 10 1]); %filtro binomial 11x11


%Aplicacion de filtro Imagen sin ruido 3x3
B3S = conv2(original,binomial3,'full'); 
subplot(2,4,1);
imagesc(B3S);
colormap(gray)
title('Imagen sin ruido binomial 3x3')

%Aplicacion de filtro Imagen sin ruido 5x5
B5S = conv2(original,binomial5,'full'); 
subplot(2,4,2);
imagesc(B5S);
colormap(gray)
title('Imagen sin ruido binomial 5x5')

%Aplicacion de filtro Imagen sin ruido 7x7
B7S = conv2(original,binomial7,'full'); 
subplot(2,4,3);
imagesc(B7S);
colormap(gray)
title('Imagen sin ruido binomial 7x7')

%Aplicacion de filtro Imagen sin ruido 11x11
B11S = conv2(original,binomial11,'full'); 
subplot(2,4,4);
imagesc(B11S);
colormap(gray)
title('Imagen sin ruido binomial 11x11')



%Aplicacion de filtro Imagen con ruido 3x3
B3C = conv2(G,binomial3,'full'); 
subplot(2,4,5);
imagesc(B3C);
colormap(gray)
title('Imagen con ruido binomial 3x3')

%Aplicacion de filtro Imagen con ruido 5x5
B5C = conv2(G,binomial5,'full'); 
subplot(2,4,6);
imagesc(B5C);
colormap(gray)
title('Imagen con ruido binomial 5x5')

%Aplicacion de filtro Imagen con ruido 7x7
B7C = conv2(SP,binomial7,'full'); 
subplot(2,4,7);
imagesc(B7C);
colormap(gray)
title('Imagen con ruido binomial 7x7')

%Aplicacion de filtro Imagen con ruido 11x11
B11C = conv2(G,binomial11,'full'); 
subplot(2,4,8);
imagesc(B11C);
colormap(gray)
title('Imagen con ruido binomial 11x11')





%%%%%%%%%%%%%%%%%%%%%Punto 4 filtros detectores de bordes%%%%%%%%%%%%%%%%%%



%a) De bloque [1 -1]
figure('Name','Punto 4 filtros detectores de bordes a)');


%b) Prewitt en la direccion X & Y 
figure('Name','Punto 4 filtros detectores de bordes b)');

FPX = [-1 0 1;-1 0 1;-1 0 1]; %Filtro prewitt 3x3 direccion X
FPY = [-1 -1 -1;0 0 0;1 1 1]; %Filtro perwitt 3x3 direccion Y


%Imagen sin ruido filtro prewitt direccion X

FPXS = conv2(original,FPX,'full'); 
subplot(2,2,1);
imagesc(FPXS);
colormap(gray)
title('Imagen sin ruido Prewitt en X')

%Imagen sin ruido filtro prewitt direccion Y
FPYS = conv2(original,FPY,'full'); 
subplot(2,2,2);
imagesc(FPYS);
colormap(gray)
title('Imagen sin ruido Prewitt en Y')

%Imagen Con ruido filtro prewitt direccion X
FPXC = conv2(G,FPX,'full'); 
subplot(2,2,3);
imagesc(FPXC);
colormap(gray)
title('Imagen con ruido Prewitt en X')

%Imagen Con ruido filtro prewitt direccion Y
FPYC = conv2(G,FPY,'full'); 
subplot(2,2,4);
imagesc(FPYC);
colormap(gray)
title('Imagen con ruido Prewitt en Y')


%c) Sobel en la direccion X & Y
figure('Name','Punto 4 filtros detectores de bordes c)');

FSX = ([]*[]);%Filtro Sobel en X
FSY = ([]*[]);%Filtro SObel en Y

%Imagen sin ruido filtro sobel direccion X
FSXS = conv2(original,FSX,'full'); 
subplot(2,2,1);
imagesc(FSXS);
colormap(gray)
title('Imagen sin ruido Sobel en X')

%Imagen sin ruido filtro sobel direccion Y
FSYS = conv2(original,FSY,'full'); 
subplot(2,2,1);
imagesc(FSYS);
colormap(gray)
title('Imagen sin ruido Sobel en Y')

%Imagen Con ruido filtro sobel direccion X

FSXC = conv2(G,FSX,'full'); 
subplot(2,2,1);
imagesc(FSXC);
colormap(gray)
title('Imagen con ruido Sobel en X')

%Imagen Con ruido filtro sobel direccion Y
FSYC = conv2(G,FSY,'full'); 
subplot(2,2,1);
imagesc(FSYC);
colormap(gray)
title('Imagen con ruido Sobel en Y')


%d) Primera derivada gaussiana 5x5 7x7 11x11
figure('Name','Punto 4 filtros detectores de bordes c)');




%%%%%%%%%%Punto 5 Filtros basados en la segunda derivada gaussiana %%%%%%%%

%a) Laplaciano 

figure('Name','Punto 5 a) Laplaciano');

FL = [-1 -1 -1;-1 8 -1;-1 -1 -1]; %Filtro laplaciano

%Filtro laplaciano a imagen sin ruido
FLS = conv2(original,FL,'full'); 
subplot(1,2,1);
imagesc(FLS);
colormap(gray)
title('Imagen sin ruido Laplaciano')

%filtro laplaciano a imagen con ruido
FLC = conv2(G,FL,'full'); 
subplot(1,2,2);
imagesc(FLC);
colormap(gray)
title('Imagen con ruido Laplaciano')

%b) Segunda derivada Gaussiana 5x5 7x7 11x11



%%%%%%%%%Punto 6 Difuminar imagenes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






