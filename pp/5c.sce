clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\balloons.png")
b=rgb2gray(a)

subplot(1,3,1);imshow(a)
subplot(1,3,2);imshow(b)
subplot(1,3,3);imshow(b,jetcolormap(256))
