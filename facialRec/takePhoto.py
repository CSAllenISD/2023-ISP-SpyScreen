import cv2
from deepface import DeepFace
import os

detector = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
cap = cv2.VideoCapture(1)

while True:
    ret, frame = cap.read()
    detected_faces = DeepFace.extract_faces(frame, detector_backend='opencv', enforce_detection="False")

    if len(detected_faces) > 0:
        cv2.imwrite(os.path.join("./facialRec/faces", "user.png"), frame)
        break

    cv2.imshow('Video', frame)

    key = cv2.waitKey(1)
    if key == 27:
        break

cap.release()
cv2.destroyAllWindows()
