%{
    Welcome to ECE210 Honors Section: Session #2. 

    Before we begin, make sure you open this document in Matlab editor
    instead of emacs/vi/gedit/... The cell mode should be automatically
    enabled and you will be able to execute each cell independently. To
    execute a cell, make sure the cell is selected and hit Ctrl Enter. Try
    it on this cell and the text "Welcome to ECE210 Honors Section: Session
    #2" should appear in your command window. If it does not, let the TA
    know.

    If you have not changed your shortcut preferences, do so now.
%}


disp('Welcome to ECE210 Honors Section: Session #2')

%%

%{
    Help and Basics #2

    The symbol "%" is for comments.
    The symbol "%%" is used to divide your code into indivually executable sections. 

    To get help on a function, type the keyword, highlight it, right click
    and select "Help on Selection". If nothing shows up, try googling the
    keyword, Matlab.

    Get Ready and Have Fun!
%}

%%

%{
    Schedule:

    [Done] 01/30/2018: MATLAB: Mathematical functions, Graphing tools, Vector and Matrix arithmetic
    02/06/2018: MATLAB: Some more plotting, Control flow, iterative solutions
%}


%% 02/06/2018: Some more plotting, Control flow, iterative solutions

%% Exercise 1: Mathematical functions and Graphing tools

% Calculate and display the voltage, current and power passing through
% R_L for R_L = 1:1:20 kohm for the circuit displayed in
% the lecture slides.

% Solve this problem step-wise:
% 1. Insert as comment an expression for current I in the clockwise direction
%    in terms of of R_L and the values given.
% 2. Insert as comment KVL for the loop, in terms of I.
% 3. Solve for I.
% 4. Using I, calculate V, the voltage across R_L.
% 5. Solve for Power.
% 6. Make a subplot with 3 plots of voltage, current and power.
%    Use different lines and colors for each plot

% hint: review matlab_1.m for
% how to define an array
% how to compute cell-by-cell operations between arrays
% how to create a figure

% You will need to draw multiple plots on the same figure.
% After using 'hold on', please remember to use 'hold off'.
% Make appropriate grids, titles, labels

% <----- Here is space for you to complete this section ----->

R_L = 1:1:20;

% I=6/(5kohm+R_L)
% 6=I*5kohm * I*R_L
I=6./(5+R_L)
V=I.*R_L
P=I.*V
figure(1);
hold on;
subplot(2,2,1);
plot(V,R_L,'r');
title('Voltage vs RL');
ylabel('V');
xlabel('k\Omega');

subplot(2,2,2);
plot(I,R_L,'b');
title('Current vs RL');
ylabel('mA');
xlabel('k\Omega');

subplot(2,2,3);
plot(P,R_L,'g');
title('Power vs RL');
ylabel('mW');
xlabel('k\Omega');

hold off;

%% Part 1 : Indexing in Matlab (Vectors)

% We shall learn about MATLAB indexing, beginning with a row vector.
% Please execute the following commands and view the results in the command
% window.

% This initializes a row vector, since ';' was not used, the result is
% displayed in the command window. Similar to last week, you can also find
% the variable rv in your workspace.
rv = [10 12 13 14 16 14 17 14 20]

% To get the first element, second element, third element of the vector:
% So the syntax is <variable_name>(<element_index>)
rv(1)
rv(2)
rv(3)

% Different ways of getting the last element:
rv(end)
length(rv)        % finds out the length (number of elements) in rv
                  % use "help on selection" to find out more
rv(length(rv))

% Different ways of getting the second last element:
rv(end-1)
rv(length(rv)-1)

% Get all the odd index elements of rv :index 1,3,5,7,9
odd_index = [1,3,5,7,9]
odd_index_rv = rv(odd_index)

% Get all the odd elements of rv: 13, 17
odd_elements_rv = rv(find(mod(rv,2)==1))
% To understand what the above command is doing, execute the following
% and also use help on selection
mod(rv,2)==1
find(mod(rv,2)==1)
rv(find(mod(rv,2)==1))
% It is very important for you to understand this!

%% Part 2 : Indexing in Matlab (Matrices)

% Similar to the previous part, please execute the following commands and
% view the results in the command window.

% This initializes a matrix A with elements [1 2 3] in row 1, [4 5 6] in row 2.
% Matrix A should look like this:
%    11     12     13
%    14     15     16
A = [11 12 13; 14 15 16]

% To get the ith row, jth col element, use A(i,j), 
% For example, [2 row, 3 column] and [1 row, 2 column]
A(2,3)
A(1,2)

% To get the row and column dimensions of a matrix, use the command size
% The result is a vector
size(A)
% So to find out the number of rows, just index the first element of the
% results and to find out the number of cols, index the second element of
% the results.
size_ofA = size(A)
num_row_A = size_ofA(1)
num_col_A = size_ofA(2)

% Using the ':' operator in indexing means 'everything'
% eg. the entire first row of A = row 1, everything from row 1
row_1_A = A(1,:)
% eg. the entire third col of A = everything from col 3, col 3
col_3_A = A(:,3)

