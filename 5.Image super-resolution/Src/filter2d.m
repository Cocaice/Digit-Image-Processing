function output = filter2d(filter, src)
    [filter_row, filter_col] = size(filter);
    [src_row, src_col] = size(src);
    filter_size = floor(filter_col / 2);
    for x = 1+filter_size:src_col-filter_size
        for y = 1+filter_size:src_row-filter_size
            sum = 0;
            n = (filter_col-1)/2;
            for i = 1:filter_col
                for j = 1:filter_row
                    a = x-n+i-1;
                    b = y-n+j-1;          
                    sum = sum + filter(j,i)*src(b,a);
                end
            end
            output(y-filter_size,x-filter_size) = sum;
        end
    end
end

