function [I,J]=circleimage(x,y,r, resolution)

x=x';y=y';

m = resolution; n= resolution;

I = zeros(m,n)+256;
I = im2double(I);


theta = 0:0.01:2*pi; % defining the cicularity of of the speckle

xrround = round(r*cos(theta));
yrround = round(r*sin(theta));
count = 1;


    for i = 1:size(x,2)
        for j = 1:size(xrround,2)
%% Use this to place a black spot on the center point of the circle

%     I(x(i),y(i)) = 0; % Black spot on the center of the speckle

%%  This creates the circumference of the circle.

    I(x(i)+xrround(j), y(i)+yrround(j)) = 0; % Creating the circle around the center I(x(i),y(i)).
    

%% Use to create a cross within the circle

%     fillx = (x(i)-1):(x(i)+1);
%     
%     for p = 1:size(fillx,2);
%         I(fillx(p), y(i)+yrround(j)) = 0;%Filling the space between the center and the circumference
%     end
%     
% 
% 
%     filly = (y(i)-1):(y(i)+1);
%     for p = 1:size(filly,2);
%         I(x(i)+xrround(j), filly(p)) = 0;
%     end
 %% Use for completely filling the circle
 
    fillx = (x(i)-xrround(j)):(x(i)+xrround(j));
    
    for p = 1:size(fillx,2);
        I(fillx(p), y(i)+yrround(j)) = 0;%Filling the space between the center and the circumference
    end
    
%     filly = y(i)+1:y(i)+yrround(j);

    filly = (y(i)-yrround(j)):(y(i)+yrround(j));
    for p = 1:size(filly,2);
        I(x(i)+xrround(j), filly(p)) = 0;
    end
    
count = count +1;
        end
    end


% adjust the resolution if need be using the imcrop function.
% J = imcrop(I, [0 0 1296 1044]);

J = I; % if not adjusted for resolution.
% figure()
% imshow(J)