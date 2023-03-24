# Import
import numpy as np
import cv2
import math
import pytesseract
from PIL import Image
from matplotlib import pyplot as plt


# display image
def display(im_path):
    dpi = 80
    im_data = plt.imread(im_path)

    height, width = im_data.shape[:2]

    # What size does the figure need to be in inches to fit the image?
    figsize = width / float(dpi), height / float(dpi)

    # Create a figure of the right size with one axes that takes up the full figure
    fig = plt.figure(figsize=figsize)
    ax = fig.add_axes([0, 0, 1, 1])

    # Hide spines, ticks, etc.
    ax.axis('off')

    # Display the image.
    ax.imshow(im_data, cmap='gray')

    plt.show()


# Image File
image_file_path = "permit.png"  # Changed this image file path
image_data = cv2.imread(image_file_path)
display(image_file_path)

# Defining the event listener (callback function)
drawing = False
ix, iy = -1, -1
coordinates = []


def draw_rectanlge(event, x, y, flags, param):
    """ Draw rectangle on mouse click and drag """
    global ix, iy, drawing, mode, coordinates
    # if the left mouse button was clicked, record the starting and set the drawing flag to True
    if event == cv2.EVENT_LBUTTONDOWN:
        drawing = True
        ix, iy = x, y
        coordinates = [(x, y)]

        # mouse is being moved, draw rectangle
    elif event == cv2.EVENT_MOUSEMOVE:
        if drawing == True:
            cv2.rectangle(image, (ix, iy), (x, y), (255, 255, 0), -1)

    # if the left mouse button was released, set the drawing flag to False
    elif event == cv2.EVENT_LBUTTONUP:
        coordinates.append((x, y))
        cv2.imshow("image", image)
        drawing = False


# load the image, clone it, and set up the mouse callback function
image = cv2.imread(image_file_path)
image_copy = image.copy()
cv2.namedWindow("image")

# keep looping until the 'q' key is pressed
while True:
    # display the image and wait for a keypress
    cv2.imshow("image", image)
    cv2.setWindowProperty("image", cv2.WND_PROP_TOPMOST, 1)
    cv2.setMouseCallback("image", draw_rectanlge)

    key = cv2.waitKey(1) & 0xFF

    if key == 13:  # If 'enter' is pressed, apply OCR
        break

    if key == ord("c"):  # Clear the selection when 'c' is pressed
        image = image_copy.copy()
name = image_file_path
image_path_roi = "temp/" + image_file_path  # Changed this image file path
if len(coordinates) == 2:
    image_roi = image_copy[coordinates[0][1]:coordinates[1][1], coordinates[0][0]:coordinates[1][0]]
    cv2.imshow("Selected Region of Interest - Press any key to proceed", image_roi)

    cv2.imwrite(image_path_roi, image_roi)
    cv2.waitKey(0)

# closing all open windows
cv2.destroyAllWindows()

display(image_path_roi)

# Image processing

# GrayScale
image_cv2 = cv2.imread(image_path_roi)


def grayscale(image):
    return cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)


gray_image = grayscale(image_cv2)
gray_image_file = "temp/" + "gray_" + image_file_path  # Changed this image file path
cv2.imwrite(gray_image_file, gray_image)
display(gray_image_file)

# OCR

ocr_result = pytesseract.image_to_string(cv2.imread("temp/gray_permit.png"))  # Changed this image file path
ocr_result

string_result_ocr_result = ocr_result.replace('\n', ' ')
string_result_ocr_result = " ".join(string_result_ocr_result.split())
string_result_ocr_result = string_result_ocr_result.replace('_', '')
print(string_result_ocr_result)
