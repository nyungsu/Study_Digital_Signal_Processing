# week_11
pkg load image

test_i = imread('lenna.jpg');
test_g= rgb2gray(test_i);

# image 2ºĞÈ­
for i = 1:1:225
    for j = 1:1:225
       if (test_g(i,j)>125)
           test_g(i,j) = 255;
       else 
           test_g(i,j) = 0;
       end
    end
end

imshow(test_g)
imhist(test_g)

test_eq = histeq(test_g);

# --------------------------------------------------

# week_12
pkg load image
img = imread('lenna.jpg');

gray_img = rgb2gray(img);
figure(1)
imshow(gray_img)

kernel = ones(9,9)/81;
result = conv2(gray_img,kernel);
figure(2)
imshow(result,[]);

edge_img = edge(gray_img,'sobel')
figure(3)
imshow(edge_img)

sharpen_kerner = [0,-1,0;-1,5,-1;0,-1,0];
sharpen_img = conv2(gray_img,sharpen_kerner);
figure(4)
imshow(sharpen_img,[])



