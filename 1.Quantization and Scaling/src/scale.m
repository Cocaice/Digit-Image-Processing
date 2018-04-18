function output_img = scale( name, columns, rows)
    img = imread(name);
    [src_row, src_col] = size(img);
    %计算出源图与目标图的长宽比
    col_rate = double(src_col / columns);
    row_rate = double(src_row / rows);
    output_img = uint8(zeros(rows,columns));
    
    for y=1:rows 
        for x=1:columns
            %针对双线性插值公式：f(x,y) = f(X+u,Y+v) = f(X,Y)*(1-u)*(1-v) +
            %f(X,Y+1)*(1-u)*v + f(X+1,Y)*u*(1-v) + f(X+1,Y+1)*u*v
            i = uint16(x*col_rate);
            j = uint16(y*row_rate);
          
            u = double(x*col_rate) - double(i);
            v = double(y*row_rate) - double(j);
            if i >= src_col;
                i = src_col - 1;
            end
            if j >= src_row;
                j = src_row - 1;
            end
            %利用公式计算
            output_img(y,x) = uint8(double(img(j,i))*(1-u)*(1-v)+ double(img(j+1,i))*(1-u)*v + double(img(j,i+1))*u*(1-v) + double(img(j+1,i+1))*u*v);

        end
    end
    imshow(output_img);
    figure,imshow(img);
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


end

