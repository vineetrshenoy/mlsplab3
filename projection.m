function [class_num, index] = projection(img, sub, train_proj)

    
    %vec = reshape(img, [], 1);
    proj = sub * img;
    
    [h, w] = size(train_proj);

    [X, Y] = meshgrid(ones(w, 1), proj);
    distance = vecnorm(train_proj - Y);

    [m, index] = min(distance);

    class_num = idivide(cast(index, 'uint8'), 9) + 1;

end