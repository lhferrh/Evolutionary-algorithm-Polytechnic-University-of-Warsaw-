%Project1: Find minimum of Rosenbrock algorithm

%Load data
load('dataProyect1.mat');


%%Optimization with a Least Squares Solver
%The recommended solver for a nonlinear sum of squares is lsqnonlin. This solver is even 
%more efficient than fminunc without a gradient for this special class of problems. To use 
%lsqnonlin, do not write your objective as a sum of squares. Instead, write the underlying
%vector that lsqnonlin internally squares and sums.

nombre='RosenbrockLeastSquaresSolver';

fun = @(x)(1-x(1)-a).^2 + 100*(x(2)-b-(x(1)-a).^2).^2;
vfun = @(x)[  10*(x(2)-b-(x(1)-a).^2),(1-x(1)-a)];

options = optimoptions('lsqnonlin','Display','off','OutputFcn',@bananaout);

for i=1:(size(startPoints,1))
    x0 = startPoints(i,:)';
    [x,resnorm,residual,eflag,output] = lsqnonlin(vfun,x0,[],[],options);
    title(strjoin({nombre,'start point (', num2str(x0(1)),',', num2str(x0(2)),')'}))
    print(strjoin( {'Plot',nombre, num2str(i)}),'-djpeg');
    Fcount = output.funcCount;
    disp(['Number of function evaluations for fminunc was ',num2str(Fcount)])
    disp(['Number of solver iterations for fminunc was ',num2str(output.iterations)])
    datasWord(i,3)=Fcount;
    datasWord(i,4)=output.iterations;
    datasWord(i,5)=fun(x);
    
    
    %% Monitor Optimization Process
    % Set options to monitor the process as |fminsearch| attempts to locate a
    % minimum.
    %%
    % Set options to plot the objective function at each iteration.
    options2 = optimoptions('lsqnonlin','Display','off','OutputFcn',@plotValueIteration);
 
    [x,resnorm,residual,eflag,output] = lsqnonlin(vfun,x0,[],[],options2);
    
    title(strjoin( {nombre,' Start point  (', num2str(x0(1)) ,',', num2str(x0(2)),')' }))

    print(strjoin( {'Plot',nombre,'OptimizationProcess', num2str(i)}),'-djpeg');
    
     
end


datasWord