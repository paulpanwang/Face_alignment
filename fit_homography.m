function H = fit_homography(pts1_homogenous, pts2_homogenous)
%FIT_HOMOGRAPHY Summary of this function goes here

    if size(pts1_homogenous) ~= size(pts2_homogenous)
        error('Number of matched features in the subset supplied to fit_homography does not match for both images')
    end 
    
    [numMatches, ~] = size(pts1_homogenous);
    
    %create the A matrix
    A = []; % will be 2*numMatches x 9
    for i = 1:numMatches
        %assume homogenous versions of all the feature points
        p1 = pts1_homogenous(i,:);
        p2 = pts2_homogenous(i,:);
        
        % 2x9 matrix to append onto A. 
        A_i = [ zeros(1,3)  ,   -p1     ,   p2(2)*p1;
                    p1      , zeros(1,3),   -p2(1)*p1];
        A = [A; A_i];        
    end
    
    %solve for A*h = 0
    [~,~,eigenVecs] = svd(A); % Eigenvectors of transpose(A)*A
    h = eigenVecs(:,9);     % Vector corresponding to smallest eigenvalue 
    H = reshape(h, 3, 3);   % Reshape into 3x3 matrix
    H = H ./ H(3,3);        % Divide through by H(3,3)
    
end

