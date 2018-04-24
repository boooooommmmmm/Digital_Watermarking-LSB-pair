imageList = dir('grayscale photo\*.jpg');
imageNum = length(imageList);

PSNR_List = zeros(imageNum, 1);
PSNR_pair_List = zeros(imageNum, 1);
PSNR_pair1_List = zeros(imageNum, 1);
PSNR_pair_new_List = zeros(imageNum, 1);
PSNR_pair_ultra_List = zeros(imageNum, 1);

Hae_List_LSB = zeros(imageNum, 1);
Hae_List_LSB_pair = zeros(imageNum, 1);
Hae_List_LSB_pair_new = zeros(imageNum, 1);
Hae_List_LSB_pair_ultra = zeros(imageNum, 1);

Image_List = cell(imageNum, 1);

for i = 1: 10
    hostImage = imageList(i).name;
    index = strfind(hostImage, '.');                        %index is the digit+1 of image name. e.g 100=>4; 10=>3. First (index-1) stand for image name, the last stand for dot ".".
    imageName = hostImage(1:index - 1);                     %image name is an char list, 1 to index-1 is the image name, exit in ASCII stand. e.g 8=>56; 2=>50
    Image_List{i} = imageName;
    hostImage = strcat('grayscale photo\', hostImage);      %hostImage = path
    
    [hieght, width] = LSB_embed(hostImage, 'watermark.txt', strcat('LSB photo\', strcat(imageName, '.png')));
    LSB_extract(hieght, width, strcat('LSB photo\', strcat(imageName, '.png')), strcat('extract\',strcat(imageName, '.txt')));
    
    [hieght, width] = LSB_pair(hostImage, 'watermark.txt', strcat('LSB-pair photo\', strcat(imageName, '.png')));
    LSB_extract(hieght, width, strcat('LSB-pair photo\', strcat(imageName, '.png')), strcat('extract_pair\',strcat(imageName, '.txt')));
    
    [hieght, width] = LSB_pair_1(hostImage, 'watermark.txt', strcat('LSB-pair1 photo\', strcat(imageName, '.png')));
    LSB_extract(hieght, width, strcat('LSB-pair1 photo\', strcat(imageName, '.png')), strcat('extract_pair1\',strcat(imageName, '.txt')));
    
    %     [hieght, width] = LSB_pair_new(hostImage, 'watermark.txt', strcat('LSB_pair_new photo\', strcat(imageName, '.png')));
    %     LSB_extract(hieght, width, strcat('LSB_pair_new photo\', strcat(imageName, '.png')), strcat('extract_LSB_pair_new\',strcat(imageName, '.txt')));
    
    [hieght, width] = LSB_pair_ultra(hostImage, 'watermark.txt', strcat('LSB_pair_ultra photo\', strcat(imageName, '.png')));
    LSB_extract(hieght, width, strcat('LSB_pair_ultra photo\', strcat(imageName, '.png')), strcat('extract_LSB_pair_ultra\',strcat(imageName, '.txt')));
    
       
    hostImg = imread(hostImage);
    watermarkedImg = imread(strcat('LSB photo\', strcat(imageName, '.png')));
    watermarkedImg_pair = imread(strcat('LSB-pair photo\', strcat(imageName, '.png')));
    watermarkedImg_pair1 = imread(strcat('LSB-pair1 photo\', strcat(imageName, '.png')));
    %     watermarkedImg_pair_new = imread(strcat('LSB_pair_new photo\', strcat(imageName, '.png')));
    watermarkedImg_pair_ultra = imread(strcat('LSB_pair_ultra photo\', strcat(imageName, '.png')));
    
    % PSNR
    PSNR1 = PSNR(hostImg, watermarkedImg);
    PSNR_pair = PSNR(hostImg, watermarkedImg_pair);
    PSNR_pair1 = PSNR(hostImg, watermarkedImg_pair1);
    %     PSNR_pair_new = PSNR(hostImg, watermarkedImg_pair_new);
    PSNR_pair_ultra = PSNR(hostImg, watermarkedImg_pair_ultra);

    PSNR_List(i) = PSNR1;
    PSNR_pair_List(i) = PSNR_pair;
    PSNR_pair1_List(i) = PSNR_pair1;
    %     PSNR_pair_new_List(i) = PSNR_pair_new;
    PSNR_pair_ultra_List(i) = PSNR_pair_ultra;

    
    %     % Hm[n]
    %     Hmx = 0:255;
    %     Hm = Hae(hostImg, watermarkedImg);
    %     Hm_pair = Hae(hostImg, watermarkedImg_pair);
    % %     Hm_pair_new = Hae(hostImg, watermarkedImg_pair_new);
    %     Hm_pair_ultra = Hae(hostImg, watermarkedImg_pair_ultra);
    %
    %     % Hae
    %     Hm1 = abs(Hm);
    %     Hm_pair = abs(Hm_pair);
    % %     Hm_pair_new = abs(Hm_pair_new);
    %     Hm_pair_ultra = abs(Hm_pair_ultra);
    %
    %     Hae_List_LSB(i) = sum(Hm1);
    %     Hae_List_LSB_pair(i) = sum(Hm_pair);
    % %     Hae_List_LSB_pair_new(i) = sum(Hm_pair_new);
    %     Hae_List_LSB_pair_ultra(i) = sum(Hm_pair_ultra);
    
    fprintf('Processing... (%d of %d) has been done...\n', i,imageNum);
end


PSNR_header = {'Image Name', 'LSB', 'LSB_pair', 'LSB_pair1', 'LSB-pair-ultar'};
PSNR1_List = [PSNR_List, PSNR_pair_List, PSNR_pair1_List, PSNR_pair_ultra_List];
xlswrite('PSNR.xlsx', PSNR_header);
xlswrite('PSNR.xlsx', Image_List, 'Sheet1', 'A2');
xlswrite('PSNR.xlsx', PSNR1_List, 'Sheet1', 'B2');


% Hae_header = {'Image Name','LSB', 'LSB_pair', 'LSB-pair-ultar'};
% Hae_List = [Hae_List_LSB, Hae_List_LSB_pair, Hae_List_LSB_pair_ultra];
% xlswrite('Hae.xlsx', Hae_header);
% xlswrite('Hae.xlsx', Image_List, 'Sheet1', 'A2');
% xlswrite('Hae.xlsx', Hae_List, 'Sheet1', 'B2');

