import threading
import cv2
import os
import re
import numpy as np
from deepface import DeepFace
from deepface.commons import functions

cap = cv2.VideoCapture(0, cv2.CAP_DSHOW)

cap.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

counter = 0
face_match = False
file = "faces/drew.jpg"
reference_img = cv2.imread(file)
regex_pattern = '[\w-]+?(?=\.)'
result = re.search(regex_pattern, file)
name = result.group().capitalize()

face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

def check_face(frame):
    global face_match
    try:
        if DeepFace.verify(frame, reference_img.copy())['verified']:
            face_match = True
        else:
            face_match = False
    except ValueError:
        face_match = False

def draw_faces(frame):
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY) # convert to grayscale
    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.5, minNeighbors=100)

    # detect faces
    rgb_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB) # convert BGR to RGB
    faces = functions.extract_faces(rgb_frame.copy(), enforce_detection=False)

    if len(faces) > 0:
        face = faces[0]
        box = face[1]
        (x, y, w, h) = box['x'], box['y'], box['w'], box['h']
        if face_match:
            cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)
            cv2.putText(frame, name, (x, y + h + 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 1)
        else:
            cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 0, 255), 2)
            cv2.putText(frame, "UNKNOWN", (x, y + h + 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255), 1)

    cv2.imshow("Face Recognition", frame)

while True:
    ret, frame = cap.read()

    if ret:
        if counter % 30 == 0:
            threading.Thread(target=check_face, args=(frame.copy(),)).start()
        counter += 1

        threading.Thread(target=draw_faces, args=(frame.copy(),)).start()

    key = cv2.waitKey(1)
    if key == 27:
        break

cv2.destroyAllWindows()
cap.release()
