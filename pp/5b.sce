clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\balloons.png")
hsv=rgb2hsv(a)
cmy=imcomplement(a)

subplot(1,3,1);imshow(a)
subplot(1,3,2);imshow(hsv)
subplot(1,3,3);imshow(cmy)
