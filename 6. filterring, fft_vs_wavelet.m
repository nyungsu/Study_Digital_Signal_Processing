pkg load image          # 이미지 처리 패키지 로드
pkg load ltfat          # FWT를 사용하기 위한 패키지 로드

## 1. 다양한 필터 적용해보기

img = imread('lenna.jpg');

# 그레이 이미지 만들기
gray_img = rgb2gray(img);
figure(1)
imshow(gray_img)

# 평균값 필터 (LPF)를 그레이 이미지에 conv2
kernel = ones(9,9)/81;
result = conv2(gray_img,kernel);
figure(2)
imshow(result,[]);      # 평균값 필터를 conv 해주면서 변한 데이터 타입을 보정하기 위한 []


# 소벨 필터를 이용하여 엣지 함수를 사용 
edge_img = edge(gray_img,'sobel')
figure(3)
imshow(edge_img)

# 샤펜 필터를 직접 구현하여 결과값 확인
sharpen_kerner = [0,-1,0;-1,5,-1;0,-1,0];
sharpen_img = conv2(gray_img,sharpen_kerner);
figure(4)
imshow(sharpen_img,[])


## 2. FFT와 FWT 비교하기

# 그레이 이미지 샘플 만들기
sample = imread(‘lenna.jpg’)
sample_g = rgb2gray(sample);
kernal = [0,0,0;0,1,0;0,0,0];
original_sample = conv2(sample_g, kernel)

# wavelet decomposition 확인
C= fwt2(original_sample,’db8’,4)
imagesc(dynlimit(20*log10(abs(c)), 70)) 

# wavelet decomposition data 손실
# HH 영역에 data를 0으로 강제로 수정
C(500:900, 500:1000) = 0;

# 손상된 data를 inverse wavelet 수행 후 display
re_sample = ifwt2(c,’db8’,4);
Imshow(re_sample, [])

# fft 수행한 데이터에 대해 동일하게 수행하여 비교
test = fft2(original_sample);
test(500:900, 500:1000) = 0;
test_re =ifft2(test);
imshow(test_re,[]);

