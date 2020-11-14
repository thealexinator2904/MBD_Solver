function [y]=forward_euler(eq, t0, h, t_end)
    t= t0:h:t_end;
    y=zeros(length(t), 1);
    y(1)=1;

    for i =2:t_end/h+1
      y(i) = y(i-1)+h*eq(y(i-1),i*h+t0);
    end
end