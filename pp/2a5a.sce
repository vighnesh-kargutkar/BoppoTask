clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\Lena_dark.png")
b=double(a)
[m,n]=size(b)
subplot(1,2,1);imshow(a)
D=100
r1=input("r1")
s1=input("s1")
r2=input("r2")
s2=input("s2")
M=s1/r1
N=(s2-s1)/(r2-r1)
O=(255-s2)/(255-r2)
for i=1:m
    for j=1:n
        if b(i,j)>0 && b(i,j)<r1
            c(i,j)=M*b(i,j)
        else if b(i,j)>r1 && b(i,j)<r2
            c(i,j)=N*b(i,j)-N*r1+s1
        else if b(i,j)>r2 && b(i,j)<255
            c(i,j)=O*(b(i,j)-r1)+s2
    end
end
end
end
end

subplot(1,2,2);imshow(uint8(c))
