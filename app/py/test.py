# import the opencv library
import cv2
# from matplotlib import pyplot as plt
# cap = cv2.VideoCapture(1)
# ret, frame = cap.read(1)
# print(ret)
# plt.imshow(frame)
# cap.release()
# def take_photo():
#     cap = cv2.VideoCapture(1)
#     ret, frame = cap.read()
#     cv2.imwrite('webcamphoto.jpg', frame)
#     cap.release()
# take_photo()
  
# define a video capture object
vid = cv2.VideoCapture(1)
  
while(True):
      
    # Capture the video frame
    # by frame
    ret, frame = vid.read()
  
    # Display the resulting frame
    cv2.imshow('frame', frame)
      
    # the 'q' button is set as the
    # quitting button you may use any
    # desired button of your choice
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
  
# # After the loop release the cap object
# vid.release()
# # Destroy all the windows
# cv2.destroyAllWindows()