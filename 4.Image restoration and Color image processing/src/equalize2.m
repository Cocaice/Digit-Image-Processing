function  img = equalize2(origin)
    img = origin;
    img_r = img(:,:,1);
    img_g = img(:,:,2);
    img_b = img(:,:,3);

    

    [src_row, src_col] = size(img_r);
    data_r = zeros(1,256);     
    data_g = zeros(1,256);
    data_b = zeros(1,256);
    data = zeros(1,256);    %data数组用作统计每个像素值的点的个数
    
    %直方图归一化
    for x=1:src_col
        for y=1:src_row
            data_r(img_r(y,x)+1) = data_r(img_r(y,x)+1)+1;
            data_g(img_g(y,x)+1) = data_g(img_g(y,x)+1)+1;
            data_b(img_b(y,x)+1) = data_b(img_b(y,x)+1)+1;
        end
    end
    for k = 1:256
        data(k)=(data_r(k)+data_g(k)+data_b(k))/(src_row*src_col*3);  %求出每个像素值的频率
    end
    
    %进行直方图均衡化
    for x=1:src_col
        for y=1:src_row
            sum = 0;
            for i = 1:img_r(y,x)+1
                sum = sum + data(i);
            end
            img_R(y,x) = round(double(sum*255));
        end
    end 
    
    for x=1:src_col
        for y=1:src_row
            sum = 0;
            for i = 1:img_g(y,x)+1
                sum = sum + data(i);
            end
            img_G(y,x) = round(double(sum*255));
        end
    end 
    
    for x=1:src_col
        for y=1:src_row
            sum = 0;
            for i = 1:img_b(y,x)+1
                sum = sum + data(i);
            end
            img_B(y,x) = round(double(sum*255));
        end
    end 
    
    img(:,:,1) = img_R;
    img(:,:,2) = img_G;
    img(:,:,3) = img_B;
    
    
    %imshow(img);

end

