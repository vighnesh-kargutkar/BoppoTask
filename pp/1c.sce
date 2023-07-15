clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\lena.png")
a=rgb2gray(a)
k=[1,2,3,4,5,6,7,8]
for i=1:length(k)
    d=2^i
    z=round(a/d)
    subplot(3,3,i)
    imshow(z*d)
    
end
