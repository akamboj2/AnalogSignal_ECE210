%{
    Welcome to ECE210 Honors Section. There will be 7 short tutorials in
    total: 4 for MATLAB and 3 for Python. You will have to complete all 8
    tutorials in order to gain Honors credit for this section.

    Before we begin, most of us are more familiar with the Windows set of
    keyboard shortcuts rather than the emacs set of keyboard shortcuts. So,
    let us change our shortcut preferences. Under the toolstrip, located at
    the top of the MATLAB window, search for "Environment" and click
    "Preferences". In the new "Preferences" window, select "Keyboard".
    Under "Keyboard", click on the option called "Shortcuts". On the right,
    under "Active Settings", please select "Windows Default Set". Finally,
    click "Apply" and "Ok".
%}

%%

%{
    Help and Basics

    The symbol "%" is used in front of a comment. Comments are usually
    color-coded green. Use "%%" to separate your code, typically written in
    a script (.m file) into individually executable sections. You may have
    to save your error-free script as a .m file in order for the
    color-coding and section separation to activate.

    To get a list of help topics, type "help" and hit enter/return. To get
    specific help for a function eg. sin, type "help sin" and hit
    enter/return. Since it is tedious to keep typing "and hit
    enter/return", we shall omit it from future instructions.

    If you don't know the exact name of the topic or command you are
    looking for, type "lookfor keyword" (e.g., "lookfor regression")

    When writing a long matlab statement that exceeds a single row use
    "..." to continue statement to next row.

    When using the command line, a ";" at the end means matlab will not
    display the result. If ";" is omitted then matlab will display result.
    It is a good practice to use ";" to suppress most results. 

    Use the up-arrow to recall commands without retyping them (and down
    arrow to go forward in commands). Tab-completion is also available.

    Some useful commands for clearing variables and windows
    clear all;	% clear all variables
    close all;	% close all additional windows
    clc;        % clears command window
    disp('<insert message here>'); % same as print statements

    Get Ready and Have Fun!

%}

%%

%{
    Schedule:

    09/17/2018: Matlab: Mathematical functions, Graphing tools, Vector and Matrix arithmetic
   
%}


%% 09/17/2018: Matlab: Mathematical functions, Graphing tools, Vector and Matrix arithmetic

%% Declaring Vectors and Matrices

% Declaring a row vector rv with elements [1 2 3 4 6 4 3 4 5], look at the
% form of rv being displayed in the Command Window. rv is also displayed in
% the Workspace, double-click on rv in the workspace and you will be able
% to view the entries of rv in a spreadsheet.
rv = [1 2 3 4 6 4 3 4 5]

% Declare a column vector cv with the same elements as rv. Observe the form
% of cv in the Command Window. In addition, the "'" operator gives
% you the transpose of a matrix/ vector.
cv = [1;2;3;4;6;4;3;4;5]
new_rv = cv'
new_cv = rv'

% Declare a vector of time t1 from 0s to 100s with 0.1s increments.
% Declare another vector of time t2 from 0 to 100 with exactly 574
% intervals.
t1 = 0:0.1:100
t2 = linspace(0, 100, 574)

% Declaring a matrix A with elements [1 2 3] in row 1, [4 5 6] in row 2.
A = [1 2 3; 4 5 6]

% Declaring a matrix Z of size 4x20 with entries 0, declare another matrix
% O of size 5x3 with entries 4.
Z = zeros(4,20)
O = ones(5,3)*4

% Practice declaring a few vectors/ matrices until you get the feel of it.

%% Interesting numbers

% Do explore and take note of the following results
% NaN represents "Not a Number"
a0 = 1/inf
a1 = 1/0
a2 = inf/0      % do take note
a3 = 0/0        % do take note
a4 = inf^inf
a5 = inf - inf  % do take note
b1 = i
b2 = j
b3 = sqrt(-1)
b4 = b1*b2
b5 = NaN

