
 h=imresize(rgb2gray(imread('finaltest2.jpg')),1);


 img=imrotate(h,0);
 
 figure(1),imshow(img);
 face = vision.CascadeObjectDetector();
 face.MergeThreshold = 10;

 box = step(face,img);
%%% box will have all the information of all detected faces

 faces = insertObjectAnnotation(img,'rectangle',box,'Face','LineWidth',2,'Color','red');
 figure(2),imshow(faces);

for i = 1:size(box,1)
 j= imcrop(img,box(i,:));
 j1=imresize(j,[480 480]);
 
 figure(3),subplot(5,5,i);imshow(j);
 queryFeatures = extractHOGFeatures(j1);
 personLabel = predict(faceClassifier,queryFeatures);
 display(personLabel)
end

 


