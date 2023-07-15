clc
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\lena.png")
b=double(a)
[m,n]=size(b)
h=zeros(m,n)
for i=1:1:m
    for j=1:1:n
        if b(i,j)==0
            c(i,j)=1
        end
        t=b(i,j)
        h(t)=h(t)+1
    end
end
subplot(1,2,1);imshow(a)
subplot(1,2,2);bar(h)
