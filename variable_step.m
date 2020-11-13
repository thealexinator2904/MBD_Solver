function [y,t]=variable_step(eq, t0, h_start, t_end, rtol)
    h = h_start;
    t= [t0];
    index = 1;
    y_kmp(1)= 1;
    y_kmp(2)=1;
    while t(end) < t_end
        index = index+1;
        tk = t(end);
        yk = y_kmp(index-1);
        k1=eq(yk,tk);
        k2=eq(yk + k1.*h./2 , tk+h./2);
        
        y_kmp(index)= yk + h .* k2;
        
        y_fe(index) = yk + h*eq(yk,tk);
        
        eps = abs(y_kmp(end) - y_fe(end));

        t = [t t(end)+h];
        if(eps >= rtol)
            h = h.* sqrt(rtol./eps);
        end
    end
    y = y_kmp;
end

