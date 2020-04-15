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
filtro3 = ones(3,3)/(3*3); %filtro 3x3
filtro5 = ones(5)/(5*5); %filtro 5x5
filtro7 = ones(7)/(7*7); %filtro 7x7
filtro11 = ones(11)/(11*11); %filtro 11x11



%%%%%%%%%%%%%%%%%%%%%%Filtros  a imagen sin ruido

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




%%%%%%%%%%%%%%%%%%%%%%Filtros  a imagen con ruido


%Filtro 3x3
F3 = conv2(SP,filtro5,'full'); %con argumento full 3x3
subplot(2,4,5);
imagesc(F3);
colormap(gray);
title('Filtro 3x3 Imagen con ruido ruido')

%Filtro 5x5
F5 = conv2(SP,filtro5,'full'); %con argumento full 5x5
subplot(2,4,6);
imagesc(F5);
colormap(gray);
title('Filtro 5x5 Imagen con ruido ruido')

%Filtro 7x7
F7 = conv2(SP,filtro7,'full'); %con argumento full 7x7
subplot(2,4,7);
imagesc(F7);
colormap(gray);
title('Filtro 7x7 Imagen con ruido ruido');

%Filtro 11x11
F11 = conv2(SP,filtro11,'full'); %con argumento full 11x11
subplot(2,4,8);
imagesc(F11);
colormap(gray);
title('Filtro 11x11 Imagen con ruido ruido');




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


B34 = [1 -1];

%imagen sin ruido 
FB34S = conv2(original,B34,'full'); 
subplot(1,2,1);
imagesc(FB34S);
colormap(gray)
title('Filtro bloque [1 -1] sin ruido ')

%imagen con ruido 
FB34C = conv2(G,B34,'full'); 
subplot(1,2,2);
imagesc(FB34C);
colormap(gray)
title('Filtro bloque [1 -1] con ruido ')


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

