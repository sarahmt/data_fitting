% DATA FILE %
f = 'Data/cfix_782pF_fitting_data.txt';
% KNOWN CONSTANTS %
CFIX = 782; %pF
VREF = 1.9; %V

dat = load(f);
cpdat = dat(:,1);
vsdat = dat(:,2);

k1 = 1.2813; % if Vref is really 1.8459
k2 = 37.8985;
k3 = 8.4055e+04;
k4 = 1.4432;

x = [k1 k2 k3 k4];
F = @(x,xdata)x(1) * VREF * (1 - ( x(2)*CFIX ./ (x(2)*CFIX + x(3) + xdata.^(x(4)))));

plot(cpdat, F(x,cpdat));
hold on;
scatter(cpdat,vsdat);
