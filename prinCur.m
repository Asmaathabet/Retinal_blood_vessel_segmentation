function lamda2=prinCur(Image)
% This Function perform region extraction of feature - principal curvature
% of the image which is needed in applying region groeing
% Input : Image
% Output : 
% - obtain parameters for Hessian matrix in every pixel 
% - find eigen values of the Hessian matrix using findLamda function

% Obtain parameters for Hessian matrix
[gx, gy] = gradient(double(Image));
[gxx, gxy] = gradient(gx);
[gxy, gyy] = gradient(gy);

[row,col]=size(Image);
lamdaplus = zeros(row,col);
lamdaminus = zeros(row,col);

%finding eigen values of Hessian matrix [gxx gxy;gxy gyy]

for r = 1:row
    for c = 1:col
            [lamdaplus(r,c),lamdaminus(r,c)]=findLamda(gxx(r,c),gyy(r,c),gxy(r,c));
    end
end

lamda2 = lamdaplus;
end