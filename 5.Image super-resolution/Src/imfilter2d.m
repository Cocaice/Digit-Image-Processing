function output_img = imfilter2d(src_img, filter)
    [filter_row, filter_col] = size(filter);
    [src_row, src_col] = size(src_img);
    
    for x = 1:src_col
        for y = 1:src_row
            sum = 0;
            n = (filter_col-1)/2;
            for i = 1:filter_col
                for j = 1:filter_row
                    a = x-n+i-1;
                    b = y-n+j-1;   
                    if (a < 1)
                        a = 1;
                    end
                    if (a > src_col)
                        a = src_col;
                    end
                    if (b < 1)
                        b = 1;
                    end
                    if (b > src_row)
                        b = src_row;
                    end
                    sum = sum + filter(j,i)*src_img(b,a);
                end
            end
            output_img(y,x) = sum;
        end
    end
    


end

