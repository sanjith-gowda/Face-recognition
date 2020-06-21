
%% 
prompt = {'Enter your name:'};
dlgtitle = 'Input';
dims = [1 50];
ans = inputdlg(prompt,dlgtitle,dims)
mkdir(ans{1});
%%cam = ipcam('http://192.168.43.234:8081', '', '');
cam = webcam ;
pause(.2)
preview(cam);

for i = 1:150
x=snapshot(cam);

%filename = sprintf('E:/MATLAB/IoC/New folder/nc/%d.jpeg',i); %You can change your location of the folder
 
%imwrite(x,filename);

%end

%%

prompt = {'Enter your register number:'};
dlgtitle = 'Input';
dims = [1 50;1 15];
ans2 = inputdlg(prompt,dlgtitle,dims)
mkdir(ans2{1});

faceC = 1;
%for i = 1:150

    
filename = sprintf('E:/MATLAB/IoC/New folder/******/%d.jpeg',i);
    %x = imread(filename);

    FaceDetect = vision.CascadeObjectDetector;
    FaceDetect.MergeThreshold = 7 ;
    
    box = step(FaceDetect,x);
 faces = insertObjectAnnotation(x,'rectangle',box,'Face','LineWidth',2,'Color','red');
 %figure;
 imshow(faces);
        for i = 1:size(box,1)
        j= imcrop(x,box(i,:));
        j1=imresize(j,[112 92]);
        faceC = faceC +1;
        filename = sprintf('/Users/sanjithmgowda/Documents/Personal projects/Face-recognition/MATLAB/*********/%d.jpeg',faceC);
 
        imwrite(j1,filename);
        end
    
    

end

%% cahnge accordingly

rootFolder = fullfile('E:/MATLAB/IoC/New folder');   

categories = {'mc' , 'dc' , 'vc' , 'jc' , 'sc' , 'nnc'}; % should update accordingky 

imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
    

run('training.m')


