function output_img = Max_filter( input_img,Size )
    img = input_img;
    [src_row, src_col] = size(img);
     for x=1:src_col
        for y=1:src_row
            array = zeros(1,Size*Size);
            m = 1;
            n = (Size-1)/2;
            for i = 1:Size
                for j = 1:Size
                    a = x-n+i-1;
                    b = y-n+j-1;
                    %先判断像素点是否处于边缘，如果处于边缘，则补0。
                    if ( a >= 1 && b >= 1 && a <= src_col && b <= src_row)          
                        array(m) = img(b,a);
                        m = m + 1;
                    else 
                        array(m) = 0;
                        m = m + 1;
                    end
                end
            end
            output_img(y,x) = uint8(max(array));
        end
     end

end