function output_img = equalize_hist( input_img )
    img = imread(input_img);
    [src_row, src_col] = size(img);
    output_img = uint8(zeros(src_row, src_col));
    i = 1;
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
    result = zeros(1,256);     %result用于统计每个均衡化后每个像素值的点的个数
    for x=1:src_col
        for y=1:src_row
            sum = 0;
            for i = 1:img(y,x)+1
                sum = sum + data(i);
            end
            output_img(y,x) = round(double(sum*255));
            result(output_img(y,x)+1) = result(output_img(y,x)+1)+1;
        end
    end 
    %对均衡化后的直方图进行归一化
    for k = 1:256
        result(k)=result(k)/(src_row*src_col);
    end
    
    subplot(2,2,3);
    imshow(output_img);
    title('均衡化后的图');
    subplot(2,2,1);
    imshow(img);
    title('原图');
    subplot(2,2,2);
    bar(0:255,double(data));
    title('原图的直方图');
    subplot(2,2,4);
    bar(0:255,double(result));
    title('均衡化后的直方图');
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


end

