clear;
clc;
close all;


t0 = 0;
t_end = 3;
h = 0.001;

y=1;
t= t0:h:t_end;
y=zeros(t_end/h+1, 1);
y(1)=1;

for i =2:t_end/h
    y(i) = y(i-1)+h*eq2(y(i-1),i*h);
end
plot(t,y)
hold('on')
plot(t,eq2_ideal(t));
grid('on')
legend('ode', 'ideal solution')

function [dy]=eq1(y,t)
    tau = -0.5;
    dy = y/tau;
end
function [y]=eq1_ideal(t)
    tau = -0.5;
    y= 1.* exp(t./-0.5);
end

function [dy]=eq2(y,t)
    dy=t;
end
function [y]=eq2_ideal(t)
    y= 1+ t.*t./2;
end

