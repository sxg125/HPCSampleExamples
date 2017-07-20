f001 = inline('x.^2-5*x.^1+6','x') 

[x,iter] = secantMethod(-10.0,-9.8,f001) 
x0 = [-20:0.5:20]; x00 = x0 + 0.5; xs = []; is = []; 
for i = 1:length(x0)
 [xx,ii] = secantMethod(x0(i),x00(i),f001);
 xs = [xs, xx]; is = [is, ii];
 end

 figure(1);plot(x0,xs,'o');hold;plot(x0,xs,'-');hold; 
 title('Secant method solution'); 
xlabel('first initial guess, x0');ylabel('solution, xs'); 

figure(2);plot(x0,is,'o');hold;plot(x0,is,'-');hold; 
 xlabel('first initial guess, x0');ylabel('iterations, is'); 
 title('Secant method solution'); 