FSX = ([1 2 1]' *  [ 1 0 -1]);%Filtro Sobel en X
FSY = ([1 0 -1]' * [1 2 1]);%Filtro SObel en Y

%Imagen sin ruido filtro sobel direccion X
FSXS = conv2(original,FSX,'full'); 
subplot(2,2,1);
imagesc(FSXS);
colormap(gray)
title('Imagen sin ruido Sobel en X')

%Imagen sin ruido filtro sobel direccion Y
FSYS = conv2(original,FSY,'full'); 
subplot(2,2,2);
imagesc(FSYS);
colormap(gray)
title('Imagen sin ruido Sobel en Y')

%Imagen Con ruido filtro sobel direccion X

FSXC = conv2(G,FSX,'full'); 
subplot(2,2,3);
imagesc(FSXC);
colormap(gray)
title('Imagen con ruido Sobel en X')

%Imagen Con ruido filtro sobel direccion Y
FSYC = conv2(G,FSY,'full'); 
subplot(2,2,4);
imagesc(FSYC);
colormap(gray)
title('Imagen con ruido Sobel en Y')


%d) Primera derivada gaussiana 5x5 7x7 11x11

figure('Name','Punto 4 Primera derivada gaussiana d)');

%Filtro 5x5 primera derivada
FPD5 = [1 4 6 4 1]' * [1 2 0 -2 -1];
%Filtro 7x7 primera derivada
FPD7 = [1 6 15 20 15 6 1]' * [1 4 5 0 -5 -4 -1];
%Filtro 11x11 primera derivada
FPD11 = [1 10 45 120 210 252 210 120 45 10 1]' * [1 8 27 48 42 0 -42 -48 -27 -8 -1];

%Imagen sin ruido filtro 5x5 primera derivada gaussiana
FPD5S = conv2(original,FPD5,'full'); 
subplot(2,3,1);
imagesc(FPD5S);
colormap(gray)
title('Filtrado sin ruido primera derivada gaussiana 5x5')

%Imagen sin ruido filtro 7x7 primera derivada gaussiana
FPD7S = conv2(original,FPD7,'full'); 
subplot(2,3,2);
imagesc(FPD7S);
colormap(gray)
title('Filtrado sin ruido primera derivada gaussiana 7x7')

%Imagen sin ruido filtro 11x11 primera derivada gaussiana
FPD11S = conv2(original,FPD11,'full'); 
subplot(2,3,3);
imagesc(FPD11S);
colormap(gray)
title('Filtrado sin ruido primera derivada gaussiana 11x11')

%Imagen con ruido filtro 5x5 primera derivada gaussiana
FPD5C = conv2(G,FPD5,'full'); 
subplot(2,3,4);
imagesc(FPD5C);
colormap(gray)
title('Filtrado con ruido primera derivada gaussiana 5x5')

%Imagen con ruido filtro 7x7 primera derivada gaussiana
FPD7C = conv2(G,FPD7,'full'); 
subplot(2,3,5);
imagesc(FPD7C);
colormap(gray)
title('Filtrado con ruido primera derivada gaussiana 7x7')

%Imagen con ruido filtro 11x11 primera derivada gaussiana
FPD11C = conv2(G,FPD11,'full'); 
subplot(2,3,6);
imagesc(FPD11C);
colormap(gray)
title('Filtrado con ruido primera derivada gaussiana 11x11')

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

figure('Name','Punto 5 b) Segunda Derivada');

%Filtro 5x5 Segunda derivada gaussiana 
F5 = ones(5,5)*(-1); 
F5(3,3) = 24;
FSDG5 = F5 ;
%Filtro 7x7 Segunda derivada gaussiana 
F7 = ones(7,7)*(-1); 
F7(4,4) = 49;
FSDG7 = F7 ;
%Filtro 11x11 Segunda derivada gaussiana 
F11 = ones(11,11)*(-1); 
F11(6,6) = 120;
FSDG11 = F11 ;

%Filtro 5x5 Segunda Derivada Gaussina a imagen sin ruido
FSDGS5 = conv2(original,FSDG5,'full'); 
subplot(2,3,1);
imagesc(FSDGS5);
colormap(gray)
title('Filtro 5x5 segunda derivada sin ruido')

%Filtro 7x7 Segunda Derivada Gaussina a imagen sin ruido
FSDGS7 = conv2(original,FSDG7,'full'); 
subplot(2,3,2);
imagesc(FSDGS7);
colormap(gray)
title('Filtro 7x7 segunda derivada sin ruido')

%Filtro 11x11 Segunda Derivada Gaussina a imagen sin ruido
FSDGS11 = conv2(original,FSDG11,'full'); 
subplot(2,3,3);
imagesc(FSDGS11);
colormap(gray)
title('Filtro 11x11 segunda derivada sin ruido')

%Filtro 5x5 Segunda Derivada Gaussina a imagen con ruido
FSDGC5 = conv2(G,FSDG5,'full'); 
subplot(2,3,4);
imagesc(FSDGC5);
colormap(gray)
title('Filtro 5x5 segunda derivada con ruido')

%Filtro 7x7 Segunda Derivada Gaussina a imagen con ruido
FSDGC7 = conv2(G,FSDG7,'full'); 
subplot(2,3,5);
imagesc(FSDGC7);
colormap(gray)
title('Filtro 7x7 segunda derivada con ruido')

%Filtro 11x11 Segunda Derivada Gaussina a imagen con ruido
FSDGC11 = conv2(G,FSDG11,'full'); 
subplot(2,3,6);
imagesc(FSDGC11);
colormap(gray)
title('Filtro 11x11 segunda derivada con ruido')



%%%%%%%%%Punto 6 Difuminar imagenes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure('Name','Punto 6 a) paso bajas bloque');


%a)filtro paso bjas de bloque 3x3 y 7x7

