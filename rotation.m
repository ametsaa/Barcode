function [X, Y] = rotation(X, Y, rads, C)
% fonction realisant la rotation de plusieurs point dont les coordonnees en
% abscisse de ces points sont specifiees dans le vecteur X, et les
% coordonnees en ordonne dans le vecteur Y

    Xtmp = X - C(1);
    Ytmp = Y - C(2);
    X = Xtmp*cos(rads) - Ytmp*sin(rads) + C(1);
    Y = Xtmp*sin(rads) + Ytmp*cos(rads) + C(2);

end

