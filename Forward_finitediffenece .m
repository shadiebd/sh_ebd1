x = 3
 dx=[1, 0.1, 0.01, 0.001,0.0001]  
dy=[]
 for i=1:length(dx)
     finite_difference_forward=(exp(x+dx(i))-exp(x))/dx(i)
     error=abs(finite_difference_forward-exp(x))
     dy=[dy error]
 end
 loglog(dx,dy,'-or')
 hold on
 dy_1=dx
 loglog(dx,dy_1, '-ob')
xlabel('dx')
ylabel('Forward finite difference error')
legend('Forward Finite Difference', reference line')
title(' Forward Finite Difference Error vs dx')

