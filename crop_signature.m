function [beg_ind, end_ind] = crop_signature(sb)
% fonction qui elimine lez zones superflues se trouvant a gauche et a
% droite de la region d'interet
    count = 0;
    beg_ind = 1;

    for i = 1:length(sb)
        if (count < 2)
            if (sb(i)==1 && sb(i+1)==0)
                count = count+1;
            end
        else
            if (sb(i)==0 && sb(i+1)==1)
                beg_ind = i+1;
                break;
            end
        end
    end

    count = 0;
    end_ind = 1;

    for i = length(sb):-1:1
        if (count < 2)
            if (sb(i)==1 && sb(i-1)==0)
                count = count+1;
            end
        else
            if (sb(i)==0 && sb(i-1)==1)
                end_ind = i-1;
                break;
            end
        end
    end
end