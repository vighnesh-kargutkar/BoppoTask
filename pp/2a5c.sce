clc
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\lena.png")
b=double(a)
[m,n]=size(b)
for i=1:8
    f=bitget(b,i)
    subplot(2,4,i)
    imshow(f)
end
