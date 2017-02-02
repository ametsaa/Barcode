function [ ROI, xmin, xmax, ymin, ymax ] = get_ROI( image, ep, xmin,...
                                                    xmax, ymin, ymax )
% fonction recuperant le rectangle determine par l'operateur
    data = double(image(ymin:ymax, xmin:xmax));
    figure, 
    imshow(uint8(data));
    title('rectangle recupere par l''operateur');
    
    reference = data(1,:);
    den = sum(reference);
    num = den;
    ratio = den/num;

    while(1-ep < ratio && ratio < 1+ep)
        ymin = ymin-1;
        if (ymin ~= 0)
            num = sum(double(image(ymin,xmin:xmax)));
            ratio = num/den;
        else
            ymin = 1;
            break;
        end
    end

    reference2 = data(end,:);
    den2 = sum(reference2);
    num2 = den2;
    ratio2 = den2/num2;


    while(1-ep < ratio2 && ratio2 < 1+ep)
        ymax = ymax+1;
        if (ymax ~= length(image(:,1)))
            num2 = sum(double(image(ymax,xmin:xmax)));
            ratio2 = num2/den2;
        else
            ymax = length(image(:,1));
            break;
        end
    end

    ROI = image(ymin:ymax,xmin:xmax);
    figure,
    imshow(uint8(ROI))
    title('region d''interet en hauteur');

end

