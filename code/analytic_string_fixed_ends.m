% this script solves the string equation analytically and prints the result
% 
clear
rad=pi/180;

% finite string


l=1;
c=1;		%wave speed
x=linspace(0,1,200);

% initial condition: triangular shape

order=input("Order:");

A0=0;
u(1:200)=0;
A(1,order)=0;

for n=1:floor(order/2)
	A(2*n-1)=((-1)^(n-1))/((2*n-1)^2);
	
	% u at t=0
	u=u+A(2*n-1)*sin((pi*(2*n-1).*x)/(l));
end
	
u=u*4*l/pi^2;

plot(u);
ylim([-1.5,1.5]);

t=input("time:");

while t>=0
	u(1:200)=0;
	for n=1:floor(order/2)
		A(2*n-1)=((-1)^(n-1))/((2*n-1)^2);
	
	% u at t
		u=u+A(2*n-1)*sin((pi*(2*n-1).*x)/(l))*cos((pi*(2*n-1).*c*t)/(l));
	end
		
	plot(u);
	ylim([-1.5,1.5]);
	title(sprintf('t=%f',t));
	print (sprintf('/home/tho/Dokumente/science/magnetic_strings/fixed_ends_analytic_t%f.eps',t), "-color", "-deps");
	t=input("time:");
end
	
