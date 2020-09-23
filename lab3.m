%{
clear,clc

training = load_training_data('orl_faces/Train');
imwrite(uint8(reshape(training(:, 10), [112, 92])),'training_sample.jpg')

[h, w] = size(training);
average = mean(training, 2);

[X, Y] = meshgrid(ones(w, 1), average);
centered_data = training - Y;
imwrite(uint8(reshape(centered_data(:, 10), [112, 92])), 'centered_sample.jpg')

%correlation_mat = centered_data * centered_data';
%[V, D] = eig(correlation_mat);
[U, S, V] = svd(centered_data);                      
eigenvalues = diag(S.^2);


%Plotting the eigen values
fig1 = figure(1);
plot(1:360, eigenvalues)
title('Eigenvalues')

saveas(gcf, 'eigenvalues.png')

%First eigenface
fig2 =figure(2);
subplot(1, 4, 1)
hold on;
imshow(reshape(U(:, 1), [112, 92]), [])
title('First Eigenface')


%Second eigenface
subplot(1, 4, 2)
imshow(reshape(U(:, 2), [112, 92]), [])
title('Second Eigenface')


%Third eigenface
subplot(1, 4, 3)
imshow(reshape(U(:, 3), [112, 92]), [])
title('Third Eigenface')


%Last eigenface
subplot(1, 4, 4)
imshow(reshape(U(:, 360), [112, 92]), [])
title('Last Eigenface')
hold off;

saveas(fig2, 'eigenfaces.jpg')

imgname = 'orl_faces/Train/s1/1.pgm';
img = imread(imgname);

reconstruction(img, U, 10, 6)
reconstruction(img, U, 20, 7)
reconstruction(img, U, 30, 8)
reconstruction(img, U, 40, 9)
reconstruction(img, U, 100, 10)
reconstruction(img, U, 150, 10)
reconstruction(img, U, 250, 10)
reconstruction(img, U, 360, 10)

%}

test = load_testing_data('orl_faces/Test');
[h_test, w_test] = size(test); 

%classes_10 = classify_faces(10, U, training, test)
%classes_20 = classify_faces(20, U, training, test)
%classes_30 = classify_faces(30, U, training, test)
%classes_40 = classify_faces(40, U, training, test)


[class_s1, closest] = classify_s1(10, U, training, test);
[class_s2, closest] = classify_s1(20, U, training, test);
[class_s3, closest] = classify_s1(30, U, training, test);
[class_s4, closest] = classify_s1(40, U, training, test);