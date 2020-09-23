function [classes] = classify_faces(k, U, training, test)

    basis = U(:, 1:k);
    sub = basis * basis';
    [h_test, w_test] = size(test);
    train_proj = sub * training;
    classes = zeros(1, 40);
    for i=1:w_test
        classes(i) = projection(test(:, i), sub, train_proj);
    end

end