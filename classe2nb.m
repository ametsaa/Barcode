function [est_signature] = classe2nb(est_signature, classe)
% fonction qui determine le premier nombre via la procedure decrite dans le
% sujet

    el1 = [1 1 1 1 1 1; 1 1 2 1 2 2; 1 1 2 2 1 2;...
           1 1 2 2 2 1; 1 2 1 1 2 2];
    el2 = [1 2 2 1 1 2; 1 2 2 2 1 1; 1 2 1 2 1 2;...
           1 2 1 2 2 1; 1 2 2 1 2 1];
    
    el = [el1; el2];
    
    for i = 1:length(el(:,1))
        if (isequal(classe,el(i,:)))
            res = i-1;
            est_signature = [res est_signature];
        end
    end
    
    if (length(est_signature) == 12)
        est_signature = [-1 est_signature];
    end

end

