
%%
cam = ipcam('http://192.168.43.1:8081', '', '');
%cam = webcam;
 c = 0;
 f = 0;
 l=0;

%%
 img = snapshot(cam);
 student = datetime('now','TimeZone','local','Format','HH:mm:ss ');
  %figure(1),

 face = vision.CascadeObjectDetector(); 
 face.MergeThreshold = 7;
 box = step(face,img);
 faces = insertObjectAnnotation(img,'rectangle',box,'Face','LineWidth',2,'Color','red');
% figure(2),
imshow(faces)
 
%jj=zeros(12,12);
  jj=zeros(size(box,1),4);
  
 %%
 %clear z;
 %z(1)={'regno'};
 %k(1)=string({z(1)});
 %z(1).FontWidth='bold';
 %clear figure(3);
 %for i =1:size(box,1)
 %newImage= imcrop(img,box(i,:))
         for i = 1:size(box,1)
        j= imcrop(img,box(i,:));
        j1=imresize(j,[112 92]);

 end
 

   layer = 'fc7';
 imageSize = net.Layers(1).InputSize;
 ds = augmentedImageDatastore(imageSize, j1, 'ColorPreprocessing', 'gray2rgb');
 imageFeatures = activations(net, ds, layer, 'OutputAs', 'rows');
 label = predict(classifier, imageFeatures)
 disp(label)

  if (label == trainImgs.Labels(75))
      f = f+1;
  else
      f = f;
  end
  
  c=label;
 
 
 
  if f == 1
      disp('you are :')
      display(c)
      l = l+1;
       d = sprintf('{"%d": "%s                    %s"}',l,c,student)
       %response = webwrite(url,d,weboptions('RequestMethod','patch'));

      f = 0;
  else
     display('--')
  end