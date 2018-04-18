function result = Gaussian_generator( average, std, origin)
    img = rgb2gray(origin);
    [src_row, src_col] = size(img);
    result = zeros(src_row, src_col);
    gaussian = average + std.*randn(src_row, src_col);
    for x = 1:src_col
        for y = 1:src_row
            result(y,x) = img(y,x)+gaussian(y,x);
        end
    end
    %result = Mean_filter2d(0,9,result);
    %result = Geometric_mean(result);
    %result = Median_filter(result);
    result = uint8(result);
    %imshow(result);
end

