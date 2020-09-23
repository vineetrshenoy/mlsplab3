function [class_num] = projection(img, sub, train)

    
    %vec = reshape(img, [], 1);
    proj = sub * img;
    train_proj = sub * train;
    [h, w] = size(train_proj)

    [X, Y] = meshgrid(ones(w, 1), proj);
    distance = vecnorm(train_proj - Y);

    [m, index] = min(distance)

    class_num = idivide(index, 9) + 1

end