clear;
clc;
close all;
addpath(genpath('equations/'));
t0 = 0;
t_end = 2;
h = [0.1, 0.01];

f_eq1=figure('Name', 'equation_1');
for i=1:length(h)
   y=forward_euler(@eq1, t0, h(i), t_end);
    
   t= t0:h(i):t_end;
   plot(t,abs(y))
   hold('on') 
end

plot(t,abs(eq1_ideal(t)));
grid('on')
legend('ode h=0,1','ode h=0,01', 'ideal solution')
xlabel('t in s')
ylabel('y')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_eq2=figure('Name', 'equation_2');
for i=1:length(h)
   y=forward_euler(@eq2, t0, h(i), t_end);
    
   t= t0:h(i):t_end;
   plot(t,abs(y))
   hold('on') 
end

plot(t,abs(eq2_ideal(t)));
grid('on')
legend('ode h=0,1','ode h=0,01', 'ideal solution')
xlabel('t in s')
ylabel('y')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_eq3=figure('Name', 'equation_3');
for i=1:length(h)
   y=forward_euler(@eq3, t0, h(i), t_end);
    
   t= t0:h(i):t_end;
   plot(t,abs(y))
   hold('on') 
end

plot(t,abs(eq3_ideal(t)));
grid('on')
legend('ode h=0,1','ode h=0,01', 'ideal solution')
xlabel('t in s')
ylabel('y')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_eq4=figure('Name', 'equation_4');
for i=1:length(h)
   y=forward_euler(@eq4, t0, h(i), t_end);
    
   t= t0:h(i):t_end;
   plot(t,abs(y))
   hold('on') 
end

plot(t,abs(eq4_ideal(t)));
grid('on')
legend('ode h=0,1','ode h=0,01', 'ideal solution')
xlabel('t in s')
ylabel('y')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_eq5=figure('Name', 'equation_5');
for i=1:length(h)
   y=forward_euler(@eq5, t0, h(i), t_end);
    
   t= t0:h(i):t_end;
   plot(t,abs(y))
   hold('on') 
end

plot(t,abs(eq5_ideal(t)));
grid('on')
legend('ode h=0,1','ode h=0,01', 'ideal solution')
xlabel('t in s')
ylabel('y')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_eq6=figure('Name', 'equation_6');
for i=1:length(h)
   y=forward_euler(@eq6, t0, h(i), t_end);
    
   t= t0:h(i):t_end;
   plot(t,abs(y))
   hold('on') 
end

plot(t,abs(eq6_ideal(t)));
grid('on')
legend('ode h=0,1','ode h=0,01', 'ideal solution')
xlabel('t in s')
ylabel('y')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hgexport(f_eq1, 'plots/equation_1');
hgexport(f_eq2, 'plots/equation_2');
hgexport(f_eq3, 'plots/equation_3');
hgexport(f_eq4, 'plots/equation_4');
hgexport(f_eq5, 'plots/equation_5');
hgexport(f_eq6, 'plots/equation_6');