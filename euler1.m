function [u,t]=euler1(f,t0,tf,u0,n)
%[u,t]=euler1(f,t0,tf,u0,n)
%
% This function implements Euler's method for solving the IVP
%
% du/dt=f(t,u), u(t0)=u0
%
% on the interval [t0,tf]. n steps of Euler's method are taken;
% the step size is dt=(tf-t0)/n.
% Compute the grid and allocate space for the solution


t=linspace(t0,tf,n+1);
u=zeros(1,n+1);
% Assign the initial value and compute the time step
u(1)=u0;
dt=(tf-t0)/n;
% Now do the computations in a loop
for ii=1:n
 u(ii+1)=u(ii)+dt*f(t(ii),u(ii));
end

% The exact solution is u(t)=exp(tan-1(t)):
 U=@(t)exp(atan(t)) 

% Plot the comparative graph with approximated and exact soltuion

plot(t,U(t),t,u)

% Lebels
xlabel('time (t)')
ylabel('f(t,u)')

% Legends
legend('Euler','Exact')

figure ()
% Plot the Error
plot(t,U(t)-u) 

xlabel('time (t)')
ylabel('Error')

