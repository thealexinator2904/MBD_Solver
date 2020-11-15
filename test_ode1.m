clear;
clc;
close all;
addpath(genpath('equations/'));
t0 = 0;
t_end = 4;
h = [ 0.001,0.1, 0.5]; 

print_res_fe(@eq1, @eq1_ideal, 'equation_1',t0,h,t_end)
print_res_fe(@eq2, @eq2_ideal, 'equation_2',t0,h,t_end)
print_res_fe(@eq3, @eq3_ideal, 'equation_3',t0,h,t_end)
print_res_fe(@eq4, @eq4_ideal, 'equation_4',t0,h,t_end)
print_res_fe(@eq5, @eq5_ideal, 'equation_5',t0,h,t_end)
print_res_fe(@eq6, @eq6_ideal, 'equation_6',t0,h,t_end)

print_res_rk(@eq1, @eq1_ideal, 'equation_1',t0,h,t_end)
print_res_rk(@eq2, @eq2_ideal, 'equation_2',t0,h,t_end)
print_res_rk(@eq3, @eq3_ideal, 'equation_3',t0,h,t_end)
print_res_rk(@eq4, @eq4_ideal, 'equation_4',t0,h,t_end)
print_res_rk(@eq5, @eq5_ideal, 'equation_5',t0,h,t_end)
print_res_rk(@eq6, @eq6_ideal, 'equation_6',t0,h,t_end)

h = [1]; 
print_res_vs(@eq1, @eq1_ideal, 'equation_1',t0,h,t_end)
print_res_vs(@eq2, @eq2_ideal, 'equation_2',t0,h,t_end)
print_res_vs(@eq3, @eq3_ideal, 'equation_3',t0,h,t_end)
print_res_vs(@eq4, @eq4_ideal, 'equation_4',t0,h,t_end)
print_res_vs(@eq5, @eq5_ideal, 'equation_5',t0,h,t_end)
print_res_vs(@eq6, @eq6_ideal, 'equation_6',t0,h,t_end)

h=[0.25]
print_res_fe_error(@eq1, @eq1_ideal, 'equation_1',t0,h,t_end)
print_res_fe_error(@eq2, @eq2_ideal, 'equation_2',t0,h,t_end)
print_res_fe_error(@eq3, @eq3_ideal, 'equation_3',t0,h,t_end)
print_res_fe_error(@eq4, @eq4_ideal, 'equation_4',t0,h,t_end)
print_res_fe_error(@eq5, @eq5_ideal, 'equation_5',t0,h,t_end)
print_res_fe_error(@eq6, @eq6_ideal, 'equation_6',t0,h,t_end)

print_res_rk_error(@eq1, @eq1_ideal, 'equation_1',t0,h,t_end)
print_res_rk_error(@eq2, @eq2_ideal, 'equation_2',t0,h,t_end)
print_res_rk_error(@eq3, @eq3_ideal, 'equation_3',t0,h,t_end)
print_res_rk_error(@eq4, @eq4_ideal, 'equation_4',t0,h,t_end)
print_res_rk_error(@eq5, @eq5_ideal, 'equation_5',t0,h,t_end)
print_res_rk_error(@eq6, @eq6_ideal, 'equation_6',t0,h,t_end)

%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] =print_res_rk(eq_ph, eq_ideal,name, t0, h, t_end)
    f_eq=figure('Name', name);
    for i=1:length(h)
       %y_fe=forward_euler(eq_ph, t0, h(i), t_end);
       y_rk = runge_kutta_so(eq_ph, t0, h(i), t_end);
       
       %[y_vs, t_vs] = variable_step(eq_ph, t0, 0.001, t_end, 0.1);
       t= t0:h(i):t_end;
       %plot(t,abs(y_fe));
       hold('on') 
       plot(t,abs(y_rk));
       %plot(t_vs,abs(y_vs))
    end
    t= t0:0.00001:t_end;
    plot(t,abs(eq_ideal(t)),'--');
    grid('on')
    legend('h=0,001','h=0,1','h=0,5', 'ideal solution')
    
    xlabel('t in s')
    ylabel('y')
    hgexport(f_eq, ['plots/rk_only_' name]);
end

function [] =print_res_fe(eq_ph, eq_ideal,name, t0, h, t_end)
    f_eq=figure('Name', name);
    for i=1:length(h)
       y_fe=forward_euler(eq_ph, t0, h(i), t_end);
       t= t0:h(i):t_end;
       plot(t,abs(y_fe));
       hold('on') 
    end
    t= t0:0.00001:t_end;
    plot(t,abs(eq_ideal(t)),'--');
    grid('on')
    legend('h=0,001','h=0,1','h=0,5', 'ideal solution')
    
    xlabel('t in s')
    ylabel('y')
    hgexport(f_eq, ['plots/fe_only_' name]);
end

function [] =print_res_vs(eq_ph, eq_ideal,name, t0, h, t_end)
    f_eq=figure('Name', name);
    for i=1:length(h)
       %y_fe=forward_euler(eq_ph, t0, h(i), t_end);
       %y_rk = runge_kutta_so(eq_ph, t0, h(i), t_end);
       
       [y_vs, t_vs] = variable_step(eq_ph, t0, 0.001, t_end, 0.1);
       t= t0:h(i):t_end;
       %plot(t,abs(y_fe));
       hold('on') 
       %plot(t,abs(y_rk));
       plot(t_vs,abs(y_vs))
    end
    t= t0:0.00001:t_end;
    plot(t,abs(eq_ideal(t)),'--');
    grid('on')
    legend('Solver', 'ideal solution')
    
    xlabel('t in s')
    ylabel('y')
    hgexport(f_eq, ['plots/vs_only_' name]);
end

function [] =print_res_fe_error(eq_ph, eq_ideal,name, t0, h, t_end)
    f_eq=figure('Name', name);
    for i=1:length(h)
       y_fe=forward_euler(eq_ph, t0, h(i), t_end);

       t= t0:h(i):t_end;
       plot(t,abs(y_fe));
       hold('on') 
    end
    t= t0:0.00001:t_end;
    plot(t,abs(eq_ideal(t)),'--');
    
    t_f_error = t0:h:t_end;
    y_f_error = eq_ideal(t_f_error);
    plot(t_f_error, abs(y_fe - y_f_error'))

    grid('on')
    legend('h=0,25','ideal solution','error')
    
    xlabel('t in s')
    ylabel('y')
    hgexport(f_eq, ['plots/fe_error_' name]);
end

function [] =print_res_rk_error(eq_ph, eq_ideal,name, t0, h, t_end)
    f_eq=figure('Name', name);
    for i=1:length(h)
       y_rk=runge_kutta_so(eq_ph, t0, h(i), t_end);

       t= t0:h(i):t_end;
       plot(t,abs(y_rk));
       hold('on') 
    end
    t= t0:0.00001:t_end;
    plot(t,abs(eq_ideal(t)),'--');
    
    t_f_error = t0:h:t_end;
    y_f_error = eq_ideal(t_f_error);
    plot(t_f_error, abs(y_rk - y_f_error'))

    grid('on')
    legend('h=0,25','ideal solution','error')
    
    xlabel('t in s')
    ylabel('y')
    hgexport(f_eq, ['plots/rk_error_' name]);
end
