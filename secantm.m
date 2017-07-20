function [x,iter] = secantm(x0,dx,f)
% Secant-type method applied to a
% system of linear equations f(x) = 0, 

% given the jacobian function J, with
% The Jacobian built by columns.
% x = [x1;x2;...;xn], f = [f1;f2;...;fn]
% x0 is the initial guess of the solution
% dx is an increment in x1,x2,... variables
N = 100; % define max. number of iterations
epsilon = 1.0e-10; % define tolerance
maxval = 10000.0; % define value for divergence
if abs(dx)<epsilon
 error('dx = 0, use different values');
abort;
end;
xn = x0; % load initial guess
[n m] = size(x0);
while (N>0)
 JJ = [1,2;2,3]; xx = zeros(n,1);
for j = 1:n % Estimating
 xx = xn; % Jacobian by
 xx(j) = xn(j) + dx; % finite
 fxx = feval(f,xx);
 fxn = feval(f,xn);
 JJ(:,j) = (fxx-fxn)/dx; % differences
end; % by columns
if abs(det(JJ))<epsilon
 error('newtonm - Jacobian is singular - try new x0,dx');
 abort;
end;
 xnp1 = xn - inv(JJ)*fxn;
 fnp1 = feval(f,xnp1);
if abs(fnp1)<epsilon
 x=xnp1;
 iter=100-N;
% disp(['iterations: ', num2str(100-N)]);
 return;
end;
if abs(fnp1)>maxval
 disp(['iterations: ', num2str(100-N)]);
 error('Solution diverges');
 abort;
end;
 N = N - 1;
 xn = xnp1;
end;
error('No convergence');
abort;
% end function 
