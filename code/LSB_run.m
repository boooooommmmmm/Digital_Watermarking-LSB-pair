%=============================================
%==========This is the main function==========
%=============================================

%read all grayscale images from "grayscale photo" folder
imageList = dir('grayscale photo\*.jpg');
imageNum = length(imageList);
empty_List = zeros(imageNum, 1);


%PSNR 
PSNR_List = zeros(imageNum, 1);
PSNR_pair_List = zeros(imageNum, 1);
PSNR_pair_dual_List = zeros(imageNum, 1);
PSNR_pair_triple_List = zeros(imageNum, 1);
PSNR_pair_ultra_List = zeros(imageNum, 1);
PSNR_pair_diagonal_List = zeros(imageNum, 1);
PSNR_pair_crossDoubleLine_List = zeros(imageNum, 1);

PSNR_pair_List_PSNR_List_compare = zeros(3, 1);
PSNR_pair_dual_List_PSNR_List_comapre = zeros(3, 1);
PSNR_pair_triple_List_PSNR_List_comapre = zeros(3, 1);
PSNR_pair_ultra_List_PSNR_List_comapre = zeros(3, 1);
PSNR_pair_dual_List_PSNR_pair_List_comapre = zeros(3, 1);
PSNR_pair_triple_List_PSNR_pair_List_comapre = zeros(3, 1);
PSNR_pair_ultra_List_PSNR_pair_List_comapre = zeros(3, 1);
PSNR_pair_triple_List_PSNR_pair_dual_List_comapre = zeros(3, 1);
PSNR_pair_ultra_List_PSNR_pair_dual_List_comapre = zeros(3, 1);
PSNR_pair_ultra_List_PSNR_pair_triple_List_comapre = zeros(3, 1);


%Hae
Hae_List_LSB = zeros(imageNum, 1);
Hae_List_LSB_pair = zeros(imageNum, 1);
Hae_List_LSB_pair_dual = zeros(imageNum, 1);
Hae_List_LSB_pair_triple = zeros(imageNum, 1);
Hae_List_LSB_pair_ultra = zeros(imageNum, 1);
Hae_List_LSB_pair_diagonal = zeros(imageNum, 1);
Hae_List_LSB_pair_crossDoubleLine = zeros(imageNum, 1);


%SSIM
SSIM_List_LSB = zeros(imageNum, 1);
SSIM_List_LSB_pair = zeros(imageNum, 1);
SSIM_List_LSB_pair_dual = zeros(imageNum, 1);
SSIM_List_LSB_pair_triple = zeros(imageNum, 1);
SSIM_List_LSB_pair_ultra = zeros(imageNum, 1);
SSIM_List_LSB_pair_diagonal = zeros(imageNum, 1);
SSIM_List_LSB_pair_crossDoubleLine = zeros(imageNum, 1);

Image_List = cell(imageNum, 1);

