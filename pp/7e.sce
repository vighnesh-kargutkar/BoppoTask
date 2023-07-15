clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\mri1.jpg")
se=imcreatese('ellipse',10,10)
o=imopen(a,se)
th=a-o
c=imclose(a,se)
bh=c-a
subplot(2,2,1);imshow(a)
subplot(2,2,2);imshow(th)
subplot(2,2,3);imshow(bh)
