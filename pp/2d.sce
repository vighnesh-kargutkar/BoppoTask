clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\morpex.png")
subplot(1,2,1);imshow(a)
b=double(a)
[m,n]=size(b)
w=[1,1,1;1,1,1;1,1,1]
for i=2:m-1
    for j=2:n-1
        b(i,j)=(w(1)*b(i-1,j+1)+w(2)*b(i,j+1)+w(3)*b(i+1,j+1)+w(4)*b(i-1,j)+w(5)*b(i,j)+w(6)*b(i+1,j)+w(7)*b(i-1,j-1)+w(8)*b(i,j-1)+w(9)*b(i+1,j-1))
    end
    
end
subplot(1,2,2);imshow(uint8(b))
