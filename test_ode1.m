clear;
clc;
close all;

t0 = 0;
t_end = 10;
h = 0.0001;

y=0;
t= t0:h:t_end;
y=zeros(length(t), 1);
y(1)=1;

for i =2:t_end/h
    y(i) = y(i-1)+h*eq5(y(i-1),i*h);
end

plot(t,y)
hold('on')
plot(t,eq5_ideal(t));
grid('on')
legend('ode', 'ideal solution')
xlabel('t in s')
ylabel('y')

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

function [dy]=eq3(y,t)
    dy=y;
end
function [y]=eq3_ideal(t)
    y= exp(t);
end
function [dy] = eq4(y,t)
        dy = -y;
end
function [y] = eq4_ideal(t)
        y = exp(-t);
end

function [dy] = eq5(y,t)
        dy = 1/(1-3.*t);
end
function [y] = eq5_ideal(t)
        y = 1-((log(1-3.*t)/(3)));
end

function [dy] = eq6(y,t)
        dy = 2.*y-y.*x;
end
function [y] = eq6_ideal(t)
        y = 2./(1+exp(-2.*t));
end