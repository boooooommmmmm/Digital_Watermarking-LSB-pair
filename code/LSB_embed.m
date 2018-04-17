function [H_binWatermark, W_binWatermark] = LSB_embed(hostFileName,watermarkFileName, watermarkedImgFileName)
%LSB_EMBED Summary of this function goes here
%   Detailed explanation goes here
% watermarkFileName         file name of the watermark
% watermarkedImgFileName    file name of the watermarked image

% read host image
hostImg = imread(hostFileName);

% get the height and width of host image
H = size(hostImg, 1);
W = size(hostImg, 2);

% read watermark file
watermarkFile = fopen(watermarkFileName, 'r');              %fopen(filename,permission) e.g. r,w,a,r+,w+,a+,A,W
watermark = fgets(watermarkFile);                           %fgets reading next line
fclose(watermarkFile);

% transform watermark to binary
binWatermark = dec2bin(watermark);

% get the height and width of binary watermark
H_binWatermark = size(binWatermark, 1);
W_binWatermark = size(binWatermark, 2);

% compare the size between host image and watermark
if H * W < H_binWatermark * W_binWatermark
    fprintf('WARNING: the size of watermarking information is: %d\n', H_binWatermark * W_binWatermark);
    %the watermarking information size should be less than 300*400 = 120
    %000 -> around 9KB for a text file size
    error('Watermark is too large to embed!');
end

% embedding process
r = 1; % row
c = 1; % column
watermarkedImg = hostImg;

n0 = 0; % number of 0 in binary watermark
n1 = 0; % number of 1 in binary watermark

for i = 1:H_binWatermark
    for j = 1:W_binWatermark
        % host image LSB replaced by watermark bit if they are different
        n = str2double(binWatermark(i, j)); % get the bit from watermark
        
        % count the  number of 0 and 1
%         if n == 0
%             n0 = n0 + 1;
%         else
%             n1 = n1 + 1;
%         end
        
        if n ~= bitget(watermarkedImg(r, c), 1)%~= => inverse of true or false, 1 represent the postition of LSB
            watermarkedImg(r, c) = bitset(watermarkedImg(r, c),1, n);%sets the bit at position bit(1) to the value (n)
        end
    
        c = c + 1; % move to next pixel
    
        % this is the last pixel of this row
        if c > W
            r = r + 1; % move to next row
            c = 1; % column reset
        end
    end
end

% fprintf('number of 0: %d\n', n0);
% fprintf('number of 1: %d\n', n1);
% output the watermarked image
imwrite(watermarkedImg, watermarkedImgFileName, 'png');

% show the host image and watermarked image
% figure(1);
% subplot(1, 2, 1);
% imshow(watermarkedImg, []);
% title('Watermarked image');
% subplot(1, 2, 2);
% imshow(hostImg, []);
% title('Host image');

end

