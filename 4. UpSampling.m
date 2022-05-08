% 3M @ 30M -> x2 upsampling

f = 3*10^6; % 3M
fs = 30*10^6; % 30M


Ts = 1/fs;

t = 0 : Ts : 5/f; 
tu = 0: 0.5*Ts : 5/f;

% time domain
y = cos(2*pi*f*t);

y_up = zeros(1,length(y)*2);
y_up(1:2:end) = y;

figure(1)
subplot(2,1,1),stem(t,y)
subplot(2,1,2),stem(tu,y_up(1:101));


% frequency domain
N = length(t);
N_U = length(tu);

k_Y = (0:N-1)*fs/N;
k_U = (0:N_U-1)*2*fs/N_U;

Y = abs(fft(y))/length(y);
Y_UP = abs(fft(y_up))/length(y_up);

figure(2)
subplot(2,1,1),plot(k_Y,Y)
subplot(2,1,2),plot(k_U,Y_UP(1:101))

% filter
fc = 10*10^6;             % cut-off freq = 10M
FC = fc /(2*fs);          % 1로 정규화
n = -172 : 172;           % n for hamming window 
N = length(n);
h = 2*FC*sinc(2*FC*n);    % 10M에서 깎을 필터 시간축 선언
w = hamming(N)';
H = h.*w;                 % 해밍 곱해준 10M에서 깎을 필터
result = conv(H,y_up);    % 시간 축에서 conv

R = abs(fft(result))/length(result);
k_R=(0 : length(result)-1)*(2*fs)/length(result);

figure(3)
plot(k_R,R);
