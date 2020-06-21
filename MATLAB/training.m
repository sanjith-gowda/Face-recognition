clear all;
close all;
clc;
%%


[trainImgs,valImgs,testImgs] = splitEachLabel(imds,0.6,0.1,0.3,'randomized');
net = alexnet;
imageSize = net.Layers(1).InputSize;

trainDs = augmentedImageDatastore(imageSize, trainImgs, 'ColorPreprocessing', 'gray2rgb');
testDs = augmentedImageDatastore(imageSize, testImgs, 'ColorPreprocessing', 'gray2rgb');


%%

layer = 'fc7';
trainingFeatures = activations(net,trainDs,layer,'OutputAs','rows');
classifier = fitcecoc(trainingFeatures,trainImgs.Labels);

%%
%%Calculate the test set features and calculate the test accuracy.

testFeatures = activations(net,testDs,layer,'OutputAs','rows');
testPred = predict(classifier,testFeatures);
acc=nnz(testPred == testImgs.Labels)/numel(testPred)

%%
plotconfusion(testImgs.Labels,testPred)