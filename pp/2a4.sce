clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\baboon.png")
b=double(a)
[m,n]=size(b)
subplot(1,2,1);imshow(a)
C=1
gam=1.1
for i=1:m
    for j=1:n
        c(i,j)=C*(b(i,j)^gam)
    end
end
subplot(1,2,2);imshow(uint8(c))
