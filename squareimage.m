function [II] = squareimage(x, y, side, resolution)

%X, y are coordinate locations of the center of the square. Thus squares
%will be odd sized. s is the length of the side of sqaure speckle while
%resolution is the size of the entire image.

II = zeros(resolution)+256;

II =im2double(II);

if mod(side,2)~=1
    step = ceil(side/2);
%     disp(['Side is increased by 1 pixel to: ' num2str(side+1)])
else
    step = floor(side/2);
end


%We are rounding up with the intention that it is safer to confidently
%register the speckle on the camera system at the (theoretical) loss of
%spatial resolution

for i = 1:length(x)
           
%         II(x(i),y(i)) = 0;
        
        for ii = -step:step
            for jj = -step:step
                II(x(i)+ii, y(i)+jj) = 0;
            end
        end
    
end


