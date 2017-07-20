%  Define the function f(x)
f = inline('x.^2-5*x.^1+6','x');

% Define the derivative of function f(x)
fp = inline('2*x.^1-5','x');

% Plot the graph to get the idea of location of the roots of the polynomial
x = [-0.8:0.01:2.0]';y=f(x);
plot(x,y);xlabel('x');ylabel('f(x)');
grid on

% Print the root(s) and the number of iterations  
[x,iterations] = newtonRaphson(-5,f,fp) 

% Range of initial Guess Values Vs the solutions
x0 = [-20:0.5:20]; xs = []; is = [];
 for i = 1:length(x0)
 [xx,ii] = newtonRaphson(x0(i),f,fp);
 xs = [xs,xx]; is = [is,ii];
 end

figure(1);plot(x0,xs,'o');hold;plot(x0,xs,'-');hold; 
title('Newton-Raphson solution'); 
xlabel('initial guess, x0');ylabel('solution, xs'); 

% Number of iterations Required to achieve a solution Vs the Initial Guess
 figure(2);plot(x0,is,'+'); hold;plot(x0,is,'-');hold;
title('Newton-Raphson solution');
xlabel('initial guess, x0');ylabel('iterations, xs');