% Most vector indexing commands should also work on matrices

%% Exercise 2: Indexing Questions

% To get the second last element of a vector rv, a student did the following
% Why is that wrong?
%rv(length(rv-1)); %this subtracts every element by 1 then gets the last index
%it should be 
%rv(length(rv)-1);

% A student made voltage measurements of nodes 1, 2, 3, 4, 5, 6, 7, 8 as
voltages = [12, 0, 1, -3, -29, 30, 8, 21]
voltages = voltages(randperm(length(voltages)))

% Find the node corresponding to ground.

% <----- Here is space for you to complete this section ----->

ground= find(voltages==0)




%% Recap : Solution to linear equations

clear all; close all; clc;

% Solving for unknown currents:

%{
    Given the following equations, please draw the circuit and show TA

    Loop1: -5V + 2I1 + 3(I1-I2) = 0
    Loop2: 3(I2-I1) + 2(I2) + 1(I2+1A) = 0

    Then look through the following steps carefully
%}

% Rearrange the loop equations so that I1 and I2 form columns
% Loop1: (2+3)*I1 + (-3)   *I2 = 5
% Loop2: (-3) *I1 + (3+2+1)*I2 = -1

% Loop1: (5)*I1 + (-3)*I2 = 5
% Loop2: (-3)*I1 + (6)*I2 = -1

% Convert the two linear equations into matrix form Ax = b
A = [5  -3
    -3   6]
b = [5
    -1]

% Invert matrix A and multiply it to both sides of the equation
% (Ainverse)*A*x = (Ainverse)*b
% (identity)  *x = (Ainverse)*b
%              x = (Ainverse)*b

currentsI1I2 = inv(A)*b

% Another way of doing this is:

currentsI1I2 = (A)\b

%% Control Flow Syntax

%{
    if expression
       statements
    elseif expression
       statements
    else
       statements
    end

    ---
%
    for index = values
       program statements
              :
    end
 
    ---
%
    while expression
       statements
    end
%}
%% Exercise 3 : Summing up a Fourier Series

% Calculate the sum of the Fourier Series provided in the
% lecture slides.
% 
% In 3 separate plots, plot the sum for n  = 10, 100, 100.
% Define a time vector t with enough samples. Remeber what happened when 
% you do not include enough points in your time vector?
% Use f = 1;
%
% What kind of ouput do you observe?

% <----- Here is space for you to complete this section ----->
t=0:.05:3;
x=0;
for k=1:10
	x=x+sin(2*pi*(2*k-1).*t)./(2*k-1);
end
figure(2);
title='n=10';
plot(t,x)

t=0:.05:3;
x=0;
for k=1:100
	x=x+sin(2*pi*(2*k-1).*t)./(2*k-1);
end
figure(3);
title='n=100';
plot(t,x)



t=0:.05:3;
x=0;
for k=1:1000
	x=x+sin(2*pi*(2*k-1).*t)./(2*k-1);
end
figure(4);
title='n=1000';
plot(t,x)

%% Nested For Loops

% You can use a loop within a loop to do some, interesting calculations.

% Example: Find the sum of the elements in the array A.
% A = [1  2  3
%      5 -1  4
%      8 4 -10];

A = [1 2 3; 5 -1 4; 8 4 -10]; % declare matrix
sum = 0; % initialize sum to 0
for i = 1:size(A, 1) % size(A, 1) gives the number of rows
    for j = 1:size(A, 2) % size(A, 2) gives the number of columns
        sum = sum + A(i , j); % Add the value of each entry to the
                                % running sum
    end
end

sum

%% Exercise 4: Reducing the size of an image using nested for loops

input_image = imread('lab2.jpg');
%imshow(input_image);

% We will first decrease the size of an image by a factor of 2.
% Run a nested for loop. The outer for loop should run from 1 to the height
% of the image divided by 2. The inner for loop should run from 1 to the
% width of the image divided by 2.
% 
% Inside the for loop assign the pixel value at input_image(2*i, 2*j) in 
% the input image to another variable called the output image.
% This can be done by typing the following line:
% output_image(i , j) = input_image(2*i, 2*j);
% Display the output image using imshow.

% <----- Here is space for you to complete this section ----->

s=size(input_image);
output_image=zeros(s(1)/2,s(2)/2);
for i=1:(s(1)/2)
    for j=1:(s(2)/2)
        output_image(i,j)=input_image(2*i,2*j);
    end
end
imwrite(output_image,'out.png');
imshow(output_image);

% Now you have decreased the size of the image by 2. Now try to decrease
% the size of the image by 4.
% Hint: Copy the code and think about what numbers need to be changed.

output_image2=zeros(s(1)/4,s(2)/4);
for i=1:s(1)/4
    for j=1:s(2)/4
        output_image2(i,j)=input_image(4*i,4*j);
    end
end
imwrite(output_image2,'out2.png');
imshow(output_image);
