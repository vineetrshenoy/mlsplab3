
clear,clc

training = load_training_data('orl_faces/Train');
imwrite(uint8(reshape(training(:, 10), [112, 92])),'training_sample.jpg')

[h, w] = size(training);
average = mean(training, 2);

[X, Y] = meshgrid(ones(w, 1), average);
centered_data = training - average;
imwrite(uint8(reshape(centered_data(:, 10), [112, 92])), 'centered_sample.jpg')

correlation_mat = centered_data * centered_data';
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

%reconstruction(img, U, 10, 6)
%reconstruction(img, U, 20, 7)
%reconstruction(img, U, 30, 8)
%reconstruction(img, U, 40, 9)
reconstruction(img, U, 360, 10)

%}
%{
test = load_testing_data('/home/vshenoy/jhu/mlsp/Lab_3/orl_faces/Test');
[h_test, w_test] = size(test) 

basis_10 = U(:, 1:10);
sub_10 = basis_10 * basis_10';


basis_20 = U(:, 1:20);
sub_20 = basis_20 * basis_20';

basis_30 = U(:, 1:30);
sub_30 = basis_30 * basis_30';

basis_40 = U(:, 1:40);
sub_40 = basis_40 * basis_40';

for i=1:w_test
    projection(test(:, i), sub_10, training)
end
%}