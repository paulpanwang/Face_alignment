%To detect Face  
FDetect = vision.CascadeObjectDetector;  
%Read the input image  
I = imread('1.jpg');  
  
%Returns Bounding Box values based on number of objects  
face_dtect = step(FDetect,I);  
  
figure(1),  
imshow(I); hold on  
for i = 1:size(face_dtect,1)  
    rectangle('Position',face_dtect(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','m');  
end  
title('Face Detection');  
hold off;