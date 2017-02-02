function [bool] = control_key( est_signature )
% fonction qui calcule la clef de controle et qui permet de valider le
% code-barres dechiffre
    
    last = 0; 
    for i=1:2:length(est_signature)-1
        last = last + est_signature(i);
    end
    
    tmp = 0;
    for i=2:2:length(est_signature)-1
       
            tmp = tmp + est_signature(i);
      
    end
    last = last + 3*tmp;
    
    last = mod(last, 10);
    key = 10 - est_signature(13);
    key = mod(key,10);
    
    if (key == last)
       bool = 1;
       disp('Barcode is right ! :)');
    else
        bool = 0;
        disp('Barcode is wrong ! :(');
    end
    
end

