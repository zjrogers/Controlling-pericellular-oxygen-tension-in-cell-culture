%p24, 0.7 mL, 57000 cells per well, 8% O2 gas phase

x = linspace(0,0.33961,10); %cm2
t = linspace(0,50,3000);

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

% ocr = amol / cell * s
% pcell = cells / vol (L)
% final units = mmHg / hr


function [c,f,s] = pdex1pde(x,t,u,dudx)
pcell = 57000/0.0007;
ocr = 450; 
vmax = (pcell*ocr*3600)*0.77/(1*10^12);
km = 1;
D = 0.09684; %cm^2/hr
c = 1/D; 
f = dudx;
s = -((vmax*u)/(km+u));
end

function u0 = pdex1ic(x)
Co = 160; %mmHg
u0 = Co; 
end

function[pl, ql, pr, qr] = pdex1bc(xl, ul, xr, ur, t)
a = 2.06; %cm^2
D = 0.09684; %cm^2/hr
kl = 0.1; %1/hr
Cgas = 61.6; %mmHg
pl = 0;
ql = 1;
pr = kl*a*(ur-Cgas);
qr = D;
end



