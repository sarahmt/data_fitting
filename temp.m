f = 'Data/fitting_dat.txt';
data = load(f);
cpdat = data(:,1);
vsdat = data(:,2);

f = 'Data/cfix_782pF_fitting_data.txt';
data = load(f);
cpdat2 = data(:,1);
vsdat2 = data(:,2);

f = 'Data/cfix_257.7pF_fitting_data.txt';
data = load(f);
cpdat3 = data(:,1);
vsdat3 = data(:,2);

% % 
% scatter(cpdat,vsdat,'DisplayName', 'C_fix = 1.3nF')
% hold on 
% scatter(cpdat2,vsdat2,'DisplayName', 'C_fix = 782pF');
% scatter(cpdat3,vsdat3,'DisplayName', 'C_fix = 257.7pF');
% legend('-DynamicLegend');
%xlim([0,500])

% 
plot(cpdat,vsdat,'DisplayName', 'C_fix = 1.3nF')
hold on 
plot(cpdat2,vsdat2,'DisplayName', 'C_fix = 782pF');
plot(cpdat3,vsdat3,'DisplayName', 'C_fix = 257.7pF');
legend('-DynamicLegend');