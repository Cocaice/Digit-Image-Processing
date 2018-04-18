function  result = Inpulse_generator( range1, range2, origin )
    img = rgb2gray(origin);
    [src_row, src_col] = size(img);   
    x = rand(src_row, src_col);  
    noise = zeros(src_row, src_col);  
    noise = img;
  
    noise(find(x<=range1)) = 0;  
    noise(find(x > range1 & x<(range1+range2))) = 255; 
    
    result = double(noise);
    %result = Geometric_mean(result);
    %result = Mean_filter2d(0,9,result);
    %result = Median_filter(result);
    %result = Min_filter(result);
    %result = Max_filter(result);
    result = uint8(result);
    %imshow(result);
end

