function [ D ] = KL( hostImg, watermarkedImg )
%KL Summary of this function goes here
%   Detailed explanation goes here
%   Kullback-Leibler divergence
%   D(Pc||Ps)= sum(Pc[n]*log(Pc[n]/Ps[n]))
%   n:0~255
%   Pc[n] the probability distribution of host image
%   Ps[n] the probability distribution of watermarked image
% hostImg           host image
% watermarkedImg    watermarked image

% get the height and width of host image
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
h_host = h_host/(H*W); % Pc[n]

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
h_watermark = h_watermark/(H_watermark*W_watermark); % Ps[n]


D = 0;
for i = 1:256
    if h_watermark(i) == 0 || h_host(i) == 0
        D = D;
    else
        D = D + h_host(i) * log(h_host(i)/h_watermark(i));
    end
end

