clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\measure_gray.jpg")
dct3=imdct(a)

subplot(1,2,1);imshow(a)
subplot(1,2,2);imshow(dct3,rainbowcolormap(32))
