% hola Mundo
F0=50;      % Frecuencia fundamental 50Hz
T0=1/F0;    % Periodo, 20ms
Fs=F0*20;   % Frecuencia de muestreo, 20 muestras por periodo
N=200;      % Numero de muestras totales
n=(0:N-1);  % indice de tiempo discreto
V=230*sqrt(2)*sin(2*pi*F0*n/Fs); % Señal de voltaje de la linea de 230Vrms.
datosV=round(((V+400)/800)*(2^16)); % Señal de Intensidad de 1Arms
I=1*sqrt(2)*sin(2*pi*F0*n/Fs+pi/8); % Datos del ADC de tensión, adc de 16 bits, con offset 0, midiendo de -400V a 400V
datosI=round(((I+2.5)/5)*(2^16)); % Datos del ADC de intensidad, adc de 16 bits, con offset 0, midiendo de -5A a 5A

subplot(2,2,1)
plot(n*T0,V);
subplot(2,2,2)
plot(n*T0,datosV);

subplot(2,2,3)
plot(n*T0,I);
subplot(2,2,4)
plot(n*T0,datosI);

Veff=sqrt(sum(V.^2)/N) %V, Voltios
Ieff=sqrt(sum(I.^2)/N) %A, Amperios
S=Veff*Ieff            %W, Vatios
P=sum(V.*I)/N          %VA, Voltio-Amperio
Q=sqrt(S^2-P^2)        %VAr, Voltio-Amperio Reactivo
fdp=P/S                % 
E=S*N/Fs/1000/60/60    % kWh, Kilovatio Hora
