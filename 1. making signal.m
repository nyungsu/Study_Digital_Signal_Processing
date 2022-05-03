f = 2000:5000;                      % 2khz ~5khz
fs = 10*max(f);                     % 샘플링 이론 max의 최소 2배 이상, 현업에서는 5~6배
Ts = 1/fs;
t = 0:Ts:10/min(f);                 % 샘플링 주기로 10주기 그려라
                                    % x/min(f) 주파수의 최소 값으로 x주기 그려라

y = zeros(length(f), length(t));    % 3001x251 초기값  영행렬


for i=1:length(f)
    y(i,:) = sin(2*pi*t.*f(1,i));   % 
end    

subplot(3,1,1)
plot(t,y(1,:));                     % 2khz plotting

subplot(3,1,2)
plot(t,y(2000,:));                  % 2000번째니까 약 4khz plotting

y_sum = zeros(1,length(t));         % sum 초기 값
for k=1:length(f)
    y_sum = y_sum+y(k,:);           % 2khz ~ 5khz for문을 이용해 더함
end

subplot(3,1,3)          
plot(t,y_sum);                      % 2khz ~ 5khz 까지 더해진 y_sum plotting


