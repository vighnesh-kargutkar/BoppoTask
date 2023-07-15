clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\big_sq.png")
se=imcreatese('rect',55,55)
e=imerode(a,se)
d=imdilate(a,se)
g=d-e
subplot(1,2,1);imshow(a)
subplot(1,2,2);imshow(g)
