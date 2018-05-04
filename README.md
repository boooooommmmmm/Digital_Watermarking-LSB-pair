# README

![downloads here](https://img.shields.io/github/downloads/boooooommmmmm/Digital_Watermarking-LSB-pair/latest/total.svg?style=social)  ![stars here](https://img.shields.io/github/stars/boooooommmmmm/Digital_Watermarking-LSB-pair.svg)  ![license here](https://img.shields.io/github/license/boooooommmmmm/Digital_Watermarking-LSB-pair.svg)  ![language here](https://img.shields.io/github/languages/top/boooooommmmmm/Digital_Watermarking-LSB-pair.svg)  ![last commit here](https://img.shields.io/github/last-commit/boooooommmmmm/Digital_Watermarking-LSB-pair.svg)

This code is the application of **improved LSB pair replacement** approaches to *reduce distortion* of watermarking image.

This code is developed in MATLAB.

<br />

### Getting everything ready

Before running the code, you need get following things ready:

* MATLAB (this code in tested by R2018a)
* *Grayscale* images need to be stored in `grayscale photo` folder.
* A `watermark.txt` txt file contains the watermarking message, it need located in `root` folder.
* Following empty folders to store output watermarked images. 

![pic1 here](pic\1.png)

<br />

### How to run it

[`LSB_RUN`](code/LSB_RUN.m)is the only file which is executable in MATLAB. While running it, it will automatically reading all image files in the `grayscale photo` folder. 

The code will using following watermarking methods:

> Regular LSB replacement
>
> LSB pair
>
> LSB dual pair
>
> LSB triple pair
>
> LSB ultra pair

After finishing watermarking, the following measurement methods will be used to evaluate the performance of each approaches:

>PSNR
>
>SSIM
>
>Hae (histogram absolute error)

<br />

##### Outputs

* Watermarked images for each methods
* Extract message for each methods
* Three Excel documents for three measurement results

<br />



### Knowledge based 



### Result & Evaluation



### Future work





------

END