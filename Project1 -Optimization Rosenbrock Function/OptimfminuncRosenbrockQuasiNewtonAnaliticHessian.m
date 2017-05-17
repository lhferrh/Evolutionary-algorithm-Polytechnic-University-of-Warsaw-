%Project1: Find minimum of Rosenbrock algorithm

%Load data
load('dataProyect1.mat');



%% Optimization with Estimated Derivatives
% The |fminunc| function finds a minimum for a problem without constraints.
% It uses a derivative-based algorithm. The algorithm attempts to estimate
% not only the first derivative of the objective function, but also the
% matrix of second derivatives. |fminunc| is usually more efficient than
% |fminsearch|.
%
% Minimize the banana function using |fminunc|.
%%Optimization with Analytic Hessian
%If you provide a Hessian (matrix of second derivatives), fminunc can solve 
%the optimization using even fewer function evaluations. For this problem the
%results are the same with or without the Hessian.

nombre='fminuncQuasiNewtonAnalyticHessian';
%Hessian calculate 
%fun = @(x,y)(1-x-1.5).^2 + 100*(y-1.5-(x-1.5).^2).^2;
%syms x y
%hessian(fun,[x,y]) 
%ans = %[ 400*(x - 3/2)^2 - 400*y + 200*(2*x - 3)^2 + 602, 600 - 400*x]
%[                                     600 - 400*x,         200]
%Gradient calculate using gradient(fun,[x,y])


fun = @(x)(1-x(1)-a).^2 + 100*(x(2)-b-(x(1)-a).^2).^2;
grad = @(x)[2*x(1) + 200*(2*x(1) - 3)*((x(1) - 3/2)^2 - x(2) + 3/2) + 1;
                   200*x(2) - 200*(x(1) - 3/2)^2 - 300];
hess = @(x)[[ 400*(x(1) - 3/2)^2 - 400*x(2) + 200*(2*x(1) - 3)^2 + 602, 600 - 400*x(1)]
[                                     600 - 400*x(1),         200]];

fungradhess = @(x)deal(fun(x),grad(x),hess(x));
options = optimoptions('fminunc','Display','off','OutputFcn',@bananaout,'Algorithm','quasi-newton');
options = optimoptions(options,'HessUpdate','steepdesc','MaxFunctionEvaluations',600);
options = resetoptions(options,{'HessUpdate','MaxFunctionEvaluations'});
options = optimoptions(options,'SpecifyObjectiveGradient',true,'Algorithm','trust-region');
options.HessianFcn = 'objective';

for i=1:(size(startPoints,1))
    x0 = startPoints(i,:)';
    [x,fval,eflag,output] = fminunc(fungradhess,x0,options);
    title(strjoin({nombre,'start point (', num2str(x0(1)),',', num2str(x0(2)),')'}))
    %print(strjoin( {'Plot',nombre, num2str(i)}),'-djpeg');
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
    options2 = optimoptions('fminunc','Display','off','OutputFcn',@plotValueIteration,'Algorithm','quasi-newton');
    options2 = optimoptions(options2,'HessUpdate','steepdesc','MaxFunctionEvaluations',600);
    options2 = resetoptions(options2,{'HessUpdate','MaxFunctionEvaluations'});
    options2 = optimoptions(options2,'SpecifyObjectiveGradient',true,'Algorithm','trust-region');
    options2.HessianFcn = 'objective';
    
    % function using |fminunc|.
    x = fminunc(fungradhess,x0,options2)
    title(strjoin( {nombre,' optimization history. Start point  (', num2str(x0(1)) ,',', num2str(x0(2)),')' }))

    %print(strjoin( {'Plot',nombre,'OptimizationProcess', num2str(i)}),'-djpeg');
    
     
end


datasWord