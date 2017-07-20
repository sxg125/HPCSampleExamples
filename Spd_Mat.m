% This function converts a non-positie definite symmteric matrix into a
% positive-definite matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Usage : Aspd = Spd_Mat(A)
% Where : A is 2D (2x2 or 3x3 ...) symmetric matrix
%         Aspd returns positive-definite matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written By: Muhammad Asim Mubeen
%             University at Albany
%             Albany New York
%             &
%             Nathan Kline Institute for Psychiatric Research
%             Orangeburg New York.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Aspd = Spd_Mat(A)


if nargin==0 
    disp('No argument provided');
    disp('Please provide a symmetric matrix... (2x2 or 3x3 ...) as an argument');
    return;
end

% Making sure matrix A is symmetric 
size_A = size(A);

isSym=@(x) isequal(x,x.'); % Check weather the matrix is symmetric
sn=isSym(A);

if size_A(1) ~= size_A(2)  || max(size_A) < 2 || sn == 0
    
    disp('Please provide a symmetric matrix... (2x2 or 3x3 ...)');
    return;
    
end

%Eigen Value Test
% Using chol function

[R,p]=chol(A);
EigenPositiveDefiniteUsingCHOL = p == 0

% Eigenvalue Test Using eig function
EigenPositiveDefiniteUsingEig = all(eig(A) > 0)

% Determinants Test

 x=1; %Flag to check for positiveness
    for i=1:3
        subA=A(1:i,1:i); %Extract upper left kxk submatrix
        if(det(subA)<=0); %Check if the determinent of the kxk submatrix is +ve
            x=0;
            break;
        end
    end


DeterminantPositiveDefinite = x > 0

% Hessian Test
z = [1; 2; 3]
HessianPositiveDefinite = z.'*A*z > 0

return
