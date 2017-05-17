function state = bananaoutGA(options,state,flag)

%bananaoutGA(optimvalues,options,flag)


    persistent ph

    
    %Definition Rosenbrock function
    a=1.5;
    b=1.5;
    f = @(x,y)(1-x-a).^2 + 100*(y-b-(x-a).^2).^2;
    rangex=[-5 7];
    rangey=[-2 11];
    optimo=[-0.5 5.5];
    
    
    switch flag
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
         
            contour(X,Y,Z,levels)
            %Definition aside panel
            colorbar
            axis([rangex rangey])
            axis square
            xlabel 'x'
            ylabel 'y' 
            hold on;

            plot(optimo(1),optimo(2),'ko','MarkerSize',15,'LineWidth',2);
            text(optimo(1),optimo(2),'   Solution','Color',[0 0 0]);

            drawnow

                %iter points out the body of the functions when the different iter
        %will be plotted
        case 'iter'   
            iteration = state.Generation;
            
            if ( iteration < 100 || mod(iteration,20)==0 )
                population= state.Population;

                %calculate mean of X and Y
                meanX=sum(population(:,1))/size(population,1);
                meanY=sum(population(:,2))/size(population,1);
                %Euclidean distance
                population=(population-optimo).^2;
                population=sum(population);
                population=sum(population,2);
                euclideanDist= sqrt(population);

                %we will use the square root of euclidean distant
                radio = sqrt(euclideanDist)
                radio = radio/10;

                %Now we draw the circle
                r= radio;
                x=meanX;
                y=meanY;
                th = 0:pi/50:2*pi;
                xunit = r * cos(th) + x;
                yunit = r * sin(th) + y;
                pr=plot(xunit, yunit);
                text(meanX+1,meanY, strjoin({'Iter', num2str(iteration)}),'Color',[0 0 0]);

                hold on
                drawnow;
            end

        %Last step, printing leyend
        case 'done'
            legend(ph,'Iterative steps','Location','south')
            hold off

        end
      
   

end