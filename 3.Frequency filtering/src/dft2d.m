function output_img = dft2d(input_img,flags )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    origin = imread(input_img);
    img = double(origin);
    
    [src_row, src_col] = size(img);
    output_img = double(zeros(src_row,src_col));
    temp = double(zeros(src_row,src_col));
    tempfouri = double(zeros(src_row,src_col));
    if (flags == 0)
        %中心化图像
        for u = 1:src_col
            for v = 1:src_row
                if (rem(u+v,2))
                    img(v,u) = -img(v,u);
                end
            end
        end
    end
    %傅里叶变换
    for x = 1:src_col
        for v = 1:src_row
            sum = 0;
            for y = 1:src_row
                sum = sum + img(y,x)*exp(-1i*2*pi*v*y/src_row);
            end
            temp(v,x) = sum;
        end
    end
    max = 0;
    for u = 1:src_col
        for v = 1:src_row
            sum = 0;
            for x = 1:src_col
                sum = sum + temp(v,x)*exp(-1i*2*pi*u*x/src_col)/src_col;
            end
            output_img(v,u) = log(abs(sum));
            tempfouri(v,u) = sum;
            if (output_img(v,u) > max)
                max = uint8(output_img(v,u));
            end
        end
    end
    
    
    if (flags == 1)  
        for x = 1:src_col
            for v = 1:src_row
                sum = 0;
                for y = 1:src_row
                    sum = sum + tempfouri(y,x)*exp(1i*2*pi*v*y/src_row);
                end
                temp(v,x) = sum;
            end
        end
        max = 0;
        for u = 1:src_col
            for v = 1:src_row
                sum = 0;
                for x = 1:src_col
                    sum = sum + temp(v,x)*exp(1i*2*pi*u*x/src_col);
                end
                output_img(v,u) = real(sum);
                if (output_img(v,u) > max)
                    max = output_img(v,u);
                end
            end
        end
    end
    
    range = 255.0/max;
    for u = 1:src_col
        for v = 1:src_row
           output_img(v,u) = output_img(v,u)*range;
        end
    end
    
    output_img = uint8(output_img);
    imshow(output_img);
    if (flags == 1)
        figure,imshow(origin);
    end
    
    
end

