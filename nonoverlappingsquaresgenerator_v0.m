function [p, I,t,n] = nonoverlappingsquaresgenerator_v0(side, resolution, points, noncontactdistance, maxtime)

%This function generates a field of non-overlapping squares (in black) on
%a field of White (the color spectrum is controlled by the function square
%image. Essentially this function generates center points for the squares
%with a minimum non-contact distance (closest neighbor distance
%controlled). The side size here is in pixels while the resolution defines
%the size of the image delivering a [resolution x resolution] square
%image. The points variable controls the number of "centers" the algorithm
%will find. 

tic

p = [ceil(side/2)+1 ceil(side/2)+1]; %arbitrary starting point. (top left)
n = size(p,1); %count of centers 
% noncontactdistance = 3;
% while toc(timerid)<AllottedRunTime %activate for timercheck on each round
check = 2;
count = 0;
t = toc;
while n<points && t<maxtime
    %Selects a psuedorandom point between the range side/2 and resolution-2. 
    close all
    newrow =  randi([side resolution-side], 1, 2);
    
    %%Check the minimum distance of the newly generated pseudorandom
    %%points against the rest of the predetermined points on "p". If the
    %%minimum distance between all of them is greater than the side of
    %%the circle (non-overlapping condition). 
    
    for i = 1:n
          [d(i)] = (p(i,1)-newrow(1)).^2+(p(i,2)-newrow(2)).^2;
    end
    d= sqrt(d);
    %If nonoverlapping condiditon is achieved then the new points are added
    %as the new row into p. 
    
        if (min(d))>sqrt(2)*(side)+noncontactdistance
            p = [p;newrow];
%             count = count+1;
        end
      %Updating n for next round of iterations
        n = size(p,1);
        
        t = toc;
        
        if check == n
            count = count+1
        else
            count = 0;
            check = n;
        end
        
end
disp(n)


[I] = squareimage(p(:,1),p(:,2),side, resolution);imshow(I)