%Start embedding and extracting loop
for i = 1: 5
    
    hostImage = imageList(i).name;                          %read the whole image names from list
    index = strfind(hostImage, '.');                        %index is the digit+1 of image name. e.g. 100=>4; 10=>3. First (index-1) bytes stand for image name, the last byte stand for dot ".".
    imageName = hostImage(1:index - 1);                     %image name is an char list, 1 to index-1 is the image name, in ASCII stand. e.g. 8=>56; 2=>50
    Image_List{i} = imageName;
    hostImage = strcat('grayscale photo\', hostImage);      %hostImage = path
    
    % LSB methods start
    [hieght, width] = LSB_embed(hostImage, 'watermark.txt', strcat('LSB_photo\', strcat(imageName, '.png')));
    LSB_extract(hieght, width, strcat('LSB_photo\', strcat(imageName, '.png')), strcat('extract_LSB\',strcat(imageName, '.txt')));
    
    [hieght, width] = LSB_pair_1(hostImage, 'watermark.txt', strcat('LSB_pair_photo\', strcat(imageName, '.png')));
    LSB_extract(hieght, width, strcat('LSB_pair_photo\', strcat(imageName, '.png')), strcat('extract_LSB_pair\',strcat(imageName, '.txt')));
    
    [hieght, width] = LSB_pair_dual(hostImage, 'watermark.txt', strcat('LSB_pair_dual_photo\', strcat(imageName, '.png')));
    LSB_extract(hieght, width,strcat('LSB_pair_dual_photo\', strcat(imageName, '.png')), strcat('extract_LSB_pair_dual\',strcat(imageName, '.txt')));
    
    [hieght, width] = LSB_pair_triple(hostImage, 'watermark.txt', strcat('LSB_pair_triple_photo\', strcat(imageName, '.png')));
    LSB_extract(hieght, width,strcat('LSB_pair_triple_photo\', strcat(imageName, '.png')), strcat('extract_LSB_pair_triple\',strcat(imageName, '.txt')));
    
    [hieght, width] = LSB_pair_ultra(hostImage, 'watermark.txt', strcat('LSB_pair_ultra_photo\', strcat(imageName, '.png')));
    LSB_extract(hieght, width,strcat('LSB_pair_ultra_photo\', strcat(imageName, '.png')), strcat('extract_LSB_pair_ultra\',strcat(imageName, '.txt')));
    
    [hieght, width] = LSB_pair_diagonal(hostImage, 'watermark.txt', strcat('LSB_pair_diagonal_photo\', strcat(imageName, '.png')));
    LSB_extract(hieght, width,strcat('LSB_pair_diagonal_photo\', strcat(imageName, '.png')), strcat('extract_LSB_pair_diagonal\',strcat(imageName, '.txt')));
    
    [hieght, width] = LSB_pair_crossDoubleLine(hostImage, 'watermark.txt', strcat('LSB_pair_crossDoubleLine_photo\', strcat(imageName, '.png')));
    LSB_extract(hieght, width,strcat('LSB_pair_crossDoubleLine_photo\', strcat(imageName, '.png')), strcat('extract_LSB_pair_crossDoubleLine\',strcat(imageName, '.txt')));
    
    
    %read watermarked images from their folders
    hostImg = imread(hostImage);
    watermarkedImg = imread(strcat('LSB_photo\', strcat(imageName, '.png')));
    watermarkedImg_pair = imread(strcat('LSB_pair_photo\', strcat(imageName, '.png')));
    watermarkedImg_pair_dual = imread(strcat('LSB_pair_dual_photo\', strcat(imageName, '.png')));
    watermarkedImg_pair_triple = imread(strcat('LSB_pair_triple_photo\', strcat(imageName, '.png')));
    watermarkedImg_pair_ultra = imread(strcat('LSB_pair_ultra_photo\', strcat(imageName, '.png')));
    watermarkedImg_pair_diagonal = imread(strcat('LSB_pair_diagonal_photo\', strcat(imageName, '.png')));
    watermarkedImg_pair_crossDoubleLine = imread(strcat('LSB_pair_crossDoubleLine_photo\', strcat(imageName, '.png')));
    
    %Start image quality measurement
    % PSNR 
    PSNR1 = PSNR(hostImg, watermarkedImg);
    PSNR_pair = PSNR(hostImg, watermarkedImg_pair);
    PSNR_pair_dual = PSNR(hostImg, watermarkedImg_pair_dual);
    PSNR_pair_triple = PSNR(hostImg, watermarkedImg_pair_triple);
    PSNR_pair_ultra = PSNR(hostImg, watermarkedImg_pair_ultra);
    PSNR_pair_diagonal = PSNR(hostImg, watermarkedImg_pair_diagonal);
    PSNR_pair_crossDoubleLine = PSNR(hostImg, watermarkedImg_pair_crossDoubleLine);
    
    PSNR_List(i) = PSNR1;
    PSNR_pair_List(i) = PSNR_pair;
    PSNR_pair_dual_List(i) = PSNR_pair_dual;
    PSNR_pair_triple_List(i) = PSNR_pair_triple;
    PSNR_pair_ultra_List(i) = PSNR_pair_ultra;
    PSNR_pair_diagonal_List(i) = PSNR_pair_diagonal;
    PSNR_pair_crossDoubleLine_List(i) = PSNR_pair_crossDoubleLine;
    
    % Hae% Hm[n]
    Hmx = 0:255;
    Hm = Hae(hostImg, watermarkedImg);
    Hm_pair = Hae(hostImg, watermarkedImg_pair);
    Hm_pair_dual = Hae(hostImg, watermarkedImg_pair_dual);
    Hm_pair_triple = Hae(hostImg, watermarkedImg_pair_triple);
    Hm_pair_ultra = Hae(hostImg, watermarkedImg_pair_ultra);
    Hm_pair_diagonal = Hae(hostImg, watermarkedImg_pair_diagonal);
    Hm_pair_crossDoubleLine = Hae(hostImg, watermarkedImg_pair_crossDoubleLine);
    
    Hm1 = abs(Hm);
    Hm_pair = abs(Hm_pair);
    Hm_pair_dual = abs(Hm_pair_dual);
    Hm_pair_triple = abs(Hm_pair_triple);
    Hm_pair_ultra = abs(Hm_pair_ultra);
    Hm_pair_diagonal = abs(Hm_pair_diagonal);
    Hm_pair_crossDoubleLine = abs(Hm_pair_crossDoubleLine);
    
    Hae_List_LSB(i) = sum(Hm1);
    Hae_List_LSB_pair(i) = sum(Hm_pair);
    Hae_List_LSB_pair_dual(i) = sum(Hm_pair_dual);
    Hae_List_LSB_pair_triple(i) = sum(Hm_pair_triple);
    Hae_List_LSB_pair_ultra(i) = sum(Hm_pair_ultra);
    Hae_List_LSB_pair_diagonal(i) = sum(Hm_pair_diagonal);
    Hae_List_LSB_pair_crossDoubleLine(i) = sum(Hm_pair_crossDoubleLine);
    
    %SSIM
    SSIM1 = SSIM(hostImg, watermarkedImg);
    SSIM_pair = SSIM(hostImg, watermarkedImg_pair);
    SSIM_pair_dual = SSIM(hostImg, watermarkedImg_pair_dual);
    SSIM_pair_triple = SSIM(hostImg, watermarkedImg_pair_triple);
    SSIM_pair_ultra = SSIM(hostImg, watermarkedImg_pair_ultra);
    SSIM_pair_diagonal = SSIM(hostImg, watermarkedImg_pair_ultra);
    SSIM_pair_crossDoubleLine = SSIM(hostImg, watermarkedImg_pair_ultra);
    
    SSIM_List_LSB(i) = SSIM1;
    SSIM_List_LSB_pair(i) = SSIM_pair;
    SSIM_List_LSB_pair_dual(i) = SSIM_pair_dual;
    SSIM_List_LSB_pair_triple(i) = SSIM_pair_triple;
    SSIM_List_LSB_pair_ultra(i) = SSIM_pair_ultra;
    SSIM_List_LSB_pair_diagonal(i) = SSIM_pair_diagonal;
    SSIM_List_LSB_pair_crossDoubleLine(i) = SSIM_pair_crossDoubleLine;
    
    fprintf('Processing... (%d of %d) has been done...\n', i,imageNum);
end


% save the process result to Excel
Sheet2_1={'Value: =0'};
Sheet2_2={'Value: >0'};
Sheet2_3={'Value: <0'};


%Start PSNR value compare
[PSNR_header_Sheet1, PSNR_result_List, PSNR_header_Sheet2, PSNR_compare_result_List] = ComparePSNR(PSNR_List, PSNR_pair_List, PSNR_pair_dual_List, PSNR_pair_triple_List,PSNR_pair_ultra_List,PSNR_pair_diagonal_List,PSNR_pair_crossDoubleLine_List);
xlswrite('PSNR.xlsx', PSNR_header_Sheet1);
xlswrite('PSNR.xlsx', Image_List, 'Sheet1', 'A2');
xlswrite('PSNR.xlsx', PSNR_result_List, 'Sheet1', 'B2');
xlswrite('PSNR.xlsx', PSNR_header_Sheet2, 'Sheet2', 'B1');
xlswrite('PSNR.xlsx', Sheet2_1, 'Sheet2', 'A2');
xlswrite('PSNR.xlsx', Sheet2_2, 'Sheet2', 'A3');
xlswrite('PSNR.xlsx', Sheet2_3, 'Sheet2', 'A4');
xlswrite('PSNR.xlsx', PSNR_compare_result_List, 'Sheet2', 'B2');


%Start Hae value compare
[Hae_header_Sheet1, Hae_result_List, Hae_header_Sheet2, Hae_compare_result_List] = CompareHae(Hae_List_LSB, Hae_List_LSB_pair, Hae_List_LSB_pair_dual, Hae_List_LSB_pair_triple,Hae_List_LSB_pair_ultra, Hae_List_LSB_pair_diagonal, Hae_List_LSB_pair_crossDoubleLine);
xlswrite('Hae.xlsx', Hae_header_Sheet1);
xlswrite('Hae.xlsx', Image_List, 'Sheet1', 'A2');
xlswrite('Hae.xlsx', Hae_result_List, 'Sheet1', 'B2');
xlswrite('Hae.xlsx', Hae_header_Sheet2, 'Sheet2', 'B1');
xlswrite('Hae.xlsx', Sheet2_1, 'Sheet2', 'A2');
xlswrite('Hae.xlsx', Sheet2_2, 'Sheet2', 'A3');
xlswrite('Hae.xlsx', Sheet2_3, 'Sheet2', 'A4');
xlswrite('Hae.xlsx', Hae_compare_result_List, 'Sheet2', 'B2');


%Start SSIM value compare
[SSIM_header_Sheet1, SSIM_result_List, SSIM_header_Sheet2, SSIM_compare_result_List] = CompareSSIM(SSIM_List_LSB, SSIM_List_LSB_pair, SSIM_List_LSB_pair_dual, SSIM_List_LSB_pair_triple,SSIM_List_LSB_pair_ultra,SSIM_List_LSB_pair_diagonal,SSIM_List_LSB_pair_crossDoubleLine);
xlswrite('SSIM.xlsx', SSIM_header_Sheet1);
xlswrite('SSIM.xlsx', Image_List, 'Sheet1', 'A2');
xlswrite('SSIM.xlsx', SSIM_result_List, 'Sheet1', 'B2');
xlswrite('SSIM.xlsx', SSIM_header_Sheet2, 'Sheet2', 'B1');
xlswrite('SSIM.xlsx', Sheet2_1, 'Sheet2', 'A2');
xlswrite('SSIM.xlsx', Sheet2_2, 'Sheet2', 'A3');
xlswrite('SSIM.xlsx', Sheet2_3, 'Sheet2', 'A4');
xlswrite('SSIM.xlsx', SSIM_compare_result_List, 'Sheet2', 'B2');


% END LSB_run