clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\checkerbox.png")
subplot(1,3,1);imshow(a)
a=double(a)
A=fft2(a)
A_shift=fftshift(A)
subplot(1,3,2);imshow(A)
subplot(1,3,3);imshow(A_shift)
