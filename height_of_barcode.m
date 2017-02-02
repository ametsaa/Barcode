function [ymin, ymax, xmin, xmax, ROI]=height_of_barcode(image, ep)
% fonction permettant de supprimer les zones superflues se trouvant au
% dessus et en dessous de la region d'interet

    imshow(uint8(image));
    image2=image;
    [x, y] = ginput(2);
    x = floor(x);
    y = floor(y);

    xmin = min(x);
    xmax = max(x);
    
    ymin = min(y);
    ymax = max(y);

    data = image2(ymin:ymax,xmin:xmax);
    data = double(data);
    reference = data(1,:);

    den = sum(reference);
    num = den;
    ratio = den/num;

    while(1-ep < ratio && ratio < 1+ep)
        ymin = ymin-1;
        num = sum(double(image2(ymin,xmin:xmax)));
        ratio = num/den;
    end

    reference2 = data(end,:);
    den2 = sum(reference2);
    num2 = den2;
    ratio2 = den2/num2;


    while(1-ep < ratio2 && ratio2 < 1+ep)
        ymax = ymax+1;
        num2 = sum(double(image2(ymax,xmin:xmax)));
        ratio2 = num2/den2;
    end

    ROI = image2(ymin:ymax,xmin:xmax);
    imshow(uint8(ROI))
end