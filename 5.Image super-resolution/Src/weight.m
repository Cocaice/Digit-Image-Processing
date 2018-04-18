function output = weight(x)
    if (abs(x) >= 0 && abs(x) <= 1)
        output = double(1.5*abs(x)^3-2.5*abs(x)^2+1);
    elseif (abs(x) > 1 && abs(x) <= 2)
        output = double(-0.5*abs(x)^3+2.5*abs(x)^2-4*abs(x)+2);
    else
        output = 0;
    end
end

