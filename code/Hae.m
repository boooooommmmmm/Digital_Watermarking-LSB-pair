%=========================================================================
%===============This function is for calculating Hae value================
%=========================================================================

function [h] = Hae(hostImg, watermarkedImg)
%HAE Summary of this function goes here
%   Detailed explanation goes here
% hostImg           host image
% watermarkedImg    watermarked image

% get the height and width of image
H = size(hostImg, 1);
W = size(hostImg, 2);

% get the height and width of watermarked image
H_watermark = size(watermarkedImg, 1);
W_watermark = size(watermarkedImg, 2);

h_host = zeros(1, 256);
for u = 0:255
    n = 0;
    for i = 1:H
        for j = 1:W
            if u == hostImg(i, j)
                n = n + 1;
            end
        end
    end
    h_host(1, u+1) = n;
end

h_watermark = zeros(1, 256);
for u = 0:255
    n = 0;
    for i = 1:H_watermark
        for j = 1:W_watermark
            if u == watermarkedImg(i, j)
                n = n + 1;
            end
        end
    end
    h_watermark(1, u+1) = n;
end

h = h_host - h_watermark;
end

