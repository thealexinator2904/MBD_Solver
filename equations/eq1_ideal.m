function [y]=eq1_ideal(t)
    tau = -0.5;
    y= 1.* exp(t./-0.5);
end
