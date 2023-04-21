import cv2
from deepface import DeepFace
import os

# Create a directory to store the captured images
if not os.path.exists("faces"):
    os.makedirs("faces")

# Load the face detector
detector = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

# Open the default camera
cap = cv2.VideoCapture(0)

while True:
    # Capture a frame from the camera
    ret, frame = cap.read()

    # Detect faces in the frame using the Deepface face recognition model
    detected_faces = DeepFace.extract_faces(frame, detector_backend='opencv', enforce_detection="False")

    # If a face is detected, save the image to the 'faces' directory and exit the loop
    if len(detected_faces) > 0:
        cv2.imwrite(os.path.join("faces", "face.png"), frame)
        break

    # Display the frame
    cv2.imshow('Video', frame)

    # Exit the loop if the 'q' key is pressed
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release the camera and close the window
cap.release()
cv2.destroyAllWindows()
