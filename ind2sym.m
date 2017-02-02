function [nb, classe] = ind2sym(ind)
% fonction qui convertit un indice faisant reference a une des signatures
% partielles de la table de l'ensemble des signatures partielles, en la
% classe qui correspond a cette signature partielle

    if (1 <= ind && ind <= 10)
        classe = 1;
    end
    
    if (11 <= ind && ind <= 20)
        classe = 2;
    end
    if (21 <= ind && ind <= 30)
        classe = -1;
    end
    
    tmp = mod(ind,10);
    if (tmp == 0)
        nb = 9;
    else
        nb = tmp - 1;
    end
    
end

