import cv2

# Create a VideoCapture object to access the default camera
cap = cv2.VideoCapture(0)

# Check if the camera is opened successfully
if not cap.isOpened():
    print("Error opening the camera")
    exit()

# Keep capturing frames from the camera until user presses 'q' key
while True:
    # Read a frame from the camera
    ret, frame = cap.read()

    # Check if the frame was successfully captured
    if not ret:
        print("Error capturing the frame")
        break

    # Display the frame in a window named "Webcam"
    cv2.imshow("Webcam", frame)

    # Wait for user to press 'q' key to exit
    if cv2.waitKey(1) == ord('q'):
        break

# Release the camera and close all windows
cap.release()
cv2.destroyAllWindows()
