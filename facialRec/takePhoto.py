import cv2
from deepface import DeepFace
import os

detector = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
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

    cv2.imshow('Video', frame)

    key = cv2.waitKey(1)
    if key == 27:
        break

cap.release()
cv2.destroyAllWindows()
