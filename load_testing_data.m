function [train_mat] = get_testing_data(direc)

    train_mat = zeros(112*92, 40*1);
    D = dir(direc);
    count = 1;
    for i=4:length(D)
        
        files = dir(fullfile(direc, D(i).name));
        
        
        A = imread(fullfile(direc, D(i).name, files(3).name));
        B = reshape(A, [], 1);
        train_mat(:, count) = B(:);
        count = count + 1;
        

    end

end
