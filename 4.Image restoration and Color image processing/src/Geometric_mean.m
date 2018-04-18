function output_img = Geometric_mean( input_img, Size )
    img = double(input_img);
    %img=double(origin);
    [src_row, src_col] = size(img);
     for x=1:src_col
        for y=1:src_row
            product = 1;
            n = (Size-1)/2;
            for i = 1:Size
                for j = 1:Size
                    a = x-n+i-1;
                    b = y-n+j-1;
                    %先判断像素点是否处于边缘，如果处于边缘，则补0。
                    if ( a >= 1 && b >= 1 && a <= src_col && b <= src_row)          
                        product = product * img(b,a);
                    else 
                        product = product * 0;
                    end
                end
            end
            output_img(y,x) = uint8(product^(1/(Size*Size)));
        end
    end
end

