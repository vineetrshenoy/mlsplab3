function [train_mat] = get_training_data(direc)

    train_mat = zeros(112*92, 40*9);
    D = dir(direc);
    count = 1;
    for i=4:length(D)
        files = dir(fullfile(direc, D(i).name));
        for j = 4:length(files)
        
            A = imread(fullfile(direc, D(i).name, files(j).name));
            B = reshape(A, [], 1);
            train_mat(:, count) = B(:);
            count = count + 1;
        end

    end

end
