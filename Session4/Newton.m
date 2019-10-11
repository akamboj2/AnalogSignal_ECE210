function [ root ] = Newton( x1, f, df )
 % Calculates the root using Newton's Method
 % x1 is the initial guess
 % f is the function for which the root is to be found
 % df is the derivative of the function
 
 Tol =1e-5; %set a tolerance here
 xnew = 1000; % This will be the variable used to store the new guess
 x = x1; % Initialize the old guess to x1 in the beginning
 x_diff = abs(xnew - x); % This variable will hold the difference between
                           % new guess and old guess
 
 %<------------------Complete while loop-------------------------->
 while(x_diff>Tol)
     xnew=x-f(x)/df(x);
     x_diff = abs(xnew - x);
     x=xnew;
 end
 
 root = x;
end
