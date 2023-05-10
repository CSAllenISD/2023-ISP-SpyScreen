# pip install -r requirements.txt
import threading
import cv2
import os
import re
import numpy as np
from deepface import DeepFace
from deepface.commons import functions

#gets the webcam and stuff lol
cap = cv2.VideoCapture(2, cv2.CAP_DSHOW)

cap.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

#setup, get file and get username
counter = 0
face_match = False
file = "faces/user.png"
reference_img = cv2.imread(file)
regex_pattern = '[\w-]+?(?=\.)'
result = re.search(regex_pattern, file)
name = result.group().capitalize()

#import face recognition dependency from file
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

#defines function to check face against file
def check_face(frame):
    global face_match
    try:
        if DeepFace.verify(frame, reference_img.copy())['verified']:
            face_match = True
        else:
            face_match = False
    except ValueError:
        face_match = False
    
#while video is running
while True:
    ret, frame = cap.read()
    #if the frame was successfully read by opencv
    if ret: 
        #convert to gray for faster comparisons
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        #editable parameters for face detection.. makes it easier or harder
        faces = face_cascade.detectMultiScale(gray, scaleFactor=1.5, minNeighbors=50)
        #only compares faces every 30 frames to save processor from dying
        if counter % 60 == 0:
            try:
                threading.Thread(target=check_face, args=(frame.copy(),)).start()
            except ValueError:
                pass
        counter += 1
        
        #converts frames back to color to display
        rgb_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        #get data from face that is detected
        faces = functions.extract_faces(rgb_frame.copy(), detector_backend='opencv', enforce_detection=False)
        
        #put rectangle on any face detected
        for face in faces:
            box = face[1]
            (x, y, w, h) = box['x'], box['y'], box['w'], box['h']
            if counter % 30 == 0:
                print(faces)
            if face_match:
                cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)
                cv2.putText(frame, name, (x, y + h + 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 1)
            else:
                cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 0, 255), 2)
                cv2.putText(frame, "UNKNOWN", (x, y + h + 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255), 1)
                
        #shows webcam            
        cv2.imshow("Face Recognition", frame)
        
    #quits once we press esc
    key = cv2.waitKey(1)
    if key == 27:
        break
    
cv2.destroyAllWindows()
cap.release()