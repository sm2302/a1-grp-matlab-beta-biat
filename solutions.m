clear;
clc;

% generate empty space A for population
A = sparse(50,50);

% injecting population into A
A(11:40,11:40) = (rand(30,30)<0.3);

% loop over 100 generations
for t = 1:100
spy(A)
imagesc(A)
axis square
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