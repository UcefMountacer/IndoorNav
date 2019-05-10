
num=xlsread('28m');
n=length(num);
i=1:1:n;
time=num(i,2);
%*******************
Dt=time(n);
%[F] = cutoff_finder(Dt);
%**********************
fe=2000;
cutoff_int=126/fe;
%cutoff_int = ((3.4845 + 0.1523*sqrt(fe))^2)/fe;
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
% figure
% subplot(131);
% plot(i,ax)
% subplot(132);
% plot(i,ay)
% subplot(133);
% plot(i,az)
%-----------------------
vx=cumtrapz(time,ax);
vy=cumtrapz(time,ay);
vz=cumtrapz(time,az);

%test if the object is moving or not, if so, time should be frozen 
%V=sqrt(vx.^2 + vy.^2 + vz.^2);
%tab = [time,V];
%[int] = tintegrale( tab )
%-----------------------
%position filtered from drift caused by the integration
x=cumtrapz(time,vx);
%x=simpsons(vx,0,vx(n)+1,[]);
y=cumtrapz(time,vy);
%y=simpsons(vy,0,vy(n)+1,[]);
z=cumtrapz(time,vz);
%z=simpsons(vz,0,vz(n)+1,[]);
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
d=distance(n);
% d
% int
% d-int
% figure
% plot(time,distance,'b')
% xlabel('TIME in seconds') 
% ylabel('distance in meter') 
% title('cumulative traveled distance over time using the equation')
