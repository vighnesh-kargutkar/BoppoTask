clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\balloons.png")
subplot(1,3,1);imshow(a)
g=imnoise(a,'gaussian',0.02)
w=imwiener2(g,[3,3],0.2)

subplot(1,3,2);imshow(g)
subplot(1,3,3);imshow(w)
