
% Initial Gues x0, function f, and derivative fp
function [x,iter]=newtonRaphson(x0,f,fp)
% newton-raphson algorithm
N = 100; eps = 1.e-5; % define max. no. iterations and error
maxval = 10000.0; % define value for divergence
xx = 0;
%  Define the function f(x)
%f = inline('x.^2-5*x.^1+6','x');

% Define the derivative of function f(x)
%fp = inline('2*x.^1-5','x');

while (N>0)
 xn = xx-f(xx)/fp(xx);
if abs(f(xn))<eps
 x=xn;iter=100-N;
 return;
end;
if abs(f(xx))>maxval
 disp(['iterations = ',num2str(iter)]);
 error('Solution diverges');
 abort;
end;
 N = N - 1;
 xx = xn;
end;
error('No convergence');
abort;
% end function

% Plot the graph to get the idea of location of the roots of the polynomial
%x = [-0.8:0.01:2.0]';y=f(x);
%plot(x,y);xlabel('x');ylabel('f(x)');
%grid on

% Print the root(s) and the number of iterations  
%[x,iterations] = newton_raphson(-5,f,fp) 
  
