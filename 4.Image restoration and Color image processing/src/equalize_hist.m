function output_img = equalize_hist(input_img )
    img = input_img;
    [src_row, src_col] = size(img);
    output_img = uint8(zeros(src_row, src_col));
    data = zeros(1,256);             %data数组用作统计每个像素值的点的个数
    
    %直方图归一化
    for x=1:src_col
        for y=1:src_row
            data(img(y,x)+1) = data(img(y,x)+1)+1;
        end
    end
    for k = 1:256
        data(k)=data(k)/(src_row*src_col);  %求出每个像素值的频率
    end
    
    %进行直方图均衡化
    for x=1:src_col
        for y=1:src_row
            sum = 0;
            for i = 1:img(y,x)+1
                sum = sum + data(i);
            end
            output_img(y,x) = round(double(sum*255));
        end
    end 

end

