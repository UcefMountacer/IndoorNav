
num=xlsread('sample2fast');%original
d=xlsread('velocity2correctedfast');%corrected velocity manually
i=1:1:589;
time=num(i,2);
fe=1000;
cutoff=27/fe;
z=num(i,7);
b_z = fir1(50,cutoff,'high');
%z_filtred=filter(b_z,1,z);
vel=d(i,2);
velocity=filter(b_z,1,z);
plot(time,velocity)
dist=trapz(time,velocity)
kalman(6,0.025)




