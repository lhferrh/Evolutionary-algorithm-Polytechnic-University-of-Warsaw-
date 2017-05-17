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
%%Optimization with Analytic Gradient
%If you provide a gradient, fminunc solves the optimization using fewer function 
%evaluations. When you provide a gradient, you can use the 'trust-region' algorithm, 
%which is often faster and uses less memory than the 'quasi-newton' algorithm. Reset
%the HessUpdate and MaxFunctionEvaluations options to their default values.

nombre='QuasiNewtonTrustRegion';
%Gradient calculate using gradient(fun,[x,y])
fun = @(x)(1-x(1)-a).^2 + 100*(x(2)-b-(x(1)-a).^2).^2;
grad = @(x)[2*x(1) + 200*(2*x(1) - 3)*((x(1) - 3/2)^2 - x(2) + 3/2) + 1;
                   200*x(2) - 200*(x(1) - 3/2)^2 - 300];

fungrad = @(x)deal(fun(x),grad(x));
options = optimoptions('fminunc','Display','off','OutputFcn',@bananaout,'Algorithm','quasi-newton')
options = resetoptions(options,{'HessUpdate','MaxFunctionEvaluations'});
options = optimoptions(options,'SpecifyObjectiveGradient',true, 'Algorithm','trust-region');

for i=1:(size(startPoints,1))
    x0 = startPoints(i,:)';
    [x,fval,eflag,output] = fminunc(fungrad,x0,options);
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
    options2 = optimoptions('fminunc','Display','off','OutputFcn',@plotValueIteration,'Algorithm','quasi-newton');
    options2 = optimoptions(options2,'HessUpdate','steepdesc','MaxFunctionEvaluations',600);
    options2 = resetoptions(options2,{'HessUpdate','MaxFunctionEvaluations'});
    options2 = optimoptions(options2,'SpecifyObjectiveGradient',true,'Algorithm','trust-region');
    % function using |fminsearch|.
    x = fminunc(fungrad,x0,options2)
    title(strjoin( {nombre,' optimization history. Start point  (', num2str(x0(1)) ,',', num2str(x0(2)),')' }))

    print(strjoin( {'Plot',nombre,'OptimizationProcess', num2str(i)}),'-djpeg');
    
     
end


datasWord