clear;
clc;
close all;
addpath(genpath('equations/'));
t0 = 0;
t_end = 4;
h = [ 0.1, 0.5]; %, 1.5, 2, 3, 5 
print_res(@eq1, @eq1_ideal, 'equation_1',t0,h,t_end)
print_res(@eq2, @eq2_ideal, 'equation_2',t0,h,t_end)
print_res(@eq3, @eq3_ideal, 'equation_3',t0,h,t_end)
print_res(@eq4, @eq4_ideal, 'equation_4',t0,h,t_end)
print_res(@eq5, @eq5_ideal, 'equation_5',t0,h,t_end)
print_res(@eq6, @eq6_ideal, 'equation_6',t0,h,t_end)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] =print_res(eq_ph, eq_ideal,name, t0, h, t_end)
    f_eq=figure('Name', name);
    for i=1:length(h)
       y_fe=forward_euler(eq_ph, t0, h(i), t_end);
       y_rk = runge_kutta_so(eq_ph, t0, h(i), t_end);
       
       [y_vs, t_vs] = variable_step(eq_ph, t0, 0.001, t_end, 0.1);
       t= t0:h(i):t_end;
       plot(t,abs(y_fe));
       hold('on') 
       plot(t,abs(y_rk));
       plot(t_vs,abs(y_vs))
    end
    t= t0:0.00001:t_end;
    plot(t,abs(eq_ideal(t)));
    grid('on')
    legend('fe h=0,1','rk h=0,1','vs h=0.1','fe h=0,01','rk h=0,01','vs h=0,01', 'ideal solution')
    xlabel('t in s')
    ylabel('y')
    hgexport(f_eq, ['plots/' name]);
end
