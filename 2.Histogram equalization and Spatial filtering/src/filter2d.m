function output_img = filter2d( input_img, filter )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    origin = imread(input_img);
    img=double(origin);
    [src_row, src_col] = size(img);
    [filter_row, filter_col] = size(filter);
    for x=1:src_col
        for y=1:src_row
            sum = 0;
            n = (filter_col-1)/2;
            for i = 1:filter_col
                for j = 1:filter_row
                    a = x-n+i-1;
                    b = y-n+j-1;
                    %���ж����ص��Ƿ��ڱ�Ե��������ڱ�Ե����0��
                    if ( a >= 1 && b >= 1 && a <= src_col && b <= src_row)          
                        sum = sum + filter(j,i)*img(b,a);
                    else sum= sum+0;
                    end
                end
            end
            %ƽ��
            %output_img(y,x) = sum;
            %������˹��ʱ������ľ������ĵ�ľ���ֵ��1.
            if(filter(n+1,n+1) < 0)
                output_img(y,x) = uint8(-sum);
            else output_img(y,x) = uint8(sum);
            end
        end
    end
    subplot(1,2,2);
    imshow(output_img);
    title('������ͼ');
    subplot(1,2,1);
    imshow(origin);
    title('ԭͼ');
    
end