%% Mathematical functions and Graphing tools

%{
    In this example, we define, plot and play out a sine wave of
    400Hz sampled at 8192Hz. We do recommend that you go through this
    example in detail and it would be a good idea to put on your earphones
    at this point. After analyzing this example, write a 1.5 seconds sine
    sweep from 400Hz to 800Hz.
%}

% Declaring time t starting from 0, ending at 1s, with sampling frequency
% of 8192 Hz, hence period of 1/8192s. This is the default sampling
% frequency for the command soundsc.
t = 0:1/8192:1;

% Declaring the sine wave with frequency 400Hz, hence angular frequency of
% 2*pi*400 rad. Knowing how to write sine waves is actually quite important
% in ECE210 as we tend to do frequency analysis with sinusoidal inputs sin(wt)
sinewave = sin(2*pi*400*t);

% This is the typical way of plotting a graph and we would be expecting this of you.
% Firstly, create a new "figure" and label it with a positive integer. 
% Then, use "plot" which is the command to graph the sinewave in 2D.
% Please label your axis with "xlabel", "ylabel" and give your figure an appropriate "title".
% Adjust your "axis" so that the graph makes sense.
% If you need help with any of the commands at any point, highlight the command,
% right click and select "Help on Selection"
figure(1);
plot(t,sinewave);
xlabel('Time (s)')
ylabel('Amplitude')
title('Plot of sine wave from t = 0 to 10ms')
axis([0 10/1000 -1 1])

% Finally, play the sinewave you generated and verify.
soundsc(sinewave);

%% Exercise 1: Write a 1.5 seconds sine sweep from 400Hz to 800Hz.

% What is a sine sweep?
% A sine sweep is the evaluation of the sine function not only across time
% but also across a linear range of frequencies.
% Thus, if y is the sinesweep y = sin(2*pi*f(t)*t), where f(t) is the 
% linear range of frequencies. For example, to cover the range of
% frequencies from 100 to 200 Hz, from 0 to 1 second, 
% f(t) = 100 + t(200 - 100).

% First plot the first 1.5s.
% Then plot the first 20ms

% some variables that you must have:
% t : vector of time
% freq : vector of frequency, same length as t
% sinesweep : output vector

% <----- Here is space for you to complete this section ----->
t = 0:1.5/188192:1;
freq=400 + t*400;
sinesweep=sin(2*pi*freq.*t);
figure(1);
plot(t,sinesweep);
xlabel('Time (s)');
ylabel('Amplitude');
title('Plot of sine wave from t = 0 to 1.5s');
axis([0 1.5 -1 1])

figure(2);
plot(t,sinesweep);
xlabel('Time (s)');
ylabel('Amplitude');
title('Plot of sine wave from t = 0 to 20ms');
axis([0 .02 -1 1])



%% More mathematical functions and Graphing tools

% The following are some 2D graphing tools that you may try:
% plot, bar, stairs, errorbar, polar, stem, scatter

% The following are some 3D graphing tools that you may try:
% plot3, mesh, surf, surfl, contour, (quiver, slice)

%% Matrix and Vector Arithmetic Practice

% Compute the value of A dot B and store in the variable C
A = [1 0];
B = [2, 3];	% commas are ok
C = dot(A,B)   % correct ans: 2.

% Compute the value of A cross C and store in the variable C
% Show that this makes sense in a 3D plot (hint: plot3)
A = [1 0 0];
B = [2 3 0];
C = cross(A,B);
figure(2);
plot3(A,B,C)


%% Exercise 2: Matrix and Vector Operations
% Part A:
% Find the product of the matrices A = [1,2,3,4,5] and B = [1;1;1;1]
% and call it C, C = BA

% <----- Here is space for you to complete this section ----->

A = [1,2,3,4,5];
B = [1;1;1;1];
C = B*A

