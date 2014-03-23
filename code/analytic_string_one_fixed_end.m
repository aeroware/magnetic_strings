% this script solves the string equation analytically and prints the result
% 
clear

rad=pi/180;

% finite string


l=pi/2;
c=1;		%wave speed
nl=200;
dl=l/nl;

x=linspace(0,l,nl);

% initial condition: triangular shape

order=input("Order:");

A0=0;
u(1:nl)=0;
A(1,order)=0;
B(1,order)=0;


% initial conditions

a=cos(x);
b=0*x;

plot(x,a);
title('initial condition: a(x)');

figure;
plot(x,b);
title('initial condition: b(x)');

% Fourier coefficients

for n=1:order
	% integral 1
	I1=0;
	for m=2:(nl-1)
		I1=I1+a(m)*cos(pi*(2*n-1)*x(m)/(2*l))*dl;
	end
		
	I1=I1+0.5*a(1)*cos(pi*(2*n-1)*x(1)/(2*l))*dl;
	I1=I1+0.5*a(nl)*cos(pi*(2*n-1)*x(nl)/(2*l))*dl;
		
	A(n)=I1*2/l;
	
	% integral 2
	
	I2=0;
	for m=2:(nl-1)
		I2=I2+b(m)*cos(pi*(2*n-1)*x(m)/(2*l))*dl;
	end
		
	I2=I2+0.5*b(1)*cos(pi*(2*n-1)*x(1)/(2*l))*dl;
	I2=I2+0.5*b(nl)*cos(pi*(2*n-1)*x(nl)/(2*l))*dl;
	
	B(n)=I2*4/(pi*(2*n-1)*c);
	
	% u at t=0
	
	u=u+cos((pi*(2*n-1).*x)/(2*l))*(A(n));
end
	
figure;
plot(x,u);
title('approximated function at t=0');
xlim([0,l]);

t=input("time:");

while t>=0
	u(1:nl)=0;
	for n=1:order
		u=u+cos((pi*(2*n-1)*x)/(2*l))*...
			(A(n)*cos((pi*(2*n-1)*c*t)/(2*l))...
			+B(n)*sin((pi*(2*n-1)*c*t)/(2*l)));
	end
		
	figure;
	plot(x,u);
	xlim([0,l]);
	ylim([-1,1]);
	title(sprintf('Solution of 1 ended string at t=%f',t));
	print (sprintf('/home/tho/Dokumente/science/magnetic_strings/one_fixed_end_analytic_t%f.eps',t), "-color", "-deps");
	t=input("time:");
end


