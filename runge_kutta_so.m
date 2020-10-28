function [y]=runge_kutta_so(eq, t0, h, t_end)
    t= t0:h:t_end;
    y=zeros(length(t), 1);
    y(1)=1;
    
    for i =2:t_end/h
        k1=eq(y(i-1),i*h+t0);
        k2=eq()
        %      y(i) = y(i-1)+h*eq(y(i-1),i*h+t0);
    end
end

