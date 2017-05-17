

%Project1: Find minimum of Rosenbrock algorithm

%Load data
load('dataProyect1.mat');

%% Banana Function Minimization
% Optimization Without Derivatives
% The |fminsearch| function finds a minimum for a problem without
% constraints. It uses an algorithm that does not estimate any derivatives
% of the objective function. Rather, it uses a geometric search method
% described in <docid:optim_ug.brnoxyk>.
%
% Minimize the banana function using |fminsearch|. Include an output
% function to report the sequence of iterations

%% Optimization Without Derivatives
% The |fminsearch| function finds a minimum for a problem without
% constraints. It uses an algorithm that does not estimate any derivatives
% of the objective function. Rather, it uses a geometric search method
% described in <docid:optim_ug.brnoxyk>.
%
% Minimize the banana function using |fminsearch|. Include an output
% function to report the sequence of iterations.

nombre='fminsearch';
fun = @(x)(1-x(1)-a).^2 + 100*(x(2)-b-(x(1)-a).^2).^2;
options = optimset('OutputFcn',@bananaout,'Display','iter');

for i=1:(size(startPoints,1))
    x0 = startPoints(i,:)';
    [x,fval,eflag,output] = fminsearch(fun,x0,options);
    title(strjoin({nombre,'start point (', num2str(x0(1)),',', num2str(x0(2)),')'}))
    print(strjoin( {'Plotfminsearch', num2str(i)}),'-djpeg');
    Fcount = output.funcCount;
    disp(['Number of function evaluations for fminsearch was ',num2str(Fcount)])
    disp(['Number of solver iterations for fminsearch was ',num2str(output.iterations)])
    
    
    %% Monitor Optimization Process
    % Set options to monitor the process as |fminsearch| attempts to locate a
    % minimum.
    %%
    % Set options to plot the objective function at each iteration.
    options2 = optimset('OutputFcn',@plotValueIteration);

    % function using |fminsearch|.
    x = fminsearch(fun,x0,options2)
    title(strjoin( {nombre,' optimization history. Start point  (', num2str(x0(1)) ,',', num2str(x0(2)),')' }))

    print(strjoin( {'PlotfminsearchOptimizationProcess', num2str(i)}),'-djpeg');
    
     
end


