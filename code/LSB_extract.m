function [] = LSB_extract(H_binWatermark, W_binWatermark, extractImg, extractFile)
%LSB_EXTRACT Summary of this function goes here
%   Detailed explanation goes here
% H_binWatermark     height of binary watermark
% W_binWatermark     width of binary watermark
% extractImg         the file name of watermarked image
% extractFile        the file name program will output


% read watermarked image
watermarkedImg = imread(extractImg);

% get the height and width of watermark image
H = size(watermarkedImg, 1);
W = size(watermarkedImg, 2);

% extracting process
r = 1; % row
c = 1; % column
binWatermark = zeros(H_binWatermark, W_binWatermark);
for i = 1:H_binWatermark
    for j = 1 :W_binWatermark
        binWatermark(i, j) = bitget(watermarkedImg(r, c), 1);
        c = c + 1; % move to next pixel
        % this is the last pixel of this column
        if c > W
            r = r + 1; % move to next row
            c = 1; % column reseted
        end
    end
end

% transform binary to decimal
watermark = bin2dec(char(binWatermark + 48));

% transform to string
watermark = char(watermark);

% output to text file
watermarkFile = fopen(extractFile, 'wt');
for i = 1:length(watermark)
    fprintf(watermarkFile, '%s', watermark(i));
end
fclose(watermarkFile);

end

