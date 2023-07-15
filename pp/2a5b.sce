clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\Lena_dark.png")
b=double(a)
[m,n]=size(b)
subplot(1,2,1);imshow(a)
x1=input("x1")
x2=input("x2")
c=zeros(m,n)
for i=1:m
    for j=1:n
        if b(i,j)>=x1 && b(i,j)<=x2
            c(i,j)=255
        else
            c(i,j)=b(i,j)
        end
    end
end

subplot(1,2,2);imshow(uint8(c))
