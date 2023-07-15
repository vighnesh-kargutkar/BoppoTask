clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\moon.tif")
a=im2double(a)
A=fft2(a)
A_shift=fftshift(A)
subplot(2,3,1);imshow(a)
[m,n]=size(a)
A_low=zeros(m,n)
d=zeros(m,n)
DO=50
for i=1:m
    for j=1:n
        d(i,j)=sqrt((i-(m/2))^2+(j-(n/2))^2)
        if d(i,j)<=DO
           filt(i,j)=0
       else
           filt(i,j)=1
        end
    end
end


h=1+filt
b=A_shift.*filt
bb=A_shift.*h
bb=abs(ifft(bb))
b=abs(ifft(b))
subplot(2,2,1);imshow(a)
subplot(2,2,2);imshow(b)
subplot(2,2,3);imshow(bb)
subplot(2,2,4);imshow(a+b)
