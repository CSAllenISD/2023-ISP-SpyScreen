import cv2
from deepface import DeepFace
import os

#setup lol
detector = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
cap = cv2.VideoCapture(1)
counter = 0
countdown = 5

while True:
    ret, frame = cap.read()
    detected_faces = DeepFace.extract_faces(frame, detector_backend='opencv', enforce_detection=False)
    
    #takes photo when face detected
    if detected_faces[0]['facial_area']['x'] != 0 or detected_faces[0]['facial_area']['y'] != 0:
        if counter == 0:
            print("Face Detected! Don't move!")
        counter += 1
        if counter % 6 == 0:
            print(str(countdown) + "...")
            countdown -= 1
        if counter % 30 == 0:
            print("Done!")
            cv2.imwrite(os.path.join("./facialRec/faces", "user.png"), frame)
            break
    #displays video
    cv2.imshow('Video', frame)
    #how to escape
    key = cv2.waitKey(1)
    if key == 27:
        break

cap.release()
cv2.destroyAllWindows()