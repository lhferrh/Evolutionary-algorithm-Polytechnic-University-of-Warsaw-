%Project1: Find minimum of Rosenbrock algorithm

%Load data
load('dataProyect1.mat');



%% Optimization with Pattern search

% Minimize the banana function using patternsearch.

nombre='patternseach';
fun = @(x)(1-x(1)-a).^2 + 100*(x(2)-b-(x(1)-a).^2).^2;

options =  optimoptions('patternsearch','Display','off','OutputFcn',@bananaoutProject3,'MaxFunctionEvaluations',inf,'MaxIterations',inf);

A = [];
b = [];
Aeq = [];
beq = [];
lb = [];
ub = [];
nonlcon = [];

datasWord=startPoints;
for i=1:(size(startPoints,1))
    x0 = startPoints(i,:)';
    
   [x,fval,eflag,output] = patternsearch(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
    
   title(strjoin({nombre,'start point (', num2str(x0(1)),',', num2str(x0(2)),')'}))
   print(strjoin( {'Plot',nombre, num2str(i)}),'-djpeg');
   Fcount = output.funccount;
   disp(['Number of function evaluations for ', nombre, ' was ',num2str(Fcount)])
   disp(['Number of solver iterations for ', nombre, ' was ',num2str(output.iterations)])
   

   datasWord(i,3)=Fcount;
   datasWord(i,4)=output.iterations;
   datasWord(i,5)=fun(x);
   
    
    
    %% Monitor Optimization Process

    %%
    % Set options to plot the objective function at each iteration.
%    options2 = optimoptions('patternsearch','Display','off','PlotFcn',@plotValueIteration2,'MaxFunctionEvaluations',inf,'MaxIterations',2000);
    % function using |patternsearch|.
   % x = patternsearch(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options2);
   % title(strjoin( {nombre,' optimization history. Start point  (', num2str(x0(1)) ,',', num2str(x0(2)),')' }))
   % print(strjoin( {'Plot',nombre,'OptimizationProcess', num2str(i)}),'-djpeg');
    
    
     
end

datasWord


