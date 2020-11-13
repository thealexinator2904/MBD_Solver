function [y]=runge_kutta_so(eq, t0, h, t_end)
    t= t0:h:t_end;
    y=zeros(length(t), 1);
    y(1)=1;
    
    for i =2:t_end/h
        tk = i*h+t0;
        yk = y(i-1);
        
        k1=eq(yk,tk);
        k2=eq(yk+k1.*h./2, tk+h./2);
        y(i)=yk+h.*k2;
    end
end

