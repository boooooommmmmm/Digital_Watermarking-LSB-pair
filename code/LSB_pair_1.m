function [ H_binWatermark, W_binWatermark ] = LSB_pair_1( hostFileName,watermarkFileName, watermarkedImgFileName )
%LSB_PAIR_1 Summary of this function goes here
%   Detailed explanation goes here

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
distortion = zeros(1, 256); % distortion
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

        if flag == true
            flag = false;
            c = c + 1; % move to next pixel
            % this is the last pixel of this row
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
                 continue;
             end
            pair = false;
            pixel = double(watermarkedImg(r, c)); % the gray level of current pixel
            if c == W
                next_pixel = double(watermarkedImg(r + 1, 1));
                if mod(pixel, 2) == 1 && next_pixel == pixel + 1
                    if j == W_binWatermark
                        next_n = str2double(binWatermark(i + 1, 1));
                    else
                        next_n = str2double(binWatermark(i, j + 1));
                    end
                    if next_n ~= mod(next_pixel, 2)
                        temp_dist = distortion;
                        temp_dist(pixel + 1) = temp_dist(pixel + 1) - 1;
                        temp_dist(pixel) = temp_dist(pixel) + 1;
                        if sum(abs(temp_dist)) >= sum(abs(distortion))
                            watermarkedImg(r, c) = next_pixel;
                            watermarkedImg(r + 1, 1) = pixel;
                            pair = true;
                        end
                    end
                elseif mod(pixel, 2) == 0 && next_pixel == pixel - 1
                    if j == W_binWatermark
                        next_n = str2double(binWatermark(i + 1, 1));
                    else
                        next_n = str2double(binWatermark(i, j + 1));
                    end
                    if next_n ~= mod(next_pixel, 2)
                        temp_dist = distortion;
                        temp_dist(pixel + 1) = temp_dist(pixel + 1) - 1;
                        temp_dist(pixel + 2) = temp_dist(pixel + 2) + 1;
                        if sum(abs(temp_dist)) >= sum(abs(distortion))
                            watermarkedImg(r, c) = next_pixel;
                            watermarkedImg(r + 1, 1) = pixel;
                            pair = true;
                        end
                    end
                end
            else
                next_pixel = double(watermarkedImg(r, c + 1));
                if mod(pixel, 2) == 1 && next_pixel == pixel + 1
                    if j  == W_binWatermark
                        next_n = str2double(binWatermark(i + 1, 1));
                    else
                        next_n = str2double(binWatermark(i, j + 1));
                    end
                    if next_n ~= mod(next_pixel, 2)
                        temp_dist = distortion;
                        temp_dist(pixel + 1) = temp_dist(pixel + 1) - 1;
                        temp_dist(pixel) = temp_dist(pixel) + 1;
                        if sum(abs(temp_dist)) >= sum(abs(distortion))
                            watermarkedImg(r, c) = next_pixel;
                            watermarkedImg(r, c + 1) = pixel;
                            pair = true;
                        end
                    end
                elseif mod(pixel, 2) == 0 && next_pixel == pixel - 1
                    if j == W_binWatermark
                        next_n = str2double(binWatermark(i + 1, 1));
                    else
                        next_n = str2double(binWatermark(i, j + 1));
                    end
                    if next_n ~= mod(next_pixel, 2)
                        temp_dist = distortion;
                        temp_dist(pixel + 1) = temp_dist(pixel + 1) - 1;
                        temp_dist(pixel + 2) = temp_dist(pixel + 2) + 1;
                        if sum(abs(temp_dist)) >= sum(abs(distortion))
                            watermarkedImg(r, c) = next_pixel;
                            watermarkedImg(r, c + 1) = pixel;
                            pair = true;
                        end
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
            else
                if mod(pixel, 2) == 1
                    distortion(pixel + 1) = distortion(pixel + 1) - 1;
                    distortion(pixel) = distortion(pixel) + 1;
                else
                    distortion(pixel + 1) = distortion(pixel + 1) - 1;
                    distortion(pixel + 2) = distortion(pixel + 2) + 1;
                end
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

fprintf('number of 0: %d\n', n0);
fprintf('number of 1: %d\n', n1);
fprintf('number of k: %d\n', k);

% output the watermarked image
imwrite(watermarkedImg, watermarkedImgFileName, 'png');


% show the host image and watermarked image
% figure(1);
% subplot(1, 2, 1);
% imshow(watermarkedImg, []);
% title('Watermarked image pair');
% subplot(1, 2, 2);
% imshow(hostImg, []);
% title('Host image');

end

