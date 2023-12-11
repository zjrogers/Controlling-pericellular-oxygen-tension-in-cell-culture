

x = linspace(0,0.3118138,10); %cm2
t = linspace(0,48,5760);

% m = 0 is Cartesian
%pdex1pde = PDE
%pdex1ic = IC
%pdex1bc = BCs
% u = sol(i, j, k) where t(i) j(k) and u(k)


m = 0;
sol = pdepe(m, @pdex1pde, @pdex1ic, @pdex1bc, x, t);
%u = sol(:,:,1);

%surf(x,t,u)
%title('Numerical solution computed with 20 mesh points')
%xlabel('Distance x')
%ylabel('Time t')

%plot(t,u(end,:))
%title('Solution at t = 2')
%legend('Numerical, 20 mesh points','Analytical','Location','South')
%xlabel('Distance x')
%ylabel('u(x,2)')

function [c,f,s] = pdex1pde(x,t,u,dudx)
D = 0.09864; %cm^2/hr
c = 1/D; 
f = dudx;
s = 0;
end

function u0 = pdex1ic(x)
Co = 133.4; %mmHg
u0 = Co; 
end

function[pl, ql, pr, qr] = pdex1bc(xl, ul, xr, ur, t)
a = 9.6211; %cm^2
D = 0.09864; %cm^2/hr
kl = 0.125; %1/hr
Cgas = 77.0; %mmHg
pl = 0;
ql = 1;
pr = kl*a*(ur-Cgas);
qr = D;
end

%0.09864



