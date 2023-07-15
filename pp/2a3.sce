clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\baboon.png")
b=double(a)
[m,n]=size(b)
subplot(1,2,1);imshow(a)
C=10
for i=1:m
    for j=1:n
        c(i,j)=C*log(1+b(i,j))
    end
end
subplot(1,2,2);imshow(uint8(c))
