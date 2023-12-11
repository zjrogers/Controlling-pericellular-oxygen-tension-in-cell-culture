%Raw dataset

%rawtable = xlsread('p6 closed raw data.xlsx','Sheet1');

%x = rawtable(:,1);
%y1 = rawtable(:,2);
%y2 = rawtable(:,3);
%y3 = rawtable(:,4);
%y4 = rawtable(:,5);

%hold on
%plot(x,y4,'Linewidth', 3)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xi = 0;
tau = 0:0.01:40;
theta = zeros(size(tau));
C = zeros(size(tau));
t = zeros(size(tau));

%constants

kl = 0.02;
Co = 140; %mmHg
Cgas = 7.7; %mmHg
L = 0.3118138; %cm
a = 9.6211; %cm^2
D = 0.09684; %cm^2/hr

syms x
eigen = double(findzeros(x == (kl*a/D)*cot(x), [0,200]));

for k=1:numel(eigen)
    theta = theta + ((2*sin(eigen(k))*exp(-(eigen(k)^2)*tau)*cos(eigen(k)*xi))/(cos(eigen(k))*sin(eigen(k))+eigen(k)));
end

 C = theta*(Co - Cgas) + Cgas;
 t = (tau*L^2)/D;

%plot(t,C,'Linewidth', 3)
%hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%legend('p6, Experimental','p6, Model')
%xlabel('Time (Hours)', 'FontSize',25, 'FontWeight','bold')
%ylabel('Concentration (mmHg)', 'FontSize',25, 'FontWeight','bold')
%title('p6 Closed', 'FontSize',35, 'FontWeight','bold')
%set(gca,'FontSize',25,'FontWeight','bold')
%set(gca,'YTick',(0:20:160))
%set(gca,'XTick',(0:5:40))
%ylim([0 160])
%xlim([0 40])
%grid on