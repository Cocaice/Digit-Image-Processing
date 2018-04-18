function output_img = Mean_filter2d(Q, Size, origin)
    img=double(origin);
    [src_row, src_col] = size(img);
    for x=1:src_col
        for y=1:src_row
            sum = 0;
            sum1 = 0;
            n = (Size-1)/2;
            for i = 1:Size
                for j = 1:Size
                    a = x-n+i-1;
                    b = y-n+j-1;
                    %先判断像素点是否处于边缘，如果处于边缘，则补0。
                    if ( a >= 1 && b >= 1 && a <= src_col && b <= src_row)          
                        if (Q ~= 0)
                            sum = sum + img(b,a)^(Q+1);
                            sum1 = sum1 + img(b,a)^Q;
                        else
                            sum = sum + img(b,a)^(Q+1);
                            sum1 = sum1 + 1;
                        end
                        %sum = sum + img(b,a)^(Q+1);
                        %sum1 = sum1 + img(b,a)^Q;
                    else 
                        if (Q ~= 0)
                            sum = sum + 0;
                            sum1 = sum1 + 0;
                        else
                            sum = sum + 1;
                            sum1 = sum1 + 1;
                        end
                    end
                end
            end
            output_img(y,x) = uint8(sum/sum1);
        end
    end
    %subplot(1,2,2);
    %imshow(output_img);
    %title('处理后的图');
    %subplot(1,2,1);
    %imshow(origin);
    %title('原图');

end

