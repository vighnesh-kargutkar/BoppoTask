clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\morpex.png")
se=imcreatese('rect',3,3)
e=imerode(a,se)
d=imdilate(a,se)
o=imopen(a,se)
c=imclose(a,se)
subplot(2,3,1);imshow(a)
subplot(2,3,2);imshow(e)
subplot(2,3,3);imshow(d)
subplot(2,3,4);imshow(o)
subplot(2,3,5);imshow(c)