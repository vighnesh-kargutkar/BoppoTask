import numpy as np
import decimal
import math
np.set_printoptions(precision=4)
v1=np.array([0.6,-0.3])
v2=np.array([-0.1,0.4])
w=np.array([-0.2,0.4,0.1])
b=np.array([0.3,0.5])
x=np.array([0,1])
alpha=0.25
zin=[]
print("Vighnesh Kargutkar MLDC 5")
print("calculate net input to z layer")
for i in range(0,2):
 zin.append(round(b[i]+x[0]*v1[i]+x[1]*v2[i],4))
print("zin=",zin)
z=[]
print("Apply activation function to calculate output")
for i in range(0,2):
 z.append(round(1/(1+math.exp(-zin[i])),4))
print("z=",z)
print("calculate net input to output layer")
yin=w[0]+z[0]*w[1]+z[1]*w[2]
print("yin=",yin)
print("calculate net output")
y=round(1/(1+math.exp(-yin)),4)
print("y=",y)
fyin=y*(1-y)
dk=round((1-y)*fyin,4)
print("dk",dk)
dw1=alpha*dk*z[0]
dw2=alpha*dk*z[1]
dw0=alpha*dk
print("compute error portion in delta")
din=[]
for i in range(1,3):
 din.append(dk*w[i])
print("din=",din)
fzin=[]
d=[]
print("error in delta")
for i in range(0,2):
 fzin.append(round(z[i] * (1-z[i]),4))
 d.append(round(din[i]*fzin[i],4))
print("fzin=",fzin)
print("d=",d)
dv=[[0,0],[0,0],[0,0]]
print("Change in weihts between input and hidden layer")
for i in range(0,3):
 for j in range(0,2):
     if i<=1:
         dv[i][j]=alpha*d[j]*x[i]
     else:
         dv[i][j]=alpha*d[j]
print(dv)
print("Final weights of network")
for i in range(0,2):
 v1[i]=v1[i]+dv[0][i]
print("v1=",v1)
for i in range(0,2):
 v2[i]=v2[i]+dv[1][i]
print("v2=",v2)
for i in range(0,2):
 b[i]=b[i]+dv[2][i]
print("b=",b)
w[1]=w[1]+dw1
w[2]=w[2]+dw2
w[0]=w[0]+dw0
print("w=",w)
