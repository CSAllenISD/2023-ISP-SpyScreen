import cv2

cap = cv2.VideoCapture(0)

while True:
    ret, frame = cap.read()
    
    if not ret:
        print("Error reading frame from camera")
        break
        
    cv2.imshow("Video", frame)
    
    key = cv2.waitKey(1)
    if key == 27:
        # Press 'ESC' to exit
        break

cap.release()
cv2.destroyAllWindows()
