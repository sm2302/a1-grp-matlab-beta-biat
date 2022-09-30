clear;
clc;

% generate empty space A for population
A = sparse(50,50);

% injecting population into A
A(21:30,21:30) = (rand(10,10)<0.4);

% loop over 200 generations
for t = 1:200
spy(A,'.',25)
drawnow

% size of row matrix
n = 50;

% shift the current population to the:
% p => right, down
% q => left, up
p = [1 1:n-1];
q = [2:n n];

% Count how many of the eight neighbors are alive.
B = ...
A(q,q) + A(:,q) + A(p,q)+...   % adding upper neighbour
A(q,:) + A(p,:) +...           % adding side neighbour
A(q,p) + A(:,p) + A(p,p);      % adding lower neighbour


% A live cell with two live neighbors, or any cell with
% three live neigbhors, is alive at the next step.
A = (A & (B == 2)) | (B == 3);
end
close