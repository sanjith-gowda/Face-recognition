from scipy.spatial import distance as dist
from imutils import perspective
from imutils import contours
import numpy as np
import argparse
import imutils
import cv2
import time
#from shapedetector import ShapeDetector   



def midpoint(ptA, ptB):
	return ((ptA[0] + ptB[0]) * 0.5, (ptA[1] + ptB[1]) * 0.5)

#image1 = cv2.imread("img5test.jpg")

#image = imutils.resize(image1, width=600)

#stream = cv2.VideoCapture('http://admin:admin@192.168.1.7:8081')

#time.sleep(2)
#sd = ShapeDetector()
width = 0.0
pixelsPerMetric = 16.71428
focal_length = 0.0



#r, f = stream.read()

image = cv2.imread('**write the image name with its for mat eg.(square.jpg)**')



gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
gray = cv2.GaussianBlur(gray, (7, 7), 0)



edged = cv2.Canny(gray, 50, 100)
edged = cv2.dilate(edged, None, iterations=1)
edged = cv2.erode(edged, None, iterations=1)

cnts = cv2.findContours(edged.copy(), cv2.RETR_EXTERNAL,
        cv2.CHAIN_APPROX_SIMPLE)
cnts = imutils.grab_contours(cnts)

(cnts, _) = contours.sort_contours(cnts)
#
######## pixel per metric deff ##################

pixelsPerMetric = 12.927973545765013


#
for c in cnts:
#

        if cv2.contourArea(c) < 100:
                continue

##### shape #####
        
        shape = sd.detect(c)
        
###########################################################        
        orig = image.copy()
        box = cv2.minAreaRect(c)
        box = cv2.cv.BoxPoints(box) if imutils.is_cv2() else cv2.boxPoints(box)
        box = np.array(box, dtype="int")


        box = perspective.order_points(box)
        cv2.drawContours(orig, [box.astype("int")], -1, (0, 255, 0), 2)

# origin points 
        for (x, y) in box:
                cv2.circle(orig, (int(x), int(y)), 5, (0, 0, 255), -1)

        (tl, tr, br, bl) = box
#print("tl={}, tr={}, br={}, bl={}".format(tl, tr, br, bl))
        (tltrX, tltrY) = midpoint(tl, tr)

        (blbrX, blbrY) = midpoint(bl, br)

                        

        (tlblX, tlblY) = midpoint(tl, bl)
        (trbrX, trbrY) = midpoint(tr, br)

        cv2.circle(orig, (int(tltrX), int(tltrY)), 5, (255, 0, 0), -1)
        cv2.circle(orig, (int(blbrX), int(blbrY)), 5, (255, 0, 0), -1)
        cv2.circle(orig, (int(tlblX), int(tlblY)), 5, (255, 0, 0), -1)
        cv2.circle(orig, (int(trbrX), int(trbrY)), 5, (255, 0, 0), -1)

# draw lines between the midpoints
        cv2.line(orig, (int(tltrX), int(tltrY)), (int(blbrX), int(blbrY)),
                (255, 0, 255), 2)
        cv2.line(orig, (int(tlblX), int(tlblY)), (int(trbrX), int(trbrY)),
                (255, 0, 255), 2)

dA = dist.euclidean((tltrX,tltrY), (blbrX, blbrY))
dB = dist.euclidean((tlblX,tlblY), (trbrX, trbrY))

known_distance = 40.0

#pixelsPerMetric = dB / 10
#print("pixel per metric value for 20inch of hight ={}".format(pixelsPerMetric))

if width == 0.0:
        
        height = dA / pixelsPerMetric
        width = dB / pixelsPerMetric
        print("height={}, width={}".format(dA, dB))
        print("height in cm ={}, width in cm ={}".format(height, width))
        print("pixel per metric value for 20inch of hight ={}".format(pixelsPerMetric))
        print("its a {}".format(shape))
        print("Distance from the camera is 40.0 cm")
        pixelsPerMetric = 0.0
        focal_length = (dB*known_distance)/ width

if focal_length != 0.0:
        
        pixelsPerMetric = dB / width
        height = dA / pixelsPerMetric
        #width = dB / pixelsPerMetric
        
        distance = (width*focal_length)/ dB
        print("height in cm ={}, width in cm ={}".format(height, width))
        print("pixel per metric value for current height hight ={}".format(pixelsPerMetric))
        print("its a {}".format(shape))
        print("Distance from the camera is {} cm".format(distance))
        

cv2.putText(orig, "Height = %.2fcm" % height,
        (image.shape[1] - 200, image.shape[0] - 25), cv2.FONT_HERSHEY_SIMPLEX,
        0.5, (0, 0, 0), 1)
cv2.putText(orig, "Width  = %.2fcm" % width,
        (image.shape[1] - 200, image.shape[0] - 40), cv2.FONT_HERSHEY_SIMPLEX,
        0.5, (0, 0, 0), 1)
cv2.putText(orig, "Distance from the Camera = %.2fcm" % distance,
        (image.shape[1] - 360, image.shape[0] - 10), cv2.FONT_HERSHEY_SIMPLEX,
        0.5, (0,0,0), 1)
cv2.putText(orig, "Its a  {}" .format(shape),
        (image.shape[1] - 200, image.shape[0] - 60), cv2.FONT_HERSHEY_SIMPLEX,
        0.5, (0,0,0), 1)



cv2.imshow("image", orig)
#cv2.waitKey(0)
if cv2.waitKey(1) & 0xFF == ord('l'):
        width = 0.0
        focal_length = 0.0
        pixelsPerMetric = 16.71428


if cv2.waitKey(1) & 0xFF == ord('w'):
        break
cv2.destroyAllWindows()        
