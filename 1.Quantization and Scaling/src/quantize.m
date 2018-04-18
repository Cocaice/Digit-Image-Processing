function output_img= quantize( name, level )
    img = imread(name);
    [src_row, src_col] = size(img);
    output_img = uint8(zeros(src_row,src_col));
    range_length = uint8(255/(level-1));
    range = uint8(256/level);
    for x=1:src_col
        for y=1:src_row
            temp = uint8(img(y,x)/range);
            
            output_img(y,x) = temp*range_length;
        end
    end
    imshow(output_img);
    figure,imshow(img);
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


end

