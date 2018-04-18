function result = equalize3(origin)
    img = double(origin);
    img_r = img(:,:,1)/255;
    img_g = img(:,:,2)/255;
    img_b = img(:,:,3)/255;
    [src_row, src_col] = size(img_r);
    data = zeros(1,256); 
    %calculate H
    for x=1:src_col
        for y=1:src_row
            temp1 = 0.5 * (img_r(y,x)-img_g(y,x)+img_r(y,x)-img_b(y,x));
            temp2 = sqrt((img_r(y,x)-img_g(y,x))^2 + (img_r(y,x)-img_b(y,x))*(img_g(y,x)-img_b(y,x)));
            O = acos(temp1/temp2);
            if (img_b(y,x) <= img_g(y,x))
                H(y,x) = O/(2*pi)*255;
            else
                H(y,x) = (2*pi - O)/(2*pi)*255;
            end
            H(y,x) = uint8(H(y,x));
        end
    end
    %calculate S
    for x=1:src_col
        for y=1:src_row
            a = [img_g(y,x),img_r(y,x),img_b(y,x)];
            temp1 = min(a);
            temp2 = img_g(y,x)+img_r(y,x)+img_b(y,x);
            S(y,x) = (1-(3/temp2)*temp1)*255;
        end
    end
    
    %calculate I
    for x=1:src_col
        for y=1:src_row
            temp = img_g(y,x)+img_r(y,x)+img_b(y,x);
            I(y,x) = uint8(1/3 * temp*255);
        end
    end
    
    %直方图归一化
    for x=1:src_col
        for y=1:src_row
            data(I(y,x)+1) = data(I(y,x)+1)+1;
        end
    end
    for k = 1:256
        data(k)=data(k)/(src_row*src_col);  %求出每个值的频率
    end
    %进行直方图均衡化
    for x=1:src_col
        for y=1:src_row
            sum = 0;
            for i = 1:I(y,x)+1
                sum = sum + data(i);
            end
            I2(y,x) = round(double(sum*255));
        end
    end
    S = double(S/255);
    I2 = double(I2/255);
    %transform HSI to RGB
    for x=1:src_col
        for y=1:src_row
            H(y,x) = double(H(y,x)/255*2*pi);
            if (H(y,x)>= 0 && H(y,x) < 2/3*pi)
                B(y,x) = I2(y,x)*(1-S(y,x));
                R(y,x) = I2(y,x)*(1+S(y,x)*cos(H(y,x))/cos(1/3*pi - H(y,x)));
                G(y,x) = 3*I2(y,x)-(R(y,x)+B(y,x));
            end
            if (H(y,x)>= 2/3*pi && H(y,x) < 4/3*pi)
                H(y,x) = H(y,x)-2/3*pi;
                R(y,x) = I2(y,x)*(1-S(y,x));
                G(y,x) = I2(y,x)*(1+S(y,x)*cos(H(y,x))/cos(1/3*pi - H(y,x)));
                B(y,x) = 3*I2(y,x)-(R(y,x)+G(y,x));
            end
            if (H(y,x)>= 4/3*pi && H(y,x) <= 2*pi)
                H(y,x) = H(y,x)-4/3*pi;
                G(y,x) = I2(y,x)*(1-S(y,x));
                B(y,x) = I2(y,x)*(1+S(y,x)*cos(H(y,x))/cos(1/3*pi - H(y,x)));
                R(y,x) = 3*I2(y,x)-(G(y,x)+B(y,x));
            end
        end
    end
    
    
    
    result(:,:,1)=R;
    result(:,:,2)=G;
    result(:,:,3)=B;
    
    %imshow(result)
    %title('result');
end

