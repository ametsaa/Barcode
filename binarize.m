function [crit, ind, sb, xcenter] = binarize(N, ROI, signature)
% binarisation de la signature
    [h, xcenter] = hist(ROI(:),N);

    figure
    stem(xcenter, h);
    title('histogramme de la region d''interet');
    xlabel('classe de pixels');

    crit = 0;

    for k = 1:N
        w(k) = sum(h(1:k))/sum(h);
        s = 0;
        for i = 1:k
            s = s + i*h(i);
        end
        mu(k) = s/sum(h);
    end

    for k = 1:N
        crit(k) = w(k)*(mu(N)-mu(k))^2 + (1-w(k))*mu(k)^2;
    end

    figure,
    plot(crit);
    title('critere d''Otsu');
    
    [~, ind] = max(crit)

    sb = signature > ind;

    [beg_ind, end_ind] = crop_signature(sb);

    sb = sb(beg_ind:end_ind);

    figure,
    plot(sb);
    title('signature binarisee');
    ylim([-0.5 1.5]);
    

end