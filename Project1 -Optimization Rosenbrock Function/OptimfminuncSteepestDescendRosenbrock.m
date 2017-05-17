%Project1: Find minimum of Rosenbrock algorithm

%Load data
load('dataProyect1.mat');



%% Optimization with Pattern search

% Minimize the banana function using |fminunc|.

nombre='fminuncSteepestDescent';
fun = @(x)(1-x(1)-a).^2 + 100*(x(2)-b-(x(1)-a).^2).^2;
%options = optimoptions('fminunc','Display','off','OutputFcn',@bananaout,'Algorithm','quasi-newton');
options = optimoptions('fminunc','Display','off','OutputFcn',@bananaout,'Algorithm','quasi-newton','HessUpdate','steepdesc','MaxFunctionEvaluations',inf,'MaxIterations',200);
for i=1:(size(startPoints,1))
    x0 = startPoints(i,:)';
    [x,fval,eflag,output] = fminunc(fun,x0,options);
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
    options2 = optimoptions('fminunc','Display','off','OutputFcn',@plotValueIteration,'Algorithm','quasi-newton','HessUpdate','steepdesc','MaxFunctionEvaluations',inf,'MaxIterations',200);
    % function using |fminsearch|.
    x = fminunc(fun,x0,options2)
    title(strjoin( {nombre,' optimization history. Start point  (', num2str(x0(1)) ,',', num2str(x0(2)),')' }))

    print(strjoin( {'Plot',nombre,'OptimizationProcess', num2str(i)}),'-djpeg');
    
     
end


datasWord