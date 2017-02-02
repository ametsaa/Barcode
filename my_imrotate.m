function [new_image, min_x, max_x, min_y, max_y] = my_imrotate(image, xmin, xmax, ymin, ymax, angle)
% fonction realisant la rotation de l'image et des entrees faites par l'operateur

        rads = angle*pi/180;
        
        [h1, w1] = size(image);
        c = [0, 0];

        [x, y] = rotation([xmin, xmax], [ymin, ymax], -rads, c);
        xmin = floor(min(x));
        xmax = floor(max(x));
        ymin = floor(min(y));
        ymax = floor(max(y));

        [x, y] = rotation([1, w1, 1, w1], [1, 1, h1, h1], -rads, c);
        x_min = floor(min(x));
        x_max = floor(max(x));
        y_min = floor(min(y));
        y_max = floor(max(y));

        [Xtmp, Ytmp] = meshgrid(x_min:x_max, y_min:y_max);
        new_image = ones(y_max-y_min+1, x_max-x_min+1)*255;
        [h2, w2] = size(new_image);
        [X, Y] = rotation(Xtmp, Ytmp, rads, c);
        X = floor(X);
        Y = floor(Y);

        for i=1:w2
            for j=1:h2
                if (Y(j,i) > 0 && Y(j,i) <= h1 &&  X(j,i) > 0 && X(j,i) <= w1)
                    new_image(j,i) = image(Y(j,i), X(j,i));
                end
            end
        end

	[~, min_x] = ismember(xmin, Xtmp');
	[~, max_x] = ismember(xmax, Xtmp');
	[~, min_y] = ismember(ymin, Ytmp);
	[~, max_y] = ismember(ymax, Ytmp);

end