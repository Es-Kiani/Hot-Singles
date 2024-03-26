from SmileDetector import LiveDetector
from kivy.app import App
from kivy.uix.widget import Widget
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.image import Image
from kivy.clock import Clock
from kivy.graphics.texture import Texture


class SmileDetectorApp(App):
    def __init__(self, faceXML, smileXML, webcamURL=0):
        global detector
        detector = LiveDetector(faceXML, smileXML, webcamURL)
        return


class MyBoxLayout(BoxLayout, SmileDetectorApp, LiveDetector):
    def __init__(self, **kwargs):
        super().__init__(self, **kwargs)
        global video
        
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


def run():
    SmileDetectorApp().run()
    return
