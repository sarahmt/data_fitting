f = 'Data/controldat_4-22-18.txt';
data = load(f);

abv = data(:,1);
vsig = data(:,2);
% tab = data(:,3);
% lok = data(:,4);

err = tab - abv;

% format long
% 
% b1 = abv\vsig
% 
x = (0:1:50);
% y = vsig(1) - x.*b1;
% plot(x,y); hold on;
% scatter(abv,vsig)


p = polyfit(abv,vsig,1)
% plot(p(2) + x.*p(1));
% hold on;
% scatter(abv,vsig);