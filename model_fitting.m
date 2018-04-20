f = 'Data/fitting_dat.txt';
data = load(f);
cpdat = data(:,1);
vsdat = data(:,2);



% fit to the following equation: %
% vs = VR * (1 - CF / (CF + CS + cp));


% define parameters %
% x(1) = CF;
% x(2) = CS; 
% x(3) = VR;

F = @(x,xdata)x(3) * (1 - (x(1) ./ (x(1) + x(2) + xdata.^(x(4)))));
x0 = [1300 2 2 0.5];

[x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,cpdat,vsdat);

plot(cpdat, F(x,cpdat));
hold on;
scatter(cpdat,vsdat);




% %%% compute theoretical using patent model %%%%
% vref = 1.9; %V
% cf = zeros(size(abv0)); 
% cs = cf + 600E-12;
% cf = cf + 1.3E-9; %F
% 
% cstart = 1E-12;
% cfinal = 1E-8;
% l = size(abv0);
% step = (cfinal - cstart)/l(1); 
% cp = (cstart:step:cfinal); cp = cp'; cp(1) = [];
% denom = cf + cp + cs;
% right = cf./denom; right = 1 - right;
% vsigtheo = vref.*right;
% 
% scatter(cp, vsigtheo);
% 
