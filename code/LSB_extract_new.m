% Warning: This function has been abandoned

function [] = LSB_extract_new(extractImg, extractFile)

watermarkedImg = imread(extractImg);

H = size(watermarkedImg, 1);
W = size(watermarkedImg, 2);

H_binWatermark = 8571;
W_binWatermark = 14;

r = 1; % row
c = 1; % column
binWatermark = zeros(H_binWatermark, W_binWatermark);
stopBytesDetector = zeros(1, W_binWatermark);
stopBytes = zeros(1, W_binWatermark);

for i = 1:H_binWatermark
    for j = 1 :W_binWatermark
        binWatermark(i, j) = bitget(watermarkedImg(r, c), 1);
        stopBytesDetector(1,j) = bitget(watermarkedImg(r, c), 1);
        
        c = c + 1; % move to next pixel
        
        if c > W
            r = r + 1; % move to next row
            c = 1; % column reseted
        end
    end
    
    if stopBytesDetector == stopBytes
        break;
    end
end

%fprintf("i: %d, j: %d      ", i ,j);
% binWatermarkWrite = zeros(i, j);
binWatermarkWrite = binWatermark(1:i-1,:);

% transform binary to decimal
watermarkWrite = bin2dec(char(binWatermarkWrite + 48));

% transform to string
watermarkWrite = char(watermarkWrite);

% output to text file
watermarkFile = fopen(extractFile, 'wt');
for i = 1:length(watermarkWrite)
    fprintf(watermarkFile, '%s', watermarkWrite(i));
end
fclose(watermarkFile);

end

