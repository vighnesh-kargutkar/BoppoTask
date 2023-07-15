clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\cameraman.tif")
a=im2double(a)
A=fft2(a)
A_shift=fftshift(A)
subplot(2,3,1);imshow(a)
subplot(2,3,2);imshow(uint8(abs(A)))
subplot(2,3,3);imshow(uint8(abs(A_shift)))
[m,n]=size(a)
A_low=zeros(m,n)
d=zeros(m,n)
DO=50
for i=1:m
    for j=1:n
        d(i,j)=sqrt((i-(m/2))^2+(j-(n/2))^2)
        if d(i,j)<=DO
           A_low(i,j)=A_shift(i,j)
           filt(i,j)=1
       else
           A_low(i,j)=0
           filt(i,j)=0
        end
    end
end

subplot(2,3,4);imshow(filt)
subplot(2,3,5);mesh(filt)
b=fftshift(A_low)
bb=ifft(b)
subplot(2,3,6);imshow((bb))
