clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\balloons.png")
subplot(1,3,1);imshow(a)
g=imnoise(a,'salt & pepper')
f=fspecial('average',3)
ff=imfilter(g,f)
subplot(1,3,2);imshow(g)
subplot(1,3,3);imshow(ff)
