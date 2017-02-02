function [s] = get_signature(image, ymin, ymax, xmin, xmax)
% fonction qui projette l'image 2D dans un vecteur
% cette fonction nous permet de projeter la region d'interet
% dans un vecteur
    for n = 0:xmax - xmin
        s_tmp = 0;
        for y = ymin:ymax
            s_tmp = s_tmp + double(image(y,n+xmin));                   
        end
        s(n+1) = (1/(ymax+1-ymin))*s_tmp;
    end
    
    figure,
    plot(s);
    title('s_T');
   
end
