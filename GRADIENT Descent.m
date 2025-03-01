%GRADIENT Descent
syms x y;
x_1=-2;
y_1=1;
alpha=0.001;
iteration=10000;

f = -y + x + 2*x^2 + 2*x*y + y^2;

df_x=diff(f, x);
df_y=diff(f, y);

f_values = zeros(1, iteration);
x_values = zeros(1, iteration);
y_values = zeros(1, iteration);
 
for iter= 1:iteration

    x_values(iter) = x_1;
    y_values(iter) = y_1;

    grad_x_sub = subs(df_x, {x, y}, {x_1, y_1});
    grad_y_sub = subs(df_y, {x, y}, {x_1, y_1});
    grad_x = double(grad_x_sub);
    grad_y = double(grad_y_sub);


    x_new=x_1-(grad_x*alpha);
    y_new=y_1-(grad_y*alpha);
    x_1=x_new;
    y_1=y_new;

    f_values(iter) = double(subs(f, {x, y}, {x_1, y_1}));


end


% Display the final values
disp(['Final x: ', num2str(x_1)]);
disp(['Final y: ', num2str(y_1)]);
disp(['Final f: ', num2str(f_value)]);

%f_value = double(subs(f, {x, y}, {x_1, y_1}))

% Plot the function values
figure;
plot(1:iteration, f_values, 'LineWidth', 1.5);
xlabel('Iteration');
ylabel('f(x, y)');
title('Gradient Descent Progress: Function Values');
grid on;

% Plot x values over iterations
figure;
plot(1:iteration, x_values, 'LineWidth', 1.5);
xlabel('Iteration');
ylabel('x');
title('Gradient Descent Progress: x Values');
grid on;

% Plot y values over iterations
figure;
plot(1:iteration, y_values, 'LineWidth', 1.5);
xlabel('Iteration');
ylabel('y');
title('Gradient Descent Progress: y Values');
grid on;
