import cv2
from deepface import DeepFace
import os

#setup lol
detector = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
<<<<<<< HEAD
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
=======
cap = cv2.VideoCapture(0)

while True:
    ret, frame = cap.read()
    
    if not ret or frame is None:
        continue
    
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    detected_faces = detector.detectMultiScale(gray, scaleFactor=1.2, minNeighbors=5)

    if len(detected_faces) == 1:
        cv2.imwrite(os.path.join("./facialRec/faces", "user.jpg"), frame)
        break

>>>>>>> c36b7af5857c65c89d0b715ac83b2f669d1126e1
    cv2.imshow('Video', frame)
    #how to escape
    key = cv2.waitKey(1)
    if key == 27:
        break

cap.release()
cv2.destroyAllWindows()