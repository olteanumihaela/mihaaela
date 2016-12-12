close all;
clear all;

P=40; %perioada lui x
D=14; %durata semnalului triungiular din x
w0=2*pi/P; %pulsatia
Ts = 0.05; % T esantionare
t_semnal=0:Ts:D; % vectorul de timp pentru care semnalul este dreptunghi
x_semnal= sawtooth((2*pi/D)*t_semnal,0.5)/2+0.5; % generarea triunghiului
t = 0:Ts:P-Ts; % timpul total al semnalului

x = zeros(1,length(t)); % x format numai din 0
x(t<=D)=x_semnal; % adaugarea partii triunghiulare peste semnal

x_plot = repmat(x,1,4); % repetarea pe 4 perioade

t_plot = 0:Ts:4*P-Ts;  % timpul pe 4 perioade
figure();
plot(t_plot,x_plot); % afisare
title('x(t)(linie solida) si reconstructia folosind N coeficienti (linie punctata)');
hold on;

for k=-50:50
    x_t = x;
    x_t = x_t .* exp(-j*k*w0*t); % vectorul ce trebuie integrat
    X(k+51)=0; % pregatirea termenului pentru suma
    for i = 1: length(t)-1
        X(k+51) = X(k+51) + (t(i+1)-t(i))* (x_t(i)+x_t(i+1))/2; % integrala prin dreptunghi
    end
end
    


for i = 1: length(t)
    x_2(i) = 0;% pregatirea termenului pentru suma
    for k=-50:50
        x_2(i) = x_2(i) + (1/P)*X(k+51)*exp(j*k*w0*t(i)); % calcularea semnalului in punctul i
    end
end
plot(t,x_2,'--'); % afisarea celor 2 semnale

figure(2);
w=-50*w0/(2*pi):w0/(2*pi):50*w0/(2*pi); % frecventele
stem(w/(2*pi),abs(X)); % afisarea spectrului
title('Spectrul de amplitudini');
xlabel('frecventa');
ylabel('amplitudine');

