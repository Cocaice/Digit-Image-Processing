function output_img = filter2d_freq(input_img, filter)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    origin = imread(input_img);
    img = double(origin);
    
    [src_row, src_col] = size(img);
    [fil_row, fil_col] = size(filter);
    
    new_row = src_row+fil_row;
    new_col = src_col+fil_col;
    
    output_img = zeros(new_row,new_col);
    %进行0延拓
    for x = 1:new_col
        for y = 1:new_row
            if ( x <= fil_col && y <= fil_row)
                h(y,x) = filter(y,x);
            else
                h(y,x) = 0;
            end
            if ( x <= src_col && y <= src_row)
                f(y,x) = img(y,x);
            else
                f(y,x) = 0;
            end
        end
    end

    
    %傅里叶变换
    for x = 1:new_col
        for v = 1:new_row
            sum1 = 0;
            sum2 = 0;
            for y = 1:new_row
                sum1 = sum1 + f(y,x)*exp(-1i*2*pi*v*y/new_row);
                sum2 = sum2 + h(y,x)*exp(-1i*2*pi*v*y/new_row);
            end
            F(v,x) = sum1;
            H(v,x) = sum2;
        end
    end
    for u = 1:new_col
        for v = 1:new_row
            sum1 = 0;
            sum2 = 0;
            for x = 1:new_col
                sum1 = sum1 + F(v,x)*exp(-1i*2*pi*u*x/new_col);
                sum2 = sum2 + H(v,x)*exp(-1i*2*pi*u*x/new_col);
            end
            F1(v,u) = sum1;
            H1(v,u) = sum2;
            %两矩阵点乘
            G(v,u) = F1(v,u)*H1(v,u);
        end
    end
    
   
    %反傅里叶变换
    for x = 1:new_col
        for v = 1:new_row
            sum = 0;
            for y = 1:new_row
                sum = sum + G(y,x)*exp(1i*2*pi*v*y/new_row);
            end
            temp(v,x) = sum;
        end
    end
    max = 0;
    for u = 1:new_col
        for v = 1:new_row
            sum = 0;
            for x = 1:new_col
                sum = sum + temp(v,x)*exp(1i*2*pi*u*x/new_col)/new_col/new_row;
            end
            output_img(v,u) = real(sum);
        end
    end
    
    if(filter((fil_row+1)/2,(fil_row+1)/2) < 0)
        output_img = uint8(-output_img);
    else
        output_img = uint8(output_img);
    end
    
    
    imshow(output_img);
end

