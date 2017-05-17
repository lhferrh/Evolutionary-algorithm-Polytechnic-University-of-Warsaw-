function stop = bananaout(init,~,state)
persistent ph
stop = false;

%Definition Rosenbrock function
a=1.5;
b=1.5;
f = @(x,y)(1-x-a).^2 + 100*(y-b-(x-a).^2).^2;
rangex=[-2 7];
rangey=[-1 7];
optimo=[-0.5 5.5];
switch state
    %Init points out the first step when the plot function will be plotted
    case 'init'
       %newplot
       %Creating grid matrix
       x = linspace(rangex(1),rangex(2));
       y = linspace(rangey(1),rangey(2));
       [X,Y] = meshgrid(x,y);
       
        %creating matrix Z
        Z = f(X,Y);
        %Definition options
        levels = 1:10:300;
        %Creating countour
        figure
        contour(X,Y,Z,levels)
        %Definition aside panel
        colorbar
        axis([rangex rangey])
        axis square
        xlabel 'x'
        ylabel 'y' 
        hold on;
 
        plot(init(1),init(2),'ko','MarkerSize',15,'LineWidth',2);
        text(init(1),init(2), strjoin({'  Start ', num2str(init(1)),' ', num2str(init(2))}),'Color',[0 0 0 ]);
        plot(optimo(1),optimo(2),'ko','MarkerSize',15,'LineWidth',2);
        text(optimo(1),optimo(2),'   Solution','Color',[0 0 0]);
        
        drawnow
        
    
    %iter points out the body of the functions when the different iter
    %will be plotted
    case 'iter'
        x1 = init(1);
        y1 = init(2);
        z1 = f(x1,y1);
        ph = plot3(x1,y1,z1,'r.','MarkerSize',15);
        h = gca;
        h.SortMethod = 'childorder';
        drawnow;
        
        
    %Last step, printing leyend
    case 'done'
        legend(ph,'Iterative steps','Location','south')
        hold off
end