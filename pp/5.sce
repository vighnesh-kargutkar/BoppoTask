clc;
a=imread("C:\Program Files\scilab-6.1.1\IPCV\images\balloons.png")
[m,n]=size(a)
R=zeros(m,n,3)
G=zeros(m,n,3)
B=zeros(m,n,3)

R(:,:,1)=a(:,:,1)
G(:,:,2)=a(:,:,2)
B(:,:,3)=a(:,:,3)

subplot(2,2,1);imshow(uint8(R))
subplot(2,2,2);imshow(uint8(G))
subplot(2,2,3);imshow(uint8(B))
bin=256

[yR,x]=imhist(a(:,:,1),bin)
[yG,x]=imhist(a(:,:,2),bin)
[yB,x]=imhist(a(:,:,3),bin)
subplot(2,2,4);plot(x,yR,x,yG,x,yB,'Linewidth',2)
