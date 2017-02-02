function [est_nb, classe, u] = estimate_signature(sb)
% fonction permettant d'estimer la signature
% sb : signature binarisee (vecteur ligne)
% est_nb : le vecteur final contenant les nombres decodes

l = length(sb);
u = l/89;

if (u > 1 && u < 2)
    disp('Shannon theorem not checked !');
    est_nb = 0;
    classe = 0;
else
    el_th = table_el_th();
    classe = zeros(1,6);
    ya=1;
    xb=8;
    xa=1;

% on determine la taille d'une signature partielle dans la signature
% binarisee puis on sur-echantillonne toutes les signatures theoriques
% afin de pouvoir calculer la correlation entre la signature
% partielle et ces signatures

% pour les six premiers chiffres, on ne prend pas en compte la garde
% normale, il en est de meme pour les six derniers chiffres.

    for i = 1:6
        sig_ex = sb(floor((i-1)*7*u)+1:floor(i*7*u));
        sp = sig_ex - mean(sig_ex);
        den2 = norm(sp);
        yb = length(sig_ex);
        y = (yb-ya)/(xb-xa);
        for k = 1:length(el_th(:,1))
            sig_th = zeros(1,yb);
            for j = 1:7
                ind1 = floor(y*(j-1))+1;
                ind2 = floor(y*j)+1;
% on calcule l'intervalle de sur-echantillonnage pour
% la signteure theorique dont les bornes sont ind1 et
% ind2
                if (j ~= 1)
                    ind1 = ind1 + 1;
                end
                sig_th(ind1:ind2) = el_th(k,j).*ones(1,length(ind1:ind2));
            end

            sth = sig_th - mean(sig_th);
            den1 = norm(sth);
% intercorrelation entre la signature partielle et la signature
% theorique
            c(k) = sum(sth.*sp)/(den1*den2);
            
        end

        [~, ind] = max(c); % determination de la signature partielle
% par maximisation de la intercorrelation
        [est_nb(i), classe(i)] = ind2sym(ind);

    end

    for i = 7:12
        sig_ex = sb(floor(5*u+(i-1)*u*7)+1:floor(i*u*7+5*u));
        sp = sig_ex - mean(sig_ex);
        den2 = norm(sp);
        yb = length(sig_ex);
        y = (yb-ya)/(xb-xa);
        for k = 1:length(el_th(:,1))
            sig_th = zeros(1,yb);
            for j = 1:7
                ind1 = floor(y*(j-1))+1;
                ind2 = floor(y*j)+1;
                if (j ~= 1)
                    ind1 = ind1 + 1;
                end
                sig_th(ind1:ind2) = el_th(k,j).*ones(1,length(ind1:ind2));
            end

            sth = sig_th - mean(sig_th);
            den1 = norm(sth);

            c(k) = sum(sth.*sp)/(den1*den2);
        end

        [~, ind] = max(c);
        [est_nb(i), ~] = ind2sym(ind);

    end
end

end

