# working with images and videos
This file educates the seeker with using image function and video on python platfrom with ease.
 



Packages used for Environment Setup  **Laptop**
- 
* Python 3.6 
* pip 9.0.1
* numpy 1.16.4
* Imutils 0.5.3
* tensorflow 1.14.0
* cv2 4.1.1
* Keras

# Image manipulation 


## READ THE IMAGE !
```
import cv2
import imutils 

image = cv2.imread('image.jpg')

cv2.imshow('image read',image)

```
> -
> - 
> -
> -
> - 
> -
> -
> - 
> -
> -
> - 
> -
> - Couldn't see the image ? !   :astonished:
```
cv2.imshow('image read',image)
cv2.waitKey(0)

```
 :+1:
 ## Resize and crop :scissors:
 
 ```
 import cv2
 import imutils 

 image = cv2.imread('image.jpg')

 cv2.imshow('image read',image)

################ resize  #######################


image = imutils.resize(image, width = 500)


#################################################
 ```
 :scissors:
 ```

################ CROP #######################


image = image[y:y+h,x:x+h]

#############################################


 ```
 :star:

