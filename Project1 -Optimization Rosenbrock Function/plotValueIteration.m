function stop = plotValueIteration(init,data,state)
persistent ph2
stop = false;


%Definition Rosenbrock function
a=1.5;
b=1.5;
f = @(x,y)(1-x-a).^2 + 100*(y-b-(x-a).^2).^2 ;
rangex=[-2 7];
rangey=[-1 7];
optimo=[-0.5 5.5];

switch state
    %Init draws the plot
    case 'init'
        x =  0;
        y = 0:100;
        figure
        semilogy(x,y)
        xlabel 'iter'
        ylabel 'log(f(x,y))' 
        hold on

        
    
    %iter points out the body of the functions when the different iter
    %will be plotted
    case 'iter'
        data.iteration  
        log(f(init(1),init(2)));
        ph2 = plot(data.iteration, f(init(1),init(2)), 'r.','MarkerSize',15);
        h2 = gca;
        h2.SortMethod = 'childorder';
        drawnow;
        
        
    %Last step, printing leyend
    case 'done'
        legend(ph2,'Iterative steps','Location','south')
        hold off
end
