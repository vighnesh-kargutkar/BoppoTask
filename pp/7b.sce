clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\morpex.png")
se=imcreatese('ellipse',3,3)
e=imerode(a,se)
g=a-e
subplot(1,2,1);imshow(a)
subplot(1,2,2);imshow(g)
