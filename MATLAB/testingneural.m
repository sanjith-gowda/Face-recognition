clc


% % flag = 0;
% % url = 'https://aiwarden.firebaseio.com/Switch.json';
% % s.button = 'ON'
% % 
% % 
% % while flag ~= 1
% %   
% %      reply = webread(url);
% %      tf = isequaln(reply,s);
% %      
% %      if tf == 1
% %         display("on")
% %         break
% %    
% %      end
% %   
% % end




cam = ipcam('http://100.113.33.23:8081', '', '');
%cam = webcam;
 c = {'---'};
 f = 0;
 l = 0;
 
 urlr = 'https://aiwarden.firebaseio.com/Switch.json';
 





s.button = 'ON';



while 1
    
    reply = webread(urlr);
    
    tf = isequaln(reply,s);
    
    if tf == 1
        display("on")
        t = datetime('now','TimeZone','local','Format','dd-MMM-yy  HH:mm ');
        url = sprintf('https://aiwarden.firebaseio.com/Date/%s.json',t);



        break
        
    else
        display("off")
    end
    
    
end



while 1
%eval([sprintf('img=imrotate(t%d,%d);',u,0)]);
 img = snapshot(cam);
 studentt = datetime('now','TimeZone','local','Format','HH:mm:ss ');
  %figure(1),

 face = vision.CascadeObjectDetector(); 
 face.MergeThreshold = 10;
 box = step(face,img);
 faces = insertObjectAnnotation(img,'rectangle',box,'Face','LineWidth',2,'Color','red');
% figure(2),
imshow(faces);
 
%jj=zeros(12,12);
  jj=zeros(size(box,1),4);
 %%
 clear z;
 z(1)={'regno'};
 %k(1)=string({z(1)});
 %z(1).FontWidth='bold';
 clear figure(3);
 for i =1:size(box,1)
 newImage= imcrop(img,box(i,:));

 
 

   
  
 ds = augmentedImageDatastore(imageSize, newImage, 'ColorPreprocessing', 'gray2rgb');
 imageFeatures = activations(net, ds, featureLayer, 'OutputAs', 'columns');
 label = predict(classifier, imageFeatures, 'ObservationsIn', 'columns')

  if label == c
      f = f+1;
  else
      f = f;
  end
  
  
 c = label;
 
 
  if f == 10
      disp('you are :');
      display(c);
      l = l+1;
       d = sprintf('{"%d": "%s                    %s"}',l,c,studentt);
       response = webwrite(url,d,weboptions('RequestMethod','patch'));

      f = 0;
  else
     % display('--');
  end
 
 
 
 
%    fname=['B:\attendance\' 'vishal' '.jpg'];
%    imwrite(j1,fname);
  %imgf=(encode(bag,j1));
  
  
   
%    imgf2=extractHOGFeatures(j2);
%    imgf3=extractHOGFeatures(j3);
%    imgf4=extractHOGFeatures(j4);
%    imgf5=extractHOGFeatures(j5);
%    imgf6=extractHOGFeatures(j6);

   
   %yfit(i) = trainedModel.predictFcn(data)
   %[personLabel1 score1 cost1] = predict(faceClassifier480,imgf1);
  % z1(i)=personLabel;
   
%    [personLabel2 score2 cost2] = predict(faceClassifier240,imgf2);
%    z2(i)=personLabel2;
%    
%     [personLabel3 score3 cost3] = predict(faceClassifier120,imgf3);
%    z3(i)=personLabel3;
%    
%     [personLabel4 score4 cost4] = predict(faceClassifier60,imgf4);
%    z4(i)=personLabel4;
%    
%     [personLabel5 score5 cost5] = predict(faceClassifier30,imgf5);
%    z5(i)=personLabel5;
%    
%     [personLabel6 score6 cost6] = predict(faceClassifier112,imgf6);
%    z6(i)=personLabel6;
%    %s(i)=score;
   %cost(i)=cost;

   
  % k(i+1)=string({z(i+1)});
  % imgf=(encode(bag,j1));
   %%
  %yfit = svmtrainedModel26.predictFcn(imgf);
   
  
 end
 %   eval([sprintf('hh(u,:)=z')]);
end
 %%
 %Filename='D:\attendance\atten.xlsx';
% Open Excel workbook
%Workbook = Excel.Workbooks.Open(Filename);
% Clear the content of the sheet
%Filename.ClearContents  
%     b={'Reg. no.: ';t}
%      [N, T, Raw]=xlsread(Filename);
%      [Raw{:, :}]=deal(NaN);
%      xlswrite(Filename, Raw);
% 
%  xlswrite('atten.xlsx',t);
 %q=[z1;z2;z3;z4;z5;z6];
% % % %  df=size(personIndex);
% % % %  sdf=df(2);
% % % %  for t=1:sdf
% % % %      kj = 1;
% % % %          dfg(kj)=personIndex(t);
% % % % kj=kj+1;
% % % %      
% % % %  end
 %%
 %xlswrite('finalatten.xlsx',dfg);
%  dfg = personLabel;
%  thingSpeakWriteURL = ['http://api.thingspeak.com/' 'update'];
%      writeApiKey = 'TA9MNJ25O1HC7UXN';
%      fieldName = 'field1';
%      dfg=['\' dfg '/'];
%      fieldValue = dfg;
%      response = webwrite(thingSpeakWriteURL,'api_key',writeApiKey,fieldName,fieldValue)
%   while response == '0'
%            response = webwrite(thingSpeakWriteURL,'api_key',writeApiKey,fieldName,fieldValue)
%   
%   end