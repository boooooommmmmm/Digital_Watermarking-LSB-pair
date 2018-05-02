function [ H_binWatermark, W_binWatermark ] = LSB_pair_dual( hostFileName,watermarkFileName, watermarkedImgFileName )
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
H_binWatermark = size(binWatermark, 1);%6219
W_binWatermark = size(binWatermark, 2);%14

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
isSupport_next_row_n = true;
pair = false;

for i = 1:H_binWatermark
    for j = 1:W_binWatermark
        n = str2double(binWatermark(i, j)); % get the bit from watermark
        isSupport_next_row_n = true;
        
        if pair == true
            pair = false;
            c = c + 1; % move to next pixel
            % this is the last pixel of this row
            if c > W
                r = r + 1; % move to next row
                c = 1; % column reseted
            end
            continue;
        end
        
        if i == H_binWatermark && j == W_binWatermark
            watermarkedImg(r, c) = bitset(watermarkedImg(r, c),1, n);
            continue;
        end
        
        pair = false;
        pixel = double(watermarkedImg(r, c)); % the gray level of current pixel
        
        % LSB starts here
        if n ~= bitget(watermarkedImg(r, c), 1)
            if c == W
                next_pixel = double(watermarkedImg(r + 1, 1));
                if j == W_binWatermark
                    next_n = str2double(binWatermark(i + 1, 1));
                else
                    next_n = str2double(binWatermark(i, j + 1));
                end
                
                if mod(pixel, 2) == 1 && next_pixel == pixel + 1
                    if next_n ~= mod(next_pixel, 2)
                        temp_dist = distortion;
                        temp_dist(pixel) = temp_dist(pixel) + 1;
                        temp_dist(pixel + 1) = temp_dist(pixel + 1) - 1;
                        temp_dist(pixel + 2) = temp_dist(pixel) - 1;
                        temp_dist(pixel + 3) = temp_dist(pixel) + 1;
                        if sum(abs(temp_dist)) >= sum(abs(distortion))
                            watermarkedImg(r, c) = next_pixel;
                            watermarkedImg(r + 1, 1) = pixel;
                            pair = true;
                        end
                    end
                elseif mod(pixel, 2) == 0 && next_pixel == pixel - 1
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
                
            else %when c!=W, the normal case
                next_pixel = double(watermarkedImg(r, c + 1));
                if j  == W_binWatermark
                    next_n = str2double(binWatermark(i + 1, 1));
                else
                    next_n = str2double(binWatermark(i, j + 1));
                end
                
                if mod(pixel, 2) == 1 && next_pixel == pixel + 1
                    if next_n ~= mod(next_pixel, 2)
                        temp_dist = distortion;
                        temp_dist(pixel) = temp_dist(pixel) + 1;
                        temp_dist(pixel + 1) = temp_dist(pixel + 1) - 1;
                        temp_dist(pixel + 2) = temp_dist(pixel) - 1;
                        temp_dist(pixel + 3) = temp_dist(pixel) + 1;
                        if sum(abs(temp_dist)) >= sum(abs(distortion))
                            watermarkedImg(r, c) = next_pixel;
                            watermarkedImg(r, c + 1) = pixel;
                            pair = true;
                        end
                    end
                elseif mod(pixel, 2) == 0 && next_pixel == pixel - 1
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
            end % end c==W condiction
            
            % start cross row pair detector
            if pair == false && r~= H
                next_row_pixel = double(watermarkedImg(r + 1, c));
                if mod(pixel, 2) == 1 && next_row_pixel == pixel + 1
                    row_change = fix((j + W)/W_binWatermark);                    
                    if mod((j + W), W_binWatermark) == 0 && (i + row_change + 1) > H_binWatermark
                        isSupport_next_row_n = false;
                    elseif mod((j + W), W_binWatermark) == 0
                        next_row_n = str2double(binWatermark((i + row_change + 1), 1));
                    elseif (i + row_change) > H_binWatermark
                        isSupport_next_row_n = false;
                    else
                        next_row_n = str2double(binWatermark((i + row_change), j + W - row_change*W_binWatermark));
                    end
                    
                    if isSupport_next_row_n == true
                        if next_row_n ~= mod(next_row_pixel, 2)
                            temp_dist = distortion;
                            temp_dist(pixel) = temp_dist(pixel) + 1;
                            temp_dist(pixel + 1) = temp_dist(pixel + 1) - 1;
                            temp_dist(pixel + 2) = temp_dist(pixel) - 1;
                            temp_dist(pixel + 3) = temp_dist(pixel) + 1;
                            if sum(abs(temp_dist)) >= sum(abs(distortion))
                                watermarkedImg(r, c) = next_row_pixel;
                                watermarkedImg(r + 1, c) = pixel;
                                cross_pair = true;
                            end
                        end
                    end
                elseif mod(pixel, 2) == 0 && next_row_pixel == pixel - 1
                    row_change = fix((j + W)/W_binWatermark);
                    
                    if mod((j + W), W_binWatermark) == 0 && (i + row_change + 1) > H_binWatermark
                        isSupport_next_row_n = false;
                    elseif mod((j + W), W_binWatermark) == 0
                        next_row_n = str2double(binWatermark((i + row_change + 1), 1));
                    elseif (i + row_change) > H_binWatermark
                        isSupport_next_row_n = false;
                    else
                        next_row_n = str2double(binWatermark((i + row_change), j + W - row_change*W_binWatermark));
                    end
                    
                    if isSupport_next_row_n == true
                        if next_row_n ~= mod(next_row_pixel, 2)
                            temp_dist = distortion;
                            temp_dist(pixel + 1) = temp_dist(pixel + 1) - 1;
                            temp_dist(pixel + 2) = temp_dist(pixel + 2) + 1;
                            if sum(abs(temp_dist)) >= sum(abs(distortion))
                                watermarkedImg(r, c) = next_row_pixel;
                                watermarkedImg(r + 1, c) = pixel;
                                cross_pair = true;
                            end
                        end
                    end
                end
            end % end cross pair detect
            
            if pair == true
                k = k + 1;
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
        end % end LSB
        
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


% show the host image and watermarked image
% figure(1);
% subplot(1, 2, 1);
% imshow(watermarkedImg, []);
% title('Watermarked image pair');
% subplot(1, 2, 2);
% imshow(hostImg, []);
% title('Host image');

end

