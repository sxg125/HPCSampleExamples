function [x,iter]=secantMethod(x0,x00,f)
% newton-raphson algorithm
N = 100; eps = 1.e-5; % define max. no. iterations and error
maxval = 10000.0; % define value for divergence
xx1 = x0; xx2 = x00;
while N>0
 gp = (f(xx2)-f(xx1))/(xx2-xx1);
 xn = xx1-f(xx1)/gp;
if abs(f(xn))<eps
 x=xn;
 iter = 100-N;
 return;
end;
if abs(f(xn))>maxval
 iter=100-N;
 disp(['iterations = ',num2str(iter)]);
 error('Solution diverges');
 abort;
end;
 N = N - 1;
 xx1 = xx2;
 xx2 = xn;
end;
iter=100-N;
disp(['iterations = ',iter]);
error('No convergence');
abort;
% end function
