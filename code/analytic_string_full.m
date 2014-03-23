% this script solves the string equation analytically and prints the result
% 

rad=pi/180;

% finite string


l=1;

x=linspace(0,1,100);

a=1/8*sin(pi*x/l)+1/4*sin(3*pi*x/l);

plot(x,a);

t=linspace(0,5,100);

u_05=1/8*cos(pi*t/l)-1/4*cos(3*pi*t/l);

figure
plot(t,u_05);


t2=1;
nt=input('n=');

while nt>0
	for n=1:nt
		t2=t2+1/20;
    		u=1/8*sin(pi*x/l)*cos(pi*t2/l)+1/4*sin(3*pi*x/l)*sin(pi*t2/l);
    		figure
    		plot(x,u);
    		
	end
	nt=input('n=');
end 