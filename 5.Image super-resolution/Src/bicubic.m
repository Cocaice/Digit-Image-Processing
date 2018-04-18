function output_img = bicubic( img, height, width)
    [src_row, src_col] = size(img);
    img = double(img);
    col_rate = double(src_col / width);
    row_rate = double(src_row / height);
    %output_img = uint8(zeros(height,width));
    for y = 1:height
        for x = 1:width
            i = floor(x*col_rate);
            j = floor(y*row_rate);
            m = double(x*col_rate) - double(i);
            n = double(y*row_rate) - double(j);
            sum = 0;
            for u = -1:2
                for v = -1:2
                    tempI = i+u;
                    tempJ = j+v;
                    %越界处理
                    if (tempI < 1) 
                        tempI = 1;
                    end
                    if (tempJ < 1) 
                        tempJ = 1;
                    end
                    if (tempI > src_col) 
                        tempI = src_col;
                    end
                    if (tempJ > src_row) 
                        tempJ = src_row;
                    end
                    sum = sum + img(tempJ,tempI)*weight(u-m)*weight(v-n);
                end
            end
            output_img(y,x) = uint8(sum);
        end
    end
    
end

