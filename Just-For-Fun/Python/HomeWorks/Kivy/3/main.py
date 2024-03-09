import cv2 as cv
from kivy.app import App
from kivy.uix.widget import Widget
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.image import Image
from kivy.uix.button import Button
from kivy.clock import Clock
from kivy.graphics.texture import Texture


#                if self._isExistSmile(self.GRY_Frame[x-15:x+w+15, y-15:y+h+15], 1.35, 3):
#                    cv.putText(self.RGB_Frame, "Smiling",
#                               (x, y+h+25), cv.FONT_HERSHEY_PLAIN, 2, (0, 255, 0))

#            buf1 = cv.flip(self.RGB_Frame, 0)
#            buf = buf1.tostring()
#            texture1 = Texture.create(
#                size=(self.RGB_Frame.shape[1], self.RGB_Frame.shape[0]), colorfmt='bgr')
#            texture1.blit_buffer(buf, colorfmt='bgr', bufferfmt='ubyte')
#            BoxGUI.Set_Video_Texture(texture1)
#    def _isExistSmile(self, face, scaleFactor=1.1, minNeighbors=1):
#        self.smile_Coords = self.smile_Detector.detectMultiScale(
#            face, scaleFactor, minNeighbors)
#        return False if len(self.smile_Coords) == 0 else True

#    def stop(self):
#        self.webcam.release()
#        cv.destroyAllWindows()
#        return

class ex(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.orientation = "vertical"
        self.spacing = "10dp"
        
#        self.video = Image(pos_hint= {"left": 1})
        self.startBtn = Button(text="Start", size_hint= (None, None), size= ("75dp", "55dp"), pos_hint= {"center_x": 0.48})
        self.stopBtn = Button(text="Stop", size_hint= (None, None), size= ("75dp", "55dp"), pos_hint= {"center_x": 0.48})

#        self.add_widget(self.video)
        self.add_widget(self.startBtn)
        self.add_widget(self.stopBtn)
        
        
#        face_xml = "haarcascade_frontalface_default.xml"
#        smile_xml = "./haarcascade_smile.xml"
        
        
#        self.face_Detector = cv.CascadeClassifier(cv.data.haarcascades + faceXML)
#        self.smile_Detector = cv.CascadeClassifier(cv.data.haarcascades + smileXML)
                
        self.webcam = cv.VideoCapture(0)

        self.isRead, self.RGB_Frame = self.webcam.read()
#        self.GRY_Frame = cv.cvtColor(self.RGB_Frame, cv.COLOR_BGR2GRAY)
        
#        self.face_Coords = self.face_Detector.detectMultiScale(frame, scaleFactor= 1.6, minNeighbors= 5)
#        for x, y, w, h in self.face_Coords:
#           cv.rectangle(self.RGB_Frame, (x, y), (x+w, y+h), (0, 255, 0), 2)
            

        Clock.schedule_interval(self.update, 1.0/30.0)
            
#            self.key = cv.waitKey(1)
#            if self.key == 81 or self.key == 113:
#                break
        self.webcam.release()
        cv.destroyAllWindows()
        
     
    def update(self, dt):
        while True:
            buf1 = cv.flip(self.RGB_Frame, 0)
            buf = buf1.tobytes()
            texture1 = Texture.create(size=(self.RGB_Frame.shape[1], self.RGB_Frame.shape[0]), colorfmt='bgr')
            texture1.blit_buffer(buf, colorfmt='bgr', bufferfmt='ubyte')
            self.texture = texture1
            cv.waitKey(1)
        return self.texture
    
class exApp(App):
    pass


exApp().run()