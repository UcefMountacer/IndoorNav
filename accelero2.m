
num=xlsread('28m');
i=1:1:1841;
time=num(i,2);
fe=1000;
cutoff_int=62.47/fe;
cutoff=300/fe;
%-----------------------
%acceleration filtered from noise
f1=fir1(50,cutoff,'low');
accx=num(i,5);
accy=num(i,6);
accz=num(i,7);
ax=filter(f1,1,accx);
ay=filter(f1,1,accy);
az=filter(f1,1,accz);
figure
subplot(131);
plot(i,ax)
subplot(132);
plot(i,ay)
subplot(133);
plot(i,az)
%-----------------------
vx=cumtrapz(time,ax);
vy=cumtrapz(time,ay);
vz=cumtrapz(time,az);
%-----------------------
%position filtered from drift caused by the integration
x=cumtrapz(time,vx);
y=cumtrapz(time,vy);
z=cumtrapz(time,vz);
f2=fir1(50,cutoff_int,'high');
xf=filter(f2,1,x);
yf=filter(f2,1,y);
zf=filter(f2,1,z);
% figure
% subplot(131);
% plot(i,xf)
% subplot(132);
% plot(i,yf)
% subplot(133);
% plot(i,zf)
%-----------------------
distance=0.8*yf + 0.1*xf + 0.1*zf;
figure
plot(time,distance,'b')
xlabel('TIME in seconds') 
ylabel('distance in meter') 
title('cumulative traveled distance over time using the equation')
