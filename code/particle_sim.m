function rval=particle_sim(inval)

% The script particle_sim simulates plasma particles in a configurable
% magnetic and electric field.
%
% Written by Thomas Oswald, November 2009  

clear;
B=[0,0,1e-8];
E=[0,0,0];

v=[1,0,1];
r=[0,0,0];

Tspan=0.00001;
dt=0.0000000001;

t=0;
n=1;

while(t<=Tspan)
    rr(n,:)=r;
    r=r+v*dt;
    v=v+force(B,E,v)*dt;
    
    t=t+dt;
    n=n+1;
end


plot3(rr(:,1),rr(:,2),rr(:,3));
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');

return

function a=force(B,E,v)
    me=1.109e-31;
    qe=-1.602e-16;
    epsilon0=8.854e-12;
    
    a=qe/me*(E+cross(v,B));
return % function