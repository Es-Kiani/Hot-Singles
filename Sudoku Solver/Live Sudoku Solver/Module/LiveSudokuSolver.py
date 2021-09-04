import cv2 as cv
import matplotlib.pyplot as plt
import numpy as np
import pytesseract



class LiveSudokuSolver:
    def __init__(self, webcam_URL):
        self.webcam_URL = webcam_URL
        return


    def run(self, puzzle):
        img = cv.imread(puzzle,0)
        
        img_bin2 = 255-img
        thresh1, img_bin_otsu  = cv.threshold(img_bin2, 128, 255, cv.THRESH_BINARY | cv.THRESH_OTSU)

        kernel = cv.getStructuringElement(cv.MORPH_RECT, (2, 2))

        vertical_kernel = cv.getStructuringElement(cv.MORPH_RECT, (1, img.shape[1]//150))
        vertical_eroded_image = cv.erode(img_bin_otsu, vertical_kernel, iterations=25)

        horizontal_kernel = cv.getStructuringElement(cv.MORPH_RECT, (img.shape[1]//150, 1))
        horizontal_eroded_image = cv.erode(img_bin_otsu, horizontal_kernel, iterations=25)

        vertical_lines = cv.dilate(vertical_eroded_image, vertical_kernel, iterations=25)
        horizontal_lines = cv.dilate(horizontal_eroded_image, horizontal_kernel, iterations=25)

        vertical_horizontal_lines = cv.addWeighted(vertical_lines, 0.5, horizontal_lines, 0.5, 0.0)
        vertical_horizontal_lines = cv.erode(~vertical_horizontal_lines, kernel, iterations=3)

        thresh, vertical_horizontal_lines = cv.threshold(vertical_horizontal_lines,128,255, cv.THRESH_BINARY | cv.THRESH_OTSU)
        b_image = cv.bitwise_not(cv.bitwise_xor(img,vertical_horizontal_lines))

        cnts, hierarchy = cv.findContours(vertical_horizontal_lines, cv.RETR_TREE, cv.CHAIN_APPROX_SIMPLE)

        boundingBoxes = [cv.boundingRect(c) for c in cnts]
        (contours, boundingBoxes) = zip(*sorted(zip(cnts, boundingBoxes), key=lambda x:x[1][1]))

        boxes = []
        for contour in contours:
            x, y, w, h = cv.boundingRect(contour)
            if (w<1000 and h<500):
                image = cv.rectangle(img,(x,y),(x+w,y+h),(0,255,0),2)
                boxes.append([x,y,w,h])

        rows=[]
        columns=[]
        heights = [boundingBoxes[i][3] for i in range(len(boundingBoxes))]
        mean = np.mean(heights)
        columns.append(boxes[0])
        previous=boxes[0]
        for i in range(1,len(boxes)):
            if(boxes[i][1]<=previous[1]+mean/2):
                columns.append(boxes[i])
                previous=boxes[i]
                if(i==len(boxes)-1):
                    rows.append(columns)
            else:
                rows.append(columns)
                columns=[]
                previous = boxes[i]
                columns.append(boxes[i])

        total_cells=0
        for i in range(len(rows)):
            if len(rows[i]) > total_cells:
                total_cells = len(rows[i])

        center = [int(rows[i][j][0]+rows[i][j][2]/2) for j in range(len(rows[i])) if rows[0]]
        center = np.array(center)
        center.sort()

        boxes_list = []
        for i in range(len(rows)):
            l=[]
            for k in range(total_cells):
                l.append([])
            for j in range(len(rows[i])):
                diff = abs(center-(rows[i][j][0]+rows[i][j][2]/4))
                minimum = min(diff)
                indexing = list(diff).index(minimum)
                l[indexing].append(rows[i][j])
            boxes_list.append(l)

        dataframe_final=[]
        for i in range(len(boxes_list)):
            for j in range(len(boxes_list[i])):
                s=''
                if(len(boxes_list[i][j])==0):
                    dataframe_final.append(' ')
                else:
                    for k in range(len(boxes_list[i][j])):
                        y,x,w,h = boxes_list[i][j][k][0],boxes_list[i][j][k][1], boxes_list[i][j][k][2],boxes_list[i][j][k][3]

                        roi = b_image[x:x+h, y:y+w]
                        
                        kernel = cv.getStructuringElement(cv.MORPH_RECT, (2, 1))
                        border = cv.copyMakeBorder(roi,2,2,2,2, cv.BORDER_CONSTANT, value=[255,255])
                        resizing = cv.resize(border, None, fx=2, fy=2, interpolation=cv.INTER_CUBIC)
                        dilation = cv.dilate(resizing, kernel,iterations=1)
                        erosion = cv.erode(dilation, kernel,iterations=2)
                        out = pytesseract.image_to_string(erosion)
##                        if(len(out)==0):
##                            out = pytesseract.image_to_string(erosion)
                        s += " " + out
                    dataframe_final.append(s)
        print(dataframe_final)
            

        plotting = plt.imshow(image, cmap='gray')
        plt.title("Img")
        plt.show()
        
        return



if __name__ == "__main__":
    webcam_URL = "https://192.168.1.13:8569/video"
    puzzle1 = "../Simple Sudoku.JPG"
    puzzle2 = "../Simple Sudoku.PNG"
##    LiveSudokuSolver(webcam_URL).run()
    LiveSudokuSolver(webcam_URL).run(puzzle2)



