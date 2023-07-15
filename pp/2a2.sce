clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\baboon.png")
b=double(a)
[m,n]=size(b)
subplot(1,2,1);imshow(a)
D=100
for i=1:m
    for j=1:n
        if b(i,j)<=D
            c(i,j)=0
        else
            c(i,j)=255
        end
        end

end
subplot(1,2,2);imshow(c)
