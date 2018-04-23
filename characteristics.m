f1 = 'Data/known_cap_1.3n.txt';
f2 = 'Data/known_cap_782p.txt';
f3 = 'Data/known_cap_257.7p.txt';
f4 = 'Data/var_res.txt';

dat13 = load(f1);
dat782 = load(f2);
dat2577 = load(f3);
datres = load(f4);

% Defaults for this figure
width = 12;     % Width in inches
height = 6;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz = 24;      % Fontsize
lw = 3;      % LineWidth
msz = 110;       % MarkerSize

cp13 = dat13(:,1); vsig13_1 = dat13(:,2);
vsig13_2 = dat13(:,3); vsig13_3 = dat13(:,4);

cp782 = dat782(:,1); vsig782_1 = dat782(:,2);
vsig782_2 = dat782(:,3); vsig782_3 = dat782(:,4);

cp2577 = dat2577(:,1); vsig2577_1 = dat2577(:,2);
vsig2577_2 = dat2577(:,3); vsig2577_3 = dat2577(:,4);

r = datres(:,1); vsigres = datres(:,3);

h = subplot(1,2,1);
s13_1 = scatter(cp13, vsig13_1, msz, 'black');
s13_1.Marker = '.';
hold on;
s13_2 = scatter(cp13, vsig13_2, msz, 'black');
s13_2.Marker = '.';
s13_3 = scatter(cp13, vsig13_3, msz, 'black');
s13_3.Marker = '.';
plot(cp13, vsig13_1, 'black');

s782_1 = scatter(cp782, vsig782_1, msz, 'red');
s782_1.Marker = '.';
hold on;
s782_2 = scatter(cp782, vsig782_2, msz, 'red');
s782_2.Marker = '.';
s782_3 = scatter(cp782, vsig782_3, msz, 'red');
s782_3.Marker = '.';
plot(cp782, vsig782_3, 'red');

s2577_1 = scatter(cp2577, vsig2577_1, msz, 'green');
s2577_1.Marker = '.';
hold on;
s2577_2 = scatter(cp2577, vsig2577_2, msz, 'green');
s2577_2.Marker = '.';
s2577_3 = scatter(cp2577, vsig2577_3, msz, 'green');
s2577_3.Marker = '.';
plot(cp2577, vsig2577_3, 'green');
xlim([0,1500]);
xlabel('C_{probe} (pF)', 'FontSize', fsz);
ylabel('V_{signal} (V)', 'FontSize', fsz);


lgd = legend([s13_1 s782_1 s2577_1], {'C_{fixed} = 1.3nF', 'C_{fixed} = 782pF', 'C_{fixed} = 257.7pFpF'}, 'location', 'best');
%lgd = legend('-DynamicLegend', 'location', 'northeast');
lgd.FontSize = 18;


h2 = subplot(1,2,2);
scatter(r./1000, vsigres, msz, '.black');
hold on;
plot(r./1000, vsigres, 'black');
xlabel('Resistance of Beverage (k\Omega)', 'FontSize', fsz);
ylabel('V_{signal} (V) for C_{probe} = 113pF', 'FontSize', fsz)




% Here we preserve the size of the image when we save it.
set(gcf,'InvertHardcopy','on');
set(gcf,'PaperUnits', 'inches');
set(gca,'FontSize', 24);
papersize = get(gcf, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(gcf, 'color', 'w');

set(gcf,'PaperPosition', myfiguresize);

% Save the file as PNG
print('temp','-dpng','-r300');