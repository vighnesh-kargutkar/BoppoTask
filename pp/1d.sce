clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\lena.png")
subplot(1,3,1);imshow(a)
g=imnoise(a,'gaussian')
subplot(1,3,2);imshow(g)
d=imsubtract(a,g)
subplot(1,3,3);imshow(d)
