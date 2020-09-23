function [] = reconstruction(image, eigenvectors, k, fignum, average)

    basis = eigenvectors(:, 1:k);

    img_flat = im2double(reshape(image, [], 1));
    weights = basis' * img_flat;

    approx = basis * weights;
    

    fig = figure(fignum);
    hold on;

    subplot(1, 3, 1)
    imshow(image, [])
    title('Original')


    approx_img = reshape(approx, [112, 92]);
    subplot(1, 3, 2)
    imshow(approx_img, [])
    title('Approximation')


    subplot(1, 3, 3)
   
    difference = double(image) - 255*double(approx_img);
    imshow(difference, [])
    title('Difference')

    filename = strcat('reconstruction_k_', int2str(k), '.png');
    
    subplot_title = strcat('Number of eigenvectors: ', int2str(k));
    sgtitle(subplot_title);
    saveas(fig, filename)


end