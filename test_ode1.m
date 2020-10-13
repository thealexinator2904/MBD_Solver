clear;
clc;
close all;


t0 = 0;
t_end = 10;
h = 0.001;

y=1;
t= t0:h:t_end;
y=zeros(t_end/h+1, 1);
y(1)=1;

for i =2:t_end/h
    y(i) = y(i-1)+h*eq1(y(i-1),i/h);
end
plot(t,y)
hold('on')
y_ideal = exp(t./-0.5);
plot(t,y_ideal);
grid('on')
legend('ode', 'ideal solution')

function [dy]=eq1(y,t)
    tau = -0.5;
    dy = y/tau;
end
function [dy]=eq2(y,t)
    dy=t
end