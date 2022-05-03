f1 = 2100;
f2 = 2400;

fs = max(f1,f2)*10;                   % 샘플링 이론에 기반 
                                      % 가지고 있는 주파수 중 큰 것보다 2배 이상인데
                                      % 현업에서는 5~6배 10배

t1 = 0: 1/fs : 2/f1;                    
                                                                                     
y1_1 = cos(2*pi*f1*t1);               % 2.1khz signal
y1_2 = cos(2*pi*f2*t1);               % 2.4khz signal

y1 = y1_1 + y1_2;                     % 2.1k + 2.4k hz signal
Y1 = abs(fft(y1));                    % fft

N1 = length(t1);
k1 = (0:N1-1)*fs/N1;                  % frequency domain x axis
                                      
subplot(211)
plot(k1,Y1)

% 여기까지 신호를 찍어서 보면 Resolution이 많이 떨어짐.
% -> frequency domain에서 x축이 촘촘하지 않아서 그렇구나 
% -> k를 결정하는 파라미터 1)fs, 2)N
% -> fs를 늘린다면 더 높은 주파수(더 짧은 주기)로 신호를 찍어야함 ,Resource 손해
% -> N을 늘리자 -> 신호를 더 오래 관측하자

t2 = 0: 1/fs : 200/f1;              % 2 -> 200 으로 변경

y2_1 = cos(2*pi*f1*t2);
y2_2 = cos(2*pi*f2*t2);

y2 = y2_1 + y2_2;
Y2 = abs(fft(y2));

N2 = length(t2);

k2 = (0:N2-1)*fs/N2;     

subplot(212)
plot(k2,Y2)
