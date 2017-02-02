function [angle] = get_teta(image_rot)
% fonction qui estime la rotation de l'image via la transformee de Hough

    % on detecte les contours par la methode sobel
    edge_image = edge(double(image_rot), 'sobel');

    [H, T, R] = hough(edge_image);

    % on recupere l'indice (angle) en cherchant la colonne
    % dont la variance est maximale
    [~, ind] = max(var(H,0,1));
    angle =  (ind-1) - 90;
    
    %Affichage    
    figure, imshow(uint8(H),'XData',T,'YData',R,...
        'InitialMagnification','fit');
    title('Transformee de Hough');
    xlabel('\theta'), ylabel('\rho');
    axis on, axis normal, hold on;
end

