function output_img = equalize_hist( input_img )
    img = imread(input_img);
    [src_row, src_col] = size(img);
    output_img = uint8(zeros(src_row, src_col));
    i = 1;
    data = zeros(1,256);             %data��������ͳ��ÿ������ֵ�ĵ�ĸ���
    
    %ֱ��ͼ��һ��
    for x=1:src_col
        for y=1:src_row
            data(img(y,x)+1) = data(img(y,x)+1)+1;
        end
    end
    for k = 1:256
        data(k)=data(k)/(src_row*src_col);  %���ÿ������ֵ��Ƶ��
    end
    
    %����ֱ��ͼ���⻯
    result = zeros(1,256);     %result����ͳ��ÿ�����⻯��ÿ������ֵ�ĵ�ĸ���
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
    %�Ծ��⻯���ֱ��ͼ���й�һ��
    for k = 1:256
        result(k)=result(k)/(src_row*src_col);
    end
    
    subplot(2,2,3);
    imshow(output_img);
    title('���⻯���ͼ');
    subplot(2,2,1);
    imshow(img);
    title('ԭͼ');
    subplot(2,2,2);
    bar(0:255,double(data));
    title('ԭͼ��ֱ��ͼ');
    subplot(2,2,4);
    bar(0:255,double(result));
    title('���⻯���ֱ��ͼ');
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


end

