
% Opbejctive function
f = [-5 -6]

% Constraints in AX = b
A = [2 3
     3 2]
b = [6 6]

% Solve the Linear Program
x = linprog(f,A,b)

