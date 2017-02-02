function [xmin, xmax, ymin, ymax] = get_input(image)
% fonction qui recupere les coordonnees de l'operateur
% on reaorganise les coordonnees (min, max) pour obtenir le rectangle
% selectione

imshow(uint8(image));
title('image de depart');

[x, y] = ginput(2);
x = floor(x);
y = floor(y);

xmin = min(x);
xmax = max(x);

ymin = min(y);
ymax = max(y);
end

