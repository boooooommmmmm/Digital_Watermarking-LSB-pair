imageList = dir('grayscale photo\*.jpg');
imageNum = length(imageList);

PSNR_List_LSB = zeros(imageNum, 1);
PSNR_List_LSB_DES = zeros(imageNum, 1);
PSNR_List_LSB_pair = zeros(imageNum, 1);
PSNR_List_LSB_pair1 = zeros(imageNum, 1);

KL_List_LSB = zeros(imageNum, 1);
KL_List_LSB_DES = zeros(imageNum, 1);
KL_List_LSB_pair = zeros(imageNum, 1);
KL_List_LSB_pair1 = zeros(imageNum, 1);

Hae_List_LSB = zeros(imageNum, 1);
Hae_List_LSB_DES = zeros(imageNum, 1);
Hae_List_LSB_pair = zeros(imageNum, 1);
Hae_List_LSB_pair1 = zeros(imageNum, 1);

Image_List = cell(imageNum, 1);

for i = 1: imageNum
    hostImage = imageList(i).name;
    index = strfind(hostImage, '.');                        %index is the digit+1 of image name. e.g 100=>4; 10=>3. First (index-1) stand for image name, the last stand for dot ".".
    imageName = hostImage(1:index - 1);                     %image name is an char list, 1 to index-1 is the image name, exit in ASCII stand. e.g 8=>56; 2=>50
    Image_List{i} = imageName;
    hostImage = strcat('grayscale photo\', hostImage);      %hostImage = path
    [hieght, width] = LSB_embed(hostImage, 'watermark.txt', strcat('LSB photo\', strcat(imageName, '.png')));
    LSB_extract(hieght, width, strcat('LSB photo\', strcat(imageName, '.png')), strcat('extract\',strcat(imageName, '.txt')));
    fprintf('Processing... (%d of %d) has been done...\n', i,imageNum);

    % read host image
    hostImg = imread(hostImage);
    watermarkedImg = imread(strcat('LSB photo\', strcat(imageName, '.png')));
end