%Filtro 3x3 bloque con unsharp masking (UM)
%hUM(x,y) = (1+k)?(x,y)?khPB(x,y)
k3=3;
UMZ3 = zeros(3); 
UMZ3(2,2) = (1+k3);%(1+k)?(x,y
UMPB3 = (k3/(3*3)) * ones(3);%khPB(x,y)
UMF3 = UMZ3 - UMPB3; %Filtro 3x3 paso bajas de bloque con UM

%Filtro 7x7 bloque con unsharp masking (UM)
%hUM(x,y) = (1+k)?(x,y)?khPB(x,y)
k7=1;
UMZ7 = zeros(7); 
UMZ7(4,4) = (1+k7);%(1+k)?(x,y
UMPB7 = (k7/(7*7)) * ones(7);%khPB(x,y)
UMF7 = UMZ7 - UMPB7; %Filtro 7x7 paso bajas de bloque con UM

%Imagen sin ruido filtro 3x3
UMS3 = conv2(original,UMF3,'full'); 
subplot(2,2,1);
imagesc(UMS3);
colormap(gray)
title('Imagen 3x3 unsharp masking sin ruido');

%Imagen sin ruido filtro 7x7
UMS7 = conv2(original,UMF7,'full'); 
subplot(2,2,2);
imagesc(UMS7);
colormap(gray)
title('Imagen 7x7 unsharp masking sin ruido')

%Imagen con ruido filtro 3x3
UMC3 = conv2(G,UMF3,'full'); 
subplot(2,2,3);
imagesc(UMC3);
colormap(gray)
title('Imagen 3x3 unsharp masking con ruido')

%Imagen con ruido filtro 7x7
UMC7 = conv2(G,UMF7,'full'); 
subplot(2,2,4);
imagesc(UMC7);
colormap(gray)
title('Imagen 7x7 unsharp masking con ruido')



%b)filtro paso bjas de binomial 3x3 y 7x7

figure('Name','Punto 6 b) paso bajas binomial');

%Filtro 3x3 binomial con unsharp masking (UM)
%hUM(x,y) = (1+k)?(x,y)?khPB(x,y)
kB3=1;
UMBZ3 = zeros(3); 
UMBZ3(2,2) = (1+kB3);%(1+k)?(x,y
UMB3 = (1/16)*([1 2 1]' * [1 2 1]); %khPB(x,y)
UMFB3 = UMBZ3 - UMB3; %Filtro 3x3 paso bajas de bloque con UM

%Filtro 7x7 binomial con unsharp masking (UM)
%hUM(x,y) = (1+k)?(x,y)?khPB(x,y)
kB7=1;
UMBZ7 = zeros(7); 
UMBZ7(2,2) = (1+kB7);%(1+k)?(x,y
UMB7 = (1/4096)*([1 6 15 20 15 6 1].' * [1 6 15 20 15 6 1]); %khPB(x,y)
UMFB7 = UMBZ7 - UMB7; %Filtro 3x3 paso bajas de bloque con UM




%Imagen sin ruido filtro 3x3 binomial con UM
UMBS3 = conv2(original,UMFB3,'full'); 
subplot(2,2,1);
imagesc(UMBS3);
colormap(gray)
title('Filtro binomial 3x3 unsharp masking sin ruido');

%Imagen sin ruido filtro 7x7 binomial con UM
UMBS7 = conv2(original,UMFB7,'full'); 
subplot(2,2,2);
imagesc(UMBS7);
colormap(gray)
title('Filtro binomial 7x7 unsharp masking sin ruido');

%Imagen con ruido filtro 3x3 binomial con UM
UMBC3 = conv2(G,UMFB3,'full'); 
subplot(2,2,3);
imagesc(UMBC3);
colormap(gray)
title('Filtro binomial 3x3 unsharp masking con ruido');

%Imagen con ruido filtro 7x7 binomial con UM
UMBC7 = conv2(G,UMFB7,'full'); 
subplot(2,2,4);
imagesc(UMBC7);
colormap(gray)
title('Filtro binomial 7x7 unsharp masking con ruido');


