clc; clear ; close all;

%% Initialisation des variables
image = imread('image/barcode_rotate2.jpg');
image = double(image(:,:,1));
ep = 0.2;
N = 256;

% Traitement de l'image
% Recuperation des coordonnees de l'operateur ainsi que de l'angle de
% rotation de l'image
[xmin, xmax, ymin, ymax] = get_input(image);
angle = get_teta(image);

% Redressement de l'image
[new_image, min_x, max_x, min_y, max_y] = ...
my_imrotate(image, xmin, xmax, ymin, ymax, angle);

figure,
imshow(uint8(new_image));

figure,
test = new_image;
test(min_y:max_y, min_x:max_x) = 127;
imshow(uint8(test));
%%
% Suppression des zones superflues au dessus du code-barres
[ROI, min_x, max_x, min_y, max_y] = ...
get_ROI(new_image, ep, min_x, max_x, min_y, max_y);

% Projection dans l'espace a une dimension
s = get_signature(new_image, min_y, max_y, min_x, max_x);

% Binarisation de la signature prealablement calculee
[crit, ind, sb, xcenter] = binarize(N, ROI, s);

% Decodage du code-barres et verification que le procede s'est opere
% correctement
[final, classe] = estimate_signature(sb);
if (length(final) ~= 1)
    res = classe2nb(final, classe);
    if (res(1) == -1 || sum(res) == 0)
        disp('Barcode is wrong ! :(');
    else
        bool = control_key(res);
    end
end