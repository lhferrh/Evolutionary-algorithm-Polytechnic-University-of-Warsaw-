function [result] = RosenbrockFunc(x)
    load('dataProyect1.mat');
    fun = @(x)(1-x(1)-a).^2 + 100*(x(2)-b-(x(1)-a).^2).^2;
    result= fun(x)
end