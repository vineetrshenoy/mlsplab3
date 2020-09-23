function [class_s1, closest_image] = classify_s1(k, U, training, test)

    basis = U(:, 1:k);
    sub = basis * basis';
    [h_test, w_test] = size(test);
    train_proj = sub * training;
    classes = zeros(1, 40);
    
    [class_s1, index] = projection(test(:, 1), sub, train_proj);
    
    closest_image = training(:, index);

    figure();
    closest_image = reshape(closest_image, [112, 92]);
    imshow(closest_image, []);
    string = strcat('Closest image to s1 for k = ', num2str(k));
    title(string);
    filename = strcat('closestk=', num2str(k), '.jpg');
    saveas(gcf, filename);


end