function [p, J,t] = nonoverlappingcirclesgenerator(diameter, resolution, points, noncontactdistance, maxtime)

% This function generates a field of non-overlapping cirlces (in black) on
% a field of White (the color spectrum is controlled by the function circle
% image. Essentially this function generates center points for the circles
% with a minimum non-contact distance (closest neighbor distance
% controlled). The diameter here is in pixels while the resolution defines
% the size of the image delivering a [resolution x resolution] square
% image. The points variable controls the number of "centers" the algorithm
% will find. 

tic

p = [diameter/2+1 diameter/2+1]; %arbitrary starting point. (top left)
n = size(p,1); %count of centers 
% noncontactdistance = 3;
% while toc(timerid)<AllottedRunTime %activate for timercheck on each round
count = 1;
t = toc;
while n<points && t<maxtime
    %Selects a psuedorandom point between the range diameter/2 and resolution-2. 
    newrow =  randi([diameter round(resolution-diameter/2)], 1, 2);
    
    %%Check the minimum distance of the newly generated pseudorandom
    %%points against the rest of the predetermined points on "p". If the
    %%minimum distance between all of them is greater than the diameter of
    %%the circle (non-overlapping condition). 
    
    for i = 1:n
%         [d(i),l] = min( (p(i,1)-newrow(1)).^2+(p(i,2)-newrow(2)).^2);
          [d(i)] = (p(i,1)-newrow(1)).^2+(p(i,2)-newrow(2)).^2;
    end
    %If nonoverlapping condiditon is achieved then the new points are added
    %as the new row into p. 
    
        if sqrt(min(d))>diameter+noncontactdistance
            p = [p;newrow];
            count = count+1;
        end
      %Updating n for next round of iterations
        n = size(p,1);
%         t = toc;
end

[I,J] = circleimage(p(:,1),p(:,2),diameter/2, resolution);
% imshow(J)

% MIG_Final = MIG_Prewitt(J);

%% Display Results
% disp(['Simulation MIG Value = ' num2str(MIG_Final)])
% 
% [ResolutionField, SIG]  = SSSIG(J, 20, 10);

