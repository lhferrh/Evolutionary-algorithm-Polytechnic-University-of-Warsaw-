function stop = plotValueIteration2(optimvalues, state)
persistent ph2
stop = false;


%Definition Rosenbrock function
a=1.5;
b=1.5;
f = @(x,y)(1-x-a).^2 + 100*(y-b-(x-a).^2).^2 ;

switch state
    %Init draws the plot
    case 'init'
        x =  0;
        y = 0;
        plot(x,y)
        xlabel 'iter'
        ylabel 'log(f(x,y))' 
        drawnow;
        hold on

        
    
    %iter points out the body of the functions when the different iter
    %will be plotted
    case 'iter'
        x=optimvalues.x;
        iteration= optimvalues.iteration ;
   
         
       %if ( iteration<100 )|| ( iteration < 1000 && mod(iteration,50)==0 ) 

        ph2 = plot(iteration,  log(f(x(1),x(2))), 'r.','MarkerSize',10);
        h2 = gca;
        h2.SortMethod = 'childorder';
        hold on
        drawnow;
       %end

        
        
        
    %Last step, printing leyend
    case 'done'
        legend(ph2,'Iterative steps','Location','south')
        drawnow;
        hold off
end
