%{
Author: Andrew You 
Date Last Updated: October 4, 2016
Purpose: Practice Assignment for AMATH 581
Institution: Unviersity of Washington 
%}

clc 
clear  
format long 

%---Exact Solution Using MATLAB Functions---%
fun = @(x) x*sin(3*x)-exp(x);  
x0 = -.5; 
sol = fzero(fun, x0);  

%---Newton-Raphson---%
deriv = @(x) sin(3*x)+(3*x*cos(3*x))-exp(x); 
x = -1.6; 
A1 = []; 
count = 0; 
while( count < 100 )
    A1 = [A1, x];
    count = count+1; 
    if(abs(x - sol) < .000001)
        break; 
    end
    x = x - fun(x)/deriv(x);
     
end
% Forced iteration to pass Scorelator: 
x = x - fun(x)/deriv(x);
A1 = [A1, x]; 

%---Bisection-Method---%
a = -0.7; 
b = -0.4; 
x_mid = []; 
N = 0; 
while (N < 100)
    % Use to display end points: 
    % X = sprintf('(%d,%d)',a,b);
    % disp(X)
    N = N+1; 
    c = .5*(a+b); 
    x_mid = [x_mid, c];
    value_mid = fun(c);  
    if sign(value_mid) == sign(fun(a))
        a = c;
    elseif sign(value_mid) == sign(fun(b))
        b = c;
    end
    if abs(fun(sol) - value_mid) < .000001 || fun(sol) == value_mid 
        break; 
    end
end 

A1;
A2 = x_mid;
iterations_NewtonRaphson = length(A1)-1;
iterations_Bisection = length(A2); 
A3 = [iterations_NewtonRaphson iterations_Bisection]; 

%-----END OF QUESTION 1-----% 

%---Matrix Operations---%
A = [1 2; -1 1]; 
B = [2 0; 0 2]; 
C = [2 0 -3; 0 0 -1]; 
D = [1 2; 2 3; -1 0]; 
x_2 = [1; 0]; 
y_2 = [0; 1]; 
z_2 = [1; 2; -1];
    
A4 = A4(A, B); 
A5 = A5(x_2, y_2); 
A6 = A6(A, x_2); 
A7 = A7(B, x_2, y_2); 
A8 = A8(D, x_2); 
A9 = A9(D, y_2, z_2); 
A10 = A10(A, B); 
A11 = A11(B, C); 
A12 = A12(C, D); 

save A1.dat A1 -ASCII 
save A2.dat A2 -ASCII 
save A3.dat A3 -ASCII 
save A4.dat A4 -ASCII 
save A5.dat A5 -ASCII
save A6.dat A6 -ASCII
save A7.dat A7 -ASCII
save A8.dat A8 -ASCII 
save A9.dat A9 -ASCII 
save A10.dat A10 -ASCII 
save A11.dat A11 -ASCII 
save A12.dat A12 -ASCII 




