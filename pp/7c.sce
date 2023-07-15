clc;
a=[ 0 0 0 0 0 0;
    0 0 1 1 0 0;
    0 0 1 1 0 0;
    0 0 0 0 0 0;
    0 0 1 1 0 0;
    0 0 0 0 0 0]
    b=im2bw(a,0.5)
c=[0 0 0 0 ;
    0  1 1 0;
    0  1 1 0 ;
    0  0 0 0 ]
d=imhitmiss(b,c)
subplot(1,2,1);imshow(b)
subplot(1,2,2);imshow(d)
