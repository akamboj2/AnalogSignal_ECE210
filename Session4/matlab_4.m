%{
    Welcome to ECE210 Honors Section: Session #4. 
    Last session we learnt about iterative computation and functions.
    Today we will learn how to code Newton's Method using anonymous
    functions. Following this we will learn some simple recursion.
 %}

%%

%{
    To get help on a function, type the keyword, highlight it, right click
    and select "Help on Selection". If nothing shows up, try googling the
    keyword and Matlab.
%}

%%

%{
    Schedule:

    [Done] Week1: Matlab: Mathematical functions, Graphing tools, Vector and Matrix arithmetic
    [Done] Week2: Matlab: Control flow, iterative and vectorized solution
    [Done] Week3: Matlab: Control flow, iterative and vectorized solution
           Week4: Matlab: Finishing up Matlab.
%}


%% 02/25/2018: Matlab: The End
%% Review : What is a function?

%{
    A function has a name so that you can call it by its name
    A function may take some inputs in the parenthesis on the right
    A function may give some outputs before the equality sign on the left
    It is like one of the black boxes that you define in ECE210

    Please read the following very carefully:

    Syntax: 
    function [y1,...,yN] = myfun(x1,...,xM)

    Description:
    function [y1,...,yN] = myfun(x1,...,xM) declares a function named myfun
    that accepts inputs x1,...,xM and returns outputs y1,...,yN. This
    declaration statement must be the first executable line of the
    function.

    Save the function code in a text file with a .m extension. The name of
    the file should match the name of the first function in the file. Valid
    function names begin with an alphabetic character, and can contain
    letters, numbers, or underscores.

    You can declare multiple local functions within the same file, or nest
    functions. If any function in a file contains a nested function, all
    functions in the file must use the end keyword to indicate the end of
    the function. Otherwise, the end keyword is optional.
%}

%% Example: Function Definition

%  Create a new function file, save it as myphase.m

%  Copy the following definition into the file:
%{
    function [ z_phase ] = myphase( z )
    % This function returns the phase of the complex number z

    z_phase = angle(z);

    end
%}

%   Save the file and execute the following commands:
%{
    z = 1+j;
    z_phase = myphase(z)
%}
%% Anonymous Functions

% An anonymous function is a function that is not stored in a program file, 
% but is associated with a variable whose data type is function_handle. 
% Anonymous functions can accept inputs and return outputs, just as 
% standard functions do. However, they can contain only a single executable
% statement.

% Example 1: An anonymous function that calculates the values of the
% function f1(x) = x^2 + 2x + 2, for a given x.

f1 = @(x) x^2 + 2 * x + 2;

% Try running this on the vector [1 2]. We get an error!

f1([1 2]);

% You need to use pointwise multiplications to correctly evaluate the
% function at each point in a vector.

f2 = @(x) x.^2 + 2 * x + 2;

%% Passing the function handle to another function

% Consider the user defined function which takes in an interval [a, b] and
% a function f. The function returns true if there is a point c in [a, b]
% where f(c) = 6;

% function [answer] = IntermediateValue(interval, f)
%     if f(interval(1)) <= 6 && f(interval(2)) >= 6
%         answer = true;
%         return % The return statement prevents the function from
%                % evaluating the rest of the code
%     end
%     answer = false;
% end

IntermediateValue([1, 2], f1);

%% Exercise 1: Newton's Method
% Part 1 : Complete the function Newton.

% In this exercise you will complete the function Newton, that calculates a
% root of a function f and returns the value back to you.

% Copy the code below into a new function file and complete the function

% function [ root ] = Newton( x1, f, df )
% % Calculates the root using Newton's Method
% % x1 is the initial guess
% % f is the function for which the root is to be found
% % df is the derivative of the function
% 
% Tol = %set a tolerance here
% xnew = 1000; % This will be the variable used to store the new guess
% x = x1; % Initialize the old guess to x1 in the beginning
% x_diff = abs(xnew - x); % This variable will hold the difference between
%                           % new guess and old guess
% 
% <------------------Complete while loop-------------------------->
% while( )
% end
% 
% root = x;
% end
f=@(x) x^3+3*x+1;
df=@(x) 3*x^2+3;
r = Newton(3,f,df)

fs=@(x) x.^3+3*x+1;

xs=[-1:.1:1];
y=fs(xs);
plot(xs,y)
xlabel('x');
ylabel('y');
title('f(x)');
line([-1,1],[0,0])
line([0,0],[-1,1])

%% 
% Part 2 : 
% Create an anonymous function f(x) = x^3 + 3x + 1
% Store its derivative in the anonymous function df (The derivative is
% trivial).

% Now call the function Newton. Use an initial guess of your choice.

% <----- Here is space for you to complete this section ----->


%% 

% Part 3: Now plot the function f(x) for x between -1 and 1. Use an
% appropriate step between points. Does the value of the root from your
% plot match the value returned from Newton's method? Draw horizontal and
% vertival lines to mark the zero on the plot. (Reminder: The zero of the
% function f(x), is the value x where f(x) = 0).

% <----- Here is space for you to complete this section ----->


%% Recursion

% The following code counts the number of zeros in a vector using
% recursion. If the length of the vector is 1, the function returns 1 if the
% value 0. This is known as the base case. We know what the answer will be
% if we are given a vector of length 1.

% Assume we know what the answer will be for a vector of length n-1. Now if
% we are given a vector of length n, look at vector(2 :  end). This is a
% vector of length n-1. So assume that the function calculates the number
% of zeros in this vector correctly. Then if vector(1) = 0, we add 1 to the
% result we got from the function being called on vector(2 : end), else we
% do not add 1.

% function [ result ] = zeroCount( vector )
% 
%     if(length(vector) == 1) % Base Case, no recursion done here
%         result = (vector == 0);
%         return
%     end
%     % Recursion is performed here
%     % Look at the first element in the vector
%     if(vector(1) == 0) 
%         % If it is 0, then add 1 to the number of zeros in the rest of
%         % the vector
%         result = 1 + zeroCount(vector(2 :  end)); 
%         return
%     else
%         % Else return the number of zeros in the rest of the vector.
%         result = zeroCount(vector(2 :  end))
%     end
% 
% end

%% Exercise 2: Tribonacci Series

% Write a function that calculates the nth term in the tribonacci series.
% You will call it like this: Tribonacci(n).

% The tribonacci series is defined by:
% tribonacci(0) = 0   |
% tribonacci(1) = 0   | Base Cases
% tribonacci(2) = 1   |
%
% Recursive definition:
% tribonacci(n) = tribonacci(n - 1) + tribonacci(n - 2) + tribonacci(n -
% 3).
trib=tribonacci(6)
%% Exercise 3: Simple Image Encoding

% Load the images into variables x and y.

load('images.mat');

% Notice that this is a complex number
z = x + 1i * y;
z=z*-i;
% Now you are able to view the image stored in x. Multiply z by a single 
% number such that you can view the image stored in variable y.
imshow(uint8(z));