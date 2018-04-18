function  img = equalize (origin)
    img = origin;
    img_r = img(:,:,1);
    img_g = img(:,:,2);
    img_b = img(:,:,3);
    img_R = equalize_hist(img_r);
    img_G = equalize_hist(img_g);
    img_B = equalize_hist(img_b);
    img(:,:,1) = img_R;
    img(:,:,2) = img_G;
    img(:,:,3) = img_B;
    
    %imshow(img);
    %imshow(origin);

end

