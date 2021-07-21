% gammaCorr = vision.GammaCorrector(gamma,Name,Value)
% hgamma = vision.GammaCorrector(2.0,'Correction','De-gamma');
% imgCor = hgamma(img);
% imshow(img); title('Degammad');
img = imread('toys_L.jpg');

img_degamma = imadjust(img, [], [], 1/log(2.2));
 imshowpair(img,img_degamma,'montage')
% imshow(img_degamma)
% imwrite(img_degamma,'degamma.jpg')