A=0:0.1:2;
B=ones(21,1);
%punctul a)
A*B
%punctul b)
B*A

%Punctul c) 

%inmultirea element cu element se realizeaza doar intre 
%elementele a doua matrice de aceleasi dimensiuni. Astfel nu se poate
%realiza inmultirea element cu element intre matricea A si B
-------------------------
T1_E2_Razvan_Craciunescu.m
a(1:20)=randn(1,20);
for i=1:20
    if(a(i)<0)
        a(i)
    end
end
T1_E3_Generare_vector_Razvan_Craciunescu.m
numarElemente = 3;
vectorRandom =  exp(2i*pi*rand(numarElemente,1) + 1);
[ma square matrice] = T1_E3_Razvan_Craciunescu(vectorRandom)
------------------------
T1_E3_Razvan_Craciunescu.m
function [ma square matrice] = T1_E3_Razvan_Craciunescu(vector)
    ma = real(sum(vector)) / length(vector);
    square = vector .^2;
    matrice = vector * vector';
---------------------------
T1_EX1_semnal_dreptunghiular_Razvan_Craciunescu.m

Frecventa = 2 * (10^-3);%frecventa semnalului
timp = 0 : Frecventa : 20;
Perioada = 2;


pulsewidth = 0.25 * Perioada;%stabilim factorul de umplere

pulseperiods = [0:10] * Perioada;%stabilim numarul de perioade


x = (pulstran(timp,pulseperiods,@rectpuls,pulsewidth) * 1.5) - 1;
%Functia pulstran va genera un semnal standard de amplitudine pornind de la
%nivelul nivelul min=-1 si max=1, deci trebuie scalata pentru a respecta cerinta


plot(timp, x);%afisarea semnalului folosind functia plot

---------------------------
T1_ex2_semnal_triunghiular_Razvan_Craciunescu.m

Frecventa = 2 * (10^-3);
Perioada = 5;
timp = 0 : Frecventa : 10 * Perioada;
%Intervalul va fi suficient de mare pentru a se observa graficul 

y = sawtooth(timp) * 1.5 - 0.5;%functia sawtooth genereaza un semnal 
%standard de frecvanta 2*pi, max=1 si min=-1
%am adus semnalul la forma pe care ne-o cerea cerinta din problema, stabilind 
%maximul, minimul si frecventa


plot(timp, y);%afisam semnalul folosind functia plot

----------------------
T1_ex3_punctulb_Razvan_Craciunescu.m

f = 2 * (10 ^ (-3));%am definit frecventa
t = 0 : f : 1; %perioada semnalului
quarter = length(t)/4;%avem patru nivele de definit si asa ca impartim
%perioada in patru parti

final = zeros(length(t));

for i = 1 : (quarter)
	final(i) = -3; %primul nivel 
	final(quarter + i) = -1; %al doilea nivel
	final((2 * quarter) + i) = 1; %al treilea nivel
	final((3 * quarter) + i) = 3; %al patrulea nivel
end