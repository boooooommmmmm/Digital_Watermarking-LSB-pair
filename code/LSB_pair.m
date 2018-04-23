function [ H_binWatermark, W_binWatermark ] = LSB_pair(hostFileName, watermarkFileName, watermarkedImgFileName )
%LSB_PIAR Summary of this function goes here

% read host image
hostImg = imread(hostFileName);

% get the height and width of host image
H = size(hostImg, 1);
W = size(hostImg, 2);

% read watermark file
watermarkFile = fopen(watermarkFileName, 'r');
watermark = fgets(watermarkFile);
fclose(watermarkFile);

% transform watermark to binary
binWatermark = dec2bin(watermark);

% get the height and width of binary watermark
H_binWatermark = size(binWatermark, 1);
W_binWatermark = size(binWatermark, 2);

% compare the size between host image and watermark
if H * W < H_binWatermark * W_binWatermark
    error('Watermark is too large to embed!');
end

% embedding process
r = 1; % row
c = 1; % column
watermarkedImg = hostImg;

n0 = 0; % number of 0 in binary watermark
n1 = 0; % number of 1 in binary watermark
k = 0;
flag = false;
for i = 1:H_binWatermark
    for j = 1:W_binWatermark
        n = str2double(binWatermark(i, j)); % get the bit from watermark
        % count the  number of 0 and 1
        if n == 0
            n0 = n0 + 1;
        else
            n1 = n1 + 1;
        end
%         if c == 33
%             fprintf('end of a row');
%         end
        if flag == true
            flag = false;
            c = c + 1; % move to next pixel
            % this is the last pixel of this column
            if c > W
                r = r + 1; % move to next row
                c = 1; % column reseted
            end
            continue;
        end
        
        % change happens
        if n ~= bitget(watermarkedImg(r, c), 1)
             if i == H_binWatermark && j == W_binWatermark
                 watermarkedImg(r, c) = bitset(watermarkedImg(r, c),1, n);
                 continue;%end iteration
             end
            pair = false;
            pixel = double(watermarkedImg(r, c)); % the gray level of current pixel
            
            %if current column is the last one
            if c == W
                next_pixel = double(watermarkedImg(r + 1, 1));
                if mod(pixel, 2) == 1 && next_pixel == pixel + 1%if LSB current pixel=1 and the next pixel of gray level is 1 bit larger than current
                    %check if is last column or not
                    if j == W_binWatermark
                        next_n = str2double(binWatermark(i + 1, 1));
                    else
                        next_n = str2double(binWatermark(i, j + 1));
                    end
                    if next_n ~= mod(next_pixel, 2)%if message bit != LSB(pixel), exchange two pixels
                        watermarkedImg(r, c) = next_pixel;
                        watermarkedImg(r + 1, 1) = pixel;
                        pair = true;
                    end
                elseif mod(pixel, 2) == 0 && next_pixel == pixel - 1%the second case, 
                    if j == W_binWatermark
                        next_n = str2double(binWatermark(i + 1, 1));
                    else
                        next_n = str2double(binWatermark(i, j + 1));
                    end
                    if next_n ~= mod(next_pixel, 2)
                        watermarkedImg(r, c) = next_pixel;
                        watermarkedImg(r + 1, 1) = pixel;
                        pair = true;
                    end
                end
                
            %if normal case
            else
                next_pixel = double(watermarkedImg(r, c + 1));
                if mod(pixel, 2) == 1 && next_pixel == pixel + 1
                    if j  == W_binWatermark
                        next_n = str2double(binWatermark(i + 1, 1));
                    else
                        next_n = str2double(binWatermark(i, j + 1));
                    end
                    if next_n ~= mod(next_pixel, 2)
                        watermarkedImg(r, c) = next_pixel;
                        watermarkedImg(r, c + 1) = pixel;
                        pair = true;
                    end
                elseif mod(pixel, 2) == 0 && next_pixel == pixel - 1
                    if j == W_binWatermark
                        next_n = str2double(binWatermark(i + 1, 1));
                    else
                        next_n = str2double(binWatermark(i, j + 1));
                    end
                    if next_n ~= mod(next_pixel, 2)
                        watermarkedImg(r, c) = next_pixel;
                        watermarkedImg(r, c + 1) = pixel;
                        pair = true;
                    end
                end
            end
            if pair == true
                if mod(pixel, 2) == 1 && next_pixel == pixel + 1
                    k = k + 1;
                elseif mod(pixel, 2) == 0 && next_pixel == pixel - 1
                    k = k + 1;
                end
                flag = true;
                
            % if not fit any suitation, do regular LSB watermarking
            else
                watermarkedImg(r, c) = bitset(watermarkedImg(r, c),1, n);
            end
        end

        c = c + 1; % move to next pixel

        % this is the last pixel of this row
        if c > W
            r = r + 1; % move to next row
            c = 1; % column reseted
        end
    end
end

% fprintf('number of 0: %d\n', n0);
% fprintf('number of 1: %d\n', n1);
% fprintf('number of k: %d\n', k);

% output the watermarked image
imwrite(watermarkedImg, watermarkedImgFileName, 'png');


end