% Now, given the matrix A, produce the matrix C, using the repmat function.
% Use the help function and MATLAB documentation if you do not know how
% to use this function

% <----- Here is space for you to complete this section ----->

D = repmat(A,4,1);
% Part B:

% Cell wise multiplcation/division on vectors/matrices can be done using 
% .* and ./. Similarly elements wise power to the k can be done using .^.

% Example: 

F = [1 2 3; 4 5 6; 7 8 9];
G =F.^2; % Squares each element
H = F.*eye(3); %Cell wise multiplication with identity matrix

% Starting with the matrix E = [1 1 1; 2 2 2; 3 3 3], form the matrix
% X = [1 2 3; 2 4 6; 3 6 9]

% <----- Here is space for you to complete this section ----->
E = [1 1 1; 2 2 2; 3 3 3];
X = E;
X(:,2)=E(:,2)+E(:,1);
X(:,3)=X(:,2)+E(:,1);
X;
E=E*(E.*eye(3));

%% Exercise 3: What is a matrix in the real world?

% The following function, reads an image from the path provided to it.
% Provide the path to the picture 'lab1.jpg'

x = imread('/home/akamboj2/ECE 210 Honors Lab/Session1/lab1.jpg');

% Notice that your picture is a matrix of pixel values ranging from 0 to
% 255. 

% Using ONE matrix operation and the flipud() functionrotate your picture 
% 90 degrees to the left.You can view your rotated picture using the 
% function imshow().

% <----- Here is space for you to complete this section ----->
x=flipud(x');
imshow(x)
%% Exercise 4: Using Matrices to Solve a System of Equations

% Consider the following system of equations:
% x1 + 4x2 + 7x3 = 90
% x1 + 3x2 + x3 = 78
% x1 + x2 + x3 = 24

% This can be represented in matrix form as Ax = b
% A is the matrix of coefficients, b is the vector of numbers on the right 
% hand side of the equation and x is the vector [x1; x2; x3].

% <----- Here is space for you to complete this section ----->

A = [1 4 7;1 3 1; 1 1 1];% fill in A
b = [90;78;24];% fill in b

% If Ax = b  =>  x = (A-1)b, where A-1 is the inverse of the matrix.
% Now solve for x, by finding out how to find the inverse of a matrix
% in MATLAB.

% <----- Here is space for you to complete this section ----->
x=inv(A)*b

%% Exercise 5: Final example of the day

clear all; close all; clc;

% Most analog and digital filters (eg. audio filters, image filters) can be
% represented by a transfer function known as H(w). This will be covered in
% ECE210. H(w) is a complex-valued function with magnitude and phase. It is
% critical for most applications to determine the 3dB bandwidth. In the
% case of low pass filters, it is the angular frequency w_3dB where H(w) is
% half its peak value. 

% In this exercise, modify the following code such that the magnitude is
% displayed in logarithmic power scale = 20*log_base10(|H(w)|).

% Make a copy of the code before modification and be able to show us where
% you made the modification


w = 0:0.01:10;
H = 1./(1+1j*w);

subplot(2,1,1);
plot(w,abs(H)); 
title('Magnitude of H vs w');
xlabel('w');
ylabel('Magnitude'); 
grid on;

subplot(2,1,2);
plot(w,angle(H)); title('Phase of H vs w');
xlabel('w');
ylabel('Phase'); 
grid on;
% Try to find the value of the 3dB frequency from your plot.

%DO WE SCALE DOWN FOR ANGLE AS WELL??
%COPY OF CODE
w = 0:0.01:10;
H = 1./(1+1j*w);
scale = 20*log10(abs(H));
subplot(2,1,1);
plot(w,scale); 
title('Magnitude of H vs w');
xlabel('w');
ylabel('Magnitude'); 
grid on;

subplot(2,1,2);
plot(w,angle(scale)); title('Phase of H vs w');
xlabel('w');
ylabel('Phase'); 
grid on;
