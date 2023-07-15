clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\lena.png")

subplot(2,3,1);imshow(a)
i1=imresize(a,0.5)
subplot(2,3,2);imshow(i1)

i1=imresize(a,0.25)
subplot(2,3,3);imshow(i1)
i1=imresize(a,0.125)
subplot(2,3,4);imshow(i1)
i1=imresize(a,0.0625)
subplot(2,3,5);imshow(i1)
i1=imresize(a,0.03125)
subplot(2,3,6);imshow(i1)
