function [train_mat] = get_training_data(direc)

    train_mat = zeros(112*92, 40*9);
    D = dir(direc);
    count = 1;
    D1 = string(["s1","s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10"]);
    D2 = string(["s11","s12", "s13", "s14", "s15", "s16", "s17", "s18", "s19", "s20"]);
    D3 = string(["s21","s22", "s23", "s24", "s25", "s26", "s27", "s28", "s29", "s30"]);
    D4 = string(["s31","s32", "s33", "s34", "s35", "s36", "s37", "s38", "s39", "s40"]);
    D = [D1, D2, D3, D4];
    for i=1:length(D)
        files = dir(fullfile(direc, D(i)));
        for j = 4:length(files)
        
            A = imread(fullfile(direc, D(i), files(j).name));
            B = reshape(A, [], 1);
            train_mat(:, count) = B(:);
            count = count + 1;
        end

    end

end
