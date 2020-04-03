function [p, I,centers_count] = nonoverlappingsquaresgenerator_new(side, resolution)

%This function generates a field of non-overlapping squares (in black) on
%a field of White (the color spectrum is controlled by the function square
%image. Essentially this function generates center points for the squares
%with a minimum non-contact distance (closest neighbor distance
%controlled). The side size here is in pixels while the resolution defines
%the size of the image delivering a [resolution x resolution] square
%image. The points variable controls the number of "centers" the algorithm
%will find. 


p = [ceil(side/2)+1 ceil(side/2)+1]; %arbitrary starting point. (top left)

%% Creating an array of potential center points. This ensures that the same points are never checked again.

list = zeros((resolution-2*side+1)^2,2); 
new = 1;
for i = side:(resolution-side)
    for j = side:(resolution-side)
        list(new, 1) = i;
        list(new,2) = j;
        new = new+1;
    end
end

n = size(list,1);

while n>1
    %Selects a psuedorandom point between the range side/2 and resolution-2. 
    
    n = size(list,1)
    row = randi(n);
    newrow =  list(row,:);
    
    %%Check the minimum distance of the newly generated pseudorandom
    %%points against the rest of the predetermined points on "p". If the
    %%minimum distance between all of them is greater than the side of
    %%the circle (non-overlapping condition). 
    
    for i = 1:size(p,1)
          d(i) = (p(i,1)-newrow(1)).^2+(p(i,2)-newrow(2)).^2;
    end
    d= sqrt(d);
    %If nonoverlapping condiditon is achieved then the new points are added
    %as the new row into p. 
    
%         if (min(d))>(sqrt(2)*(side+noncontactdistance))
        if (min(d))>sqrt(3)*((side))
            p = [p;newrow];   
            size(p,1);
%             [I] = squareimage(p(:,1),p(:,2),side, resolution);imshow(I)
        end
        
     list(row,:) = [];
       
end

centers_count = size(p,1);
[I] = squareimage(p(:,1),p(:,2),side, resolution);imshow(I)
