N=100;
x = linspace(1/(2*N), 1-1/(2*N), N);
dx=1/N;


% Initializing diagonal vector v for matrix D
v = -2 * ones(1, 100); % Main diagonal of D
v(1) = 1; % Boundary condition at the first element
v(100) = 1; % Boundary condition at the last element

% Constructing diagonal matrix D
D = diag(v);



A=ones(1,99);
E=ones(1,99);


B_1=diag(A,1);
B_2=diag(E,-1);
B=diag(A,1)+diag(E,-1);
B(1,2)=0;
B(100,99)=0;


D_inverse= inv(D); %inversioning the Matrix D

K1=-D_inverse*B;
K2=D_inverse;

f=zeros(100,1); %constructing f
f(1,1)=2;
f(100,1)=1;


u_old = zeros(100, 1); % Initial guess
%u_old(1) = 2; % Boundary condition
%u_old(100) = 1; % Boundary condition
relative_change_list=[]


for iter = 1:10000
    u_new = K1 * u_old + K2 * f; % Updating u

    relative_change = norm(u_new - u_old, 2) / norm(u_new, 2);
    relative_change_list = [relative_change_list, relative_change];
    u_old = u_new; % Updating for next iteration
end
% Display results
disp('Solution u:');
disp(u_new);
disp(['Converged in ', num2str(iter), ' iterations.']);
%display plots
figure;
plot(x, u_new, 'ko-');
xlabel('x');
ylabel('u(x)');
title('Solution to Laplace Equation (Jacobi Method)');
grid on;
iteration = 1:length(relative_change_list);
% Plot relative change
figure;
semilogy(iteration,relative_change_list, 'b-');
xlabel('Iteration');
ylabel('Relative Change');
title('Convergence of Jacobi Iteration');
grid on;
