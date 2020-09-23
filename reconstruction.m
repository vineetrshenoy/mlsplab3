function [] = reconstruction(image, eigenvectors, k, fignum, average)

    basis = eigenvectors(:, 1:k);

    img_flat = im2double(reshape(image, [], 1));
    weights = basis' * img_flat;

    approx = basis * weights;
    

    figure(fignum)
    hold on;

    subplot(1, 3, 1)
    imshow(image, [])
    title('Original')


    approx_img = reshape(approx, [112, 92]);
    subplot(1, 3, 2)
    imshow(approx_img, [])
    title('Approximation')


    subplot(1, 3, 3)
    imshow(double(image) - double(approx_img), [])
    title('Difference')


end