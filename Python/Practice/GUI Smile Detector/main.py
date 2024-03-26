import cv2 as cv
from kivy.app import App
from kivy.uix.widget import Widget
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.image import Image
from kivy.uix.button import Button
from kivy.clock import Clock
from kivy.graphics.texture import Texture

class LiveDetector:
    # global detecting
    detecting = False

    def __init__(self, faceXML, smileXML, webcamURL= 0):
        try:
            self.face_Detector = cv.CascadeClassifier(
                cv.data.haarcascades + faceXML)
            self.smile_Detector = cv.CascadeClassifier(
                cv.data.haarcascades + smileXML)
            self.webcam = self._connect_Webcam(webcamURL)
        except:
            raise FileNotFoundError(
                "Could Not Open XML Files...!")

    def detect(self, webcamURL=0):
        if self.detecting == False:
            return

        try:
            self.isRead, self.RGB_Frame = self.webcam.read()
            if not self.isRead:
                raise ConnectionAbortedError(
                    "Connection To Your Webcam Is Abort...!")
            self.GRY_Frame = cv.cvtColor(self.RGB_Frame, cv.COLOR_BGR2GRAY)

            for x, y, w, h in self._Get_FaceCoords(self.GRY_Frame, 1.6, 5):
                cv.rectangle(self.RGB_Frame,
                             (x, y), (x+w, y+h), (0, 255, 0), 2)

                if self._isExistSmile(self.GRY_Frame[x-15:x+w+15, y-15:y+h+15], 1.35, 3):
                    cv.putText(self.RGB_Frame, "Smiling",
                               (x, y+h+25), cv.FONT_HERSHEY_PLAIN, 2, (0, 255, 0))
        except:
            raise RuntimeError("An Error Occurred When Detecting...!")

        try:
            buf1 = cv.flip(self.RGB_Frame, 0)
            buf = buf1.tostring()
            texture1 = Texture.create(
                size=(self.RGB_Frame.shape[1], self.RGB_Frame.shape[0]), colorfmt='bgr')
            texture1.blit_buffer(buf, colorfmt='bgr', bufferfmt='ubyte')
            BoxGUI.Set_Video_Texture(texture1)
        except:
            raise RuntimeError("Could Not Send Frame To GUI Layout...!")

    def _connect_Webcam(self, webcamURL):
        try:
            self.webcam = cv.VideoCapture(webcamURL)
            return self.webcam
        except:
            raise ConnectionAbortedError(
                "Connection To Your Webcam Is Abort...!")

    def _Get_FaceCoords(self, frame, scaleFactor=1.1, minNeighbors=1):
        self.face_Coords = self.face_Detector.detectMultiScale(
            frame, scaleFactor, minNeighbors)
        return self.face_Coords

    def _isExistSmile(self, face, scaleFactor=1.1, minNeighbors=1):
        self.smile_Coords = self.smile_Detector.detectMultiScale(
            face, scaleFactor, minNeighbors)
        return False if len(self.smile_Coords) == 0 else True

    def stop(self):
        self.webcam.release()
        cv.destroyAllWindows()
        return


face_xml = "haarcascade_frontalface_default.xml"
smile_xml = "./haarcascade_smile.xml"





class MyBoxLayout(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(self, **kwargs)
        global video
        global detector
        detector = LiveDetector(face_xml, smile_xml, 0)
        
        self.orientation = "vertical"
        
        video = Image()
        self.startBtn = Button(text="Start", on_release=self._startAction())
        self.stopBtn = Button(text="Stop", on_release=self._stopAction())

        self.add_widget(self.video)
        self.add_widget(self.startBtn)
        self.add_widget(self.stopBtn)
        return

    def _startAction(self):
        if detector.detecting == False:
            detector.detecting = True
            Clock.schedule_interval(detector.detect(), 1.0/30.0)
        else:
            return

    def _stopAction(self):
        if detector.detecting == True:
            detector.detecting = False
            detector.detecting.stop()
        else:
            return

    def Set_Video_Texture(self, got_Texture):
        video.texture = got_Texture
        
        
class SmileDetectorApp(App):
    pass


SmileDetectorApp().run()
