function residuals = calc_residuals(H, homoCoord1, homoCoord2)
%CALC_RESIDUALS Summary of this function goes here
%   Detailed explanation goes here

    %transform the points from img 1 by multiplying the homo coord by H
    transformedPoints = homoCoord1 * H;
    
    %divide each pt by 3rd coord (scale factor lambda) to yield [x;y;1]
    %before taking difference
    lambda_t =  transformedPoints(:,3); %scale factor
    lambda_2 = homoCoord2(:,3);    %scale factor 
    cartDistX = transformedPoints(:,1) ./ lambda_t - homoCoord2(:,1) ./ lambda_2;
    cartDistY = transformedPoints(:,2) ./ lambda_t - homoCoord2(:,2) ./ lambda_2;
    residuals = cartDistX .* cartDistX + cartDistY .* cartDistY;
end

