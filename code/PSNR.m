%=========================================================================
%==============This function is for calculating PSNR value================
%=========================================================================

function [ psnr ] = PSNR( image1, image2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% image1    the file name of image 1
% image2    the file name of image 2

% get the height and width of image 1
H1 = size(image1, 1);
W1 = size(image1, 2);

% get the height and width of image 2
H2 = size(image2, 1);
W2 = size(image2, 2);

if H1 ~= H2 || W1 ~= W2
    fprintf('h1: %d;    w1: %d    ',H1,W1);
    fprintf('h2: %d;    w2: %d    ',H2,W2);
    error('These two images are different!');
end

sum = 0;
for i = 1:H1
    for j = 1:W1
        e = double(image1(i, j)) - double(image2(i, j));
        sum = sum + e^2;
    end
end

MSE = sum / (H1 * W1);

%psnr = 10 * (log10(255^2 / MSE));
psnr = sum;
end

