%Newton_raphson
v=40; %m/s
t=10 ;%seconds
m=68.1; %kg
g=9.81; %m/s^2
c=linspace(1,20,10); %time

D=(1-exp(-c/m*t));

E=(g*m./c);

F_c=(E.*D)-v

figure;    
plot(c,F_c)
ylim([0, max(F_c)]); 
xlim([min(c), max(c)]); 
xlabel('The value of C');
ylabel('F(c)');
title(' C vs. F(c)');
grid on; % Adding a grid for better readability


F_c_func = @(c) (g * m ./ c) .* (1 - exp(-c / m * t)) - v; %defining the function

iteration=20;
c_values = [];
error_list=[];
x_old=12; % here, one x is enough for starting our iteration.
for iter=1:iteration

    f_c_x_old=F_c_func(x_old)

    h = 1e-5;  % Small perturbation
    F_prime = (F_c_func(x_old + h) - F_c_func(x_old)) / h %defining the derivative of the function with finite difference.

    x_new=x_old-(f_c_x_old/F_prime) %computing the new x
    error=abs((x_new - x_old) / x_old) %computing the error
    c_values=[c_values,x_new]
    error_list=[error_list,error]
    x_old=x_new
end

figure;    
plot(1:length(error_list),error_list)
xlabel('Iteration Number');
ylabel('relative change Error');
title(' relative change vs. Iteration Number');
grid on; % Add a grid for better readability
figure;
plot(1:length(c_values),c_values)
xlabel('Iteration Number');
ylabel('c Values');
title('c Values vs. Iteration Number');
grid on; % Adding a grid for better readability
